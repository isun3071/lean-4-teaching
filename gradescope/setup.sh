#!/usr/bin/env bash

apt-get install -y jq

curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y --default-toolchain leanprover/lean4:v4.34.0

# ~/.elan/bin/elan default leanprover/lean4:nightly

~/.elan/bin/lean --version

apt-get install -y python3 python3-pip python3-dev

# The autograder verifies submissions with Comparator
# (https://github.com/leanprover/comparator), which sandboxes the untrusted
# submission's build using landrun (https://github.com/Zouuup/landrun). Build
# landrun from source and put it on PATH; Comparator falls back to searching
# PATH for it (or COMPARATOR_LANDRUN can point at a specific binary instead).
#
# landrun's go.mod requires Go 1.24+; the `golang-go` apt package on Gradescope's
# Ubuntu 22.04 base image is far too old to build it (and too old to even parse a
# go.mod requiring a version that new), so install a current Go toolchain directly
# from go.dev rather than via apt.
apt-get install -y git
GO_VERSION=$(curl -sSL https://go.dev/VERSION?m=text | head -1)
curl -sSL "https://go.dev/dl/${GO_VERSION}.linux-amd64.tar.gz" -o /tmp/go.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf /tmp/go.tar.gz
rm /tmp/go.tar.gz
export PATH="$PATH:/usr/local/go/bin"

git clone https://github.com/Zouuup/landrun /tmp/landrun
(cd /tmp/landrun && go build -o /usr/local/bin/landrun ./cmd/landrun)
rm -rf /tmp/landrun

# Go was installed solely to compile that one binary, and is dead weight afterwards --
# roughly 700MB of toolchain and module cache. It is not merely wasted disk: every byte
# left here is snapshotted into the image's Docker layer on each upload, and committing
# that layer is what makes a build sit at "building" long after the last command has
# printed. The Lean toolchain (~2.9GB) has to stay; this does not.
rm -rf /usr/local/go /root/go /root/.cache/go-build

cd /autograder/source

echo "=============== AUTOGRADER BUILD STAMP ==============="
cat build_stamp.txt 2>/dev/null || echo "(no build_stamp.txt -- zip predates stamping)"
echo "====================================================="

# The course project (lakefile.toml, lean-toolchain, the course prelude and the
# ProblemSets directory) ships inside the autograder zip and has already been
# extracted here by Gradescope. Nothing is cloned.
#
# The upstream shell instead fetched a course repo from GitHub at this point, and
# `run_autograder` re-pulled it on every submission. That made grading depend on a
# repo staying reachable and on whatever its default branch happened to point at
# mid-semester -- and forced the repo to be public, or a deploy key to be shipped and
# then shredded before the untrusted submission was elaborated. Shipping the files
# instead removes all of that: what a staff member tested locally is byte-for-byte
# what grades, and no credential ever enters the container.
#
# Lake still fetches this project's *dependencies* (the autograder itself, Comparator,
# lean4export, Mathlib) over the network here, at image-build time -- they are pinned in
# lake-manifest.json, so this resolves to the same revisions every build.
if [[ ! -f lakefile.toml ]]; then
  echo "ERROR: no lakefile.toml in /autograder/source." >&2
  echo "The zip must contain the course project at its root, alongside setup.sh and" >&2
  echo "run_autograder. Build it with gradescope/make_autograder.sh." >&2
  exit 1
fi

# Put the assignment stencil where the grader expects it *now*, so everything it needs
# is compiled here, while the image is being built.
#
# The grader copies the stencil into place itself on every run, and then compiles. But
# at grading time it is inside a container with a memory cap and an assignment timeout,
# and Lean compilation is the memory-hungry part of the whole pipeline -- so leaving it
# until then is what makes a submission fail for reasons that have nothing to do with
# the submission. Doing it here means the grading-time build finds everything current
# and does nothing.
#
# `AutograderTests` builds nothing without this: the stencil is the only module in it,
# and it is deliberately not shipped at that path in the zip (the grader regenerates it,
# and a stale copy would be worse than none). Its absence is also why the course library
# it imports, which the stencil and every submission depend on, would otherwise go
# uncompiled here too.
ASSIGNMENT_PATH=$(jq -r '.assignment_path' < config.json)
if [[ ! -f "$ASSIGNMENT_PATH" ]]; then
  echo "ERROR: assignment_path '$ASSIGNMENT_PATH' (from config.json) is not in the zip." >&2
  exit 1
fi

# Fetch Mathlib's prebuilt files for exactly the Mathlib modules this assignment imports,
# and nothing else.
#
# `lake exe cache get` with no arguments downloads all of Mathlib -- 8,322 modules, about
# 6 GB -- whatever the stencil uses, and every byte of it is then snapshotted into the
# image, which is what makes uploads slow. Given module names it fetches only those and
# what they import: 504 modules and 0.38 GB for `Mathlib.Basic.Real.Basic` (as measured on
# v4.33, where it was `Mathlib.Data.Real.Basic`), 1.13 GB for a
# problem set importing sixteen topic modules at once, and nothing at all for a problem set
# that does not import Mathlib.
#
# Imports are read from the stencil and from the course prelude, which the stencil may
# import. A submission can only import what these provide: a Mathlib module outside that
# set has no prebuilt file here, so the submission's header fails and it scores zero, with
# the grader's message saying it imported a module that does not exist.
MATHLIB_IMPORTS=$(cat "$ASSIGNMENT_PATH" CourseLib.lean CourseLib/*.lean 2>/dev/null \
  | grep -E '^[[:space:]]*import[[:space:]]' | tr -s ' \t' '\n' | grep -E '^Mathlib(\.|$)' \
  | sort -u || true)
if [[ -n "$MATHLIB_IMPORTS" ]]; then
  echo "Fetching Mathlib for:" $MATHLIB_IMPORTS
  ~/.elan/bin/lake exe cache get $MATHLIB_IMPORTS
  # The cache tool keeps a compressed copy of every file it downloaded. Once decompressed
  # into the build directory that copy is dead weight in the image.
  rm -rf ~/.cache/mathlib
else
  echo "Assignment imports no Mathlib; fetching none of it."
fi
mkdir -p autograder/AutograderTests
cp "$ASSIGNMENT_PATH" autograder/AutograderTests/Solution.lean

~/.elan/bin/lake build autograder AutograderTests comparator lean4export


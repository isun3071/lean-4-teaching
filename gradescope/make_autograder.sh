#!/usr/bin/env bash
# Builds the zip to upload to Gradescope.
#
# The zip is self-contained: it carries the course project (lakefile, toolchain pin,
# course prelude, problem sets) alongside the two scripts Gradescope requires. Nothing
# is cloned at grading time, so what you tested locally is exactly what grades, and no
# repository needs to be reachable -- or public -- for the autograder to work.
#
# Gradescope requires `setup.sh` and `run_autograder` at the *root* of the archive and
# cannot find them inside a folder, which is why the paths below are added individually
# from the repository root rather than by zipping a directory.
#
# Usage: make_autograder.sh [output.zip] [problem-set]
#
#   make_autograder.sh ps1.zip ProblemSets/PS1.lean
#
# The problem set defaults to `assignment_path` in gradescope/config.json. Naming one here
# overrides it for this zip only: the zip carries a config.json naming that problem set, and
# the one in the repository is left as it was.
#
# The archive's name is arbitrary. Gradescope's build does `ADD <upload> /tmp/autograder.zip`,
# a fixed destination, so whatever is uploaded is renamed before being unzipped; only the
# contents matter. Naming a build after its assignment is therefore safe, and keeps several
# around without one silently overwriting the next.

set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
root="$(cd "$here/.." && pwd)"

out="${1:-autograder.zip}"
case "$out" in
  *.zip) ;;
  *) out="$out.zip" ;;
esac
case "$out" in
  /*) zip_path="$out" ;;            # absolute path, used as given
  */*) zip_path="$root/$out" ;;     # contains a directory, relative to the repository
  *) zip_path="$here/$out" ;;       # bare name, alongside this script
esac

# Given relative to wherever this was started; resolved before moving to the root.
stencil_arg="${2:-}"
if [[ -n "$stencil_arg" ]]; then
  if [[ ! -f "$stencil_arg" ]]; then
    echo "ERROR: problem set '$stencil_arg' not found." >&2
    exit 1
  fi
  stencil_abs="$(cd "$(dirname "$stencil_arg")" && pwd)/$(basename "$stencil_arg")"
fi

cd "$root"

# The config.json that goes into the zip: the repository's, or a copy naming the problem set
# given on the command line.
config="gradescope/config.json"
if [[ -n "$stencil_arg" ]]; then
  stencil="${stencil_abs#"$root"/}"
  case "$stencil" in
    ProblemSets/*) ;;
    *) echo "ERROR: the problem set must be inside ProblemSets/ to travel in the zip; got '$stencil_arg'." >&2
       exit 1 ;;
  esac
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT
  python3 -c 'import json,sys; c=json.load(open(sys.argv[1])); c["assignment_path"]=sys.argv[2]; json.dump(c, open(sys.argv[3],"w"), indent=4)' \
    "$config" "$stencil" "$tmp/config.json"
  config="$tmp/config.json"
fi
stencil="$(python3 -c 'import json,sys;print(json.load(open(sys.argv[1]))["assignment_path"])' "$config")"

# `zip` updates an existing archive in place rather than replacing it, so a file removed
# here would otherwise linger in the zip from a previous build.
rm -f "$zip_path"

# A stamp identifying exactly which build this zip is, echoed by setup.sh during the
# image build and by run_autograder on every submission. Gradescope rebuilds its image
# only when a zip is uploaded, and "Rerun Autograder" reuses the existing one -- so a
# fix can sit in a rebuilt zip while every run still exercises an older image, and
# nothing on screen distinguishes the two. With the stamp, the build log and each
# submission's output both say which build produced them, and a stale image is obvious
# without needing a debug session to go looking.
{
  echo "build:    $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
  echo "commit:   $(git rev-parse --short HEAD 2>/dev/null || echo '(not a git checkout)')$(git diff --quiet 2>/dev/null || echo ' +uncommitted')"
  echo "problem set: $stencil"
} > gradescope/build_stamp.txt

# Scripts Gradescope invokes, flattened to the archive root.
zip -q -j "$zip_path" gradescope/setup.sh gradescope/run_autograder "$config" gradescope/build_stamp.txt

# The Lean project itself, at the archive root so that /autograder/source *is* the Lake
# package. `assignment_path` in config.json is resolved relative to this.
#
# `autograder/` is the grading engine, vendored into this repository and required by
# path rather than over the network, so it has to travel in the zip like any other
# source. Build output and the scratch files the grader regenerates per run are
# excluded -- they would be stale in the container, and the run recreates them.
zip -q -r "$zip_path" \
  lakefile.toml lean-toolchain lake-manifest.json CourseLib.lean CourseLib ProblemSets autograder \
  -x '*/.lake/*' '.lake/*' \
     'autograder/ComparatorGrading/*' 'autograder/AutograderTests/Solution.lean' \
     'autograder/.git/*' 

chmod +x gradescope/setup.sh gradescope/run_autograder

echo "Built $zip_path"
sed 's/^/  /' gradescope/build_stamp.txt
echo "  grading: $stencil"
echo
unzip -Z "$zip_path"

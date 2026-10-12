#!/usr/bin/env bash
# Grades a batch of test submissions against one stencil and checks each score.
#
# Usage: ./run_suite.sh STENCIL SUBMISSION...
#   ./run_suite.sh ProblemSets/Template.lean examples/*.lean
#
# Each submission states the score it should get on its first line, as
# `-- expect: 20/20`; files without that line are skipped. One line is printed per
# file, then a summary, and the exit status is nonzero if any score differs. Grading
# takes about a minute per file. To see why one differed, grade it alone:
#   lake exe autograder --local SUBMISSION STENCIL

set -uo pipefail

if [[ $# -lt 2 ]]; then
  sed -n '2,11s/^# \{0,1\}//p' "$0"
  exit 2
fi

# The grader runs from the repository root; resolve the arguments first so they can be
# given relative to wherever this was started.
stencil=$(realpath "$1"); shift
files=()
for f in "$@"; do files+=("$(realpath "$f")"); done
cd "$(dirname "$(realpath "$0")")"

ok=0 bad=0 skipped=0
for f in "${files[@]}"; do
  exp=$(sed -n '1s/^-- expect: \([0-9]*\)\/[0-9]*$/\1/p' "$f")
  if [[ -z "$exp" ]]; then
    skipped=$((skipped + 1))
    continue
  fi
  got=$(lake exe autograder --local "$f" "$stencil" 2>&1 \
    | grep -oE 'passed \([0-9.]+ points\)' | grep -oE '[0-9.]+' \
    | awk '{s += $1} END {printf "%d", s}')
  if [[ "$got" == "$exp" ]]; then
    mark=ok; ok=$((ok + 1))
  else
    mark=MISMATCH; bad=$((bad + 1))
  fi
  printf "%-30s expect %3s  got %3s  %s\n" "$(basename "$f" .lean)" "$exp" "$got" "$mark"
done

echo "$ok ok, $bad mismatched, $skipped skipped (no expect line)"
[[ $bad -eq 0 ]]

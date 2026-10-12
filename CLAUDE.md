# Notes for Claude sessions

A Gradescope autograder for Lean 4 proofs with tactic and theorem allowlists. `README.md`
is the user-facing reference; this file is what a new session needs to work on the code
without rediscovering it.

## Layout

```
ProblemSets/        stencils; make_autograder.sh only accepts stencils here
examples/           sample submissions against ProblemSets/Template.lean, `-- expect: N/M` first lines
CourseLib.lean, CourseLib/  library for problem sets without Mathlib: Shims.lean + Extras.lean
autograder/         grading engine, derived from robertylewis/lean4-autograder-main
  Main.lean         the grader (~1600 lines)
  AutograderLib.lean  the attributes stencils use
gradescope/         setup.sh, run_autograder, make_autograder.sh, config.json
run_suite.sh        grades files against a stencil and compares with their expect lines
```

Pinned to Lean and Mathlib **v4.34.0**, with Comparator at its v4.34.0 tag.

## How grading runs

1. `make_autograder.sh [name.zip] [stencil]` zips the project. The stencil argument
   overrides `assignment_path` in `gradescope/config.json`, for that zip only.
2. `setup.sh` runs at image build. It reads the `import Mathlib.*` lines of the stencil
   and of `CourseLib`, runs `lake exe cache get` on those modules alone (only their
   closure is fetched), then builds the grader, Comparator and lean4export.
3. `run_autograder` runs per submission. It logs to a file, runs the grader under a
   540 s timeout, and prints only `/tmp/proof_summary.txt` after a clean run, or the
   log after a failed one. With no results.json it synthesises one containing the log
   (exit 137 means out of memory).
4. `Main.lean`, in order:
   1. Elaborates the stencil, then the submission, in-process.
   2. A failed header with imports differing from the stencil's (`sameImports`) tells
      the student which imports to restore.
   3. Per graded exercise, `gradeSubmission` runs `brokenVerdict <|> tacticVerdict <|>
      theoremVerdict`; the first failure is final.
   4. Survivors go to Comparator, one invocation per exercise.
   5. Results are sorted into stencil order, and `@[gradedByHand]` entries are appended.

**Restrictions.** Each check reads the proof twice: the syntax tree, parsed with the
*stencil's* grammar (`parseCommandsOnly`), and the elaborated proof term.

- **Tactics:** `tacticKinds` → `collectTactics` → `tacticDisplayName` → `disallowedTactics`.
  - Fails closed on `containsMissing`: parse holes, which is what student-defined
    syntax leaves.
  - Requires a `by` block.
- **Helper lemmas:** `helperDeps` walks `getUsedConstants`.
  - Submission constants are mapped to their declaration by `declRoot?`.
  - Unchanged stencil declarations (`matchesStencil`) and other exercises are skipped.
  - Untraceable ones are refused.
- **Theorems:** `proofDeps` collects imported theorems in the term (the "receipt").
  - `identsIn` collects the names written in the exercise and the student's own
    helpers.
  - A theorem counts as cited only if it is on the receipt **and** written. The cited
    set is checked with `Name.isSuffixOf`.

**Files with errors** (`cleanSubmission`). Comparator rebuilds from source, and any
error fails the rebuild, so it gets a cleaned copy instead:

- a command whose errors are all in its proof keeps its statement with `:= sorry`;
- other erroring commands are dropped, and anything using a dropped declaration is cut
  back too, found in the source as well as the term;
- `#check`, `#eval` and `example` are dropped;
- a file without errors passes through unchanged.

**Output rules.**

- **Never mark a results entry `"visibility": "hidden"`.** Gradescope then withholds
  the student's total, even for a 0/0 entry. Anything for graders goes to stdout.
- **A clean run's stdout is only the proof summary.**
- **Student messages put one sentence per line.**

## Working locally

```bash
lake build && lake build autograder
lake exe autograder --local SUBMISSION STENCIL    # submission first
./run_suite.sh ProblemSets/Template.lean examples/*.lean
```

- **Don't edit `Main.lean` while a grade runs.** `lake exe` rebuilds on change.
- **`cleanSubmission` changes affect only submissions with compile errors.**

## Mathlib

- **v4.34 module names:** `Mathlib.Basic.Real.Basic` (formerly `Mathlib.Data.Real.Basic`)
  and `Mathlib.Basic.Logic.Basic` (formerly `Mathlib.Logic.Basic`).
  - The real-numbers module provides `nth_rewrite`, `grind` and `norm_num`.
  - The logic module needs `Mathlib.Tactic.NthRewrite` for `nth_rewrite`.
- **`import Mathlib` whole is killed at Gradescope's 6 GB.** Peaks: about 2.9 GB with
  `CourseLib`, 4.4 GB with ℝ.
- **`CourseLib.Shims` reimplements Mathlib names.** Never import `CourseLib` with
  Mathlib.

## Decisions

- **False positives are worse than false negatives.** The checks fail closed on
  anything they cannot fully see, but never reject a proof for plumbing the student did
  not write.
- **Accepted gaps:**
  - dot notation escapes the theorem check;
  - theorems that searching tactics find are governed only by the tactic list;
  - no sandbox on Gradescope's 4.14 kernel.

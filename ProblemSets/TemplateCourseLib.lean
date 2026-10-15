/-
# Template for a problem set without Mathlib

Same idea as `Template.lean`, but importing `CourseLib` instead of a slice of Mathlib.
Use this shape for a course that keeps to core Lean: the image downloads no Mathlib at
all, so it builds in seconds and grading peaks well under Gradescope's memory limit.

Build and upload exactly as for any other problem set:

    ./gradescope/make_autograder.sh ps1.zip ProblemSets/TemplateCourseLib.lean
-/

import CourseLib
import AutograderLib

-- `CourseLib` supplies `factorial`, `choose`, `choose_zero_right` and `well_ordering`
-- on top of core Lean, plus the classical logic laws under Mathlib's own names. Never
-- import it alongside Mathlib: it defines some of the same names.

@[autogradedProof 10, allowedTactics #["induction", "show", "rewrite", "rfl"]]
theorem choose_one (n : Nat) : choose n 1 = n := by
  sorry

@[autogradedProof 10, allowedTactics #["intro", "obtain", "exact"]]
theorem logic_law (p q : Prop) : p ∧ q → q := by
  sorry

/-
# Earlier problems taken as given

A problem may build on an earlier one, and gets credit even if the earlier one is left
unproven, as on paper: the grader checks it again taking the earlier problem as given.
This set tests that, and that a given cannot be made false by redefining what its
statement means. CI grades `examples/givens/` against it.
-/

import Mathlib.Basic.Real.Basic
import AutograderLib

def IsEven (n : ℤ) : Prop := ∃ k : ℤ, n = 2 * k

@[autogradedProof 5]
theorem even_step (n : ℤ) : IsEven n → IsEven (n + 2) := by
  sorry

@[autogradedProof 5]
theorem zero_to_two : IsEven 0 → IsEven 2 := by
  sorry

-- False on purpose: only a given made false could prove it.
@[autogradedProof 5]
theorem false_claim : (0 : ℤ) = 1 := by
  sorry

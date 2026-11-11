/-
# Requiring a method

`requiredTactics` and `requiredTheorems` make an exercise insist on a method, while the
other lists still say what else may be used alongside it. CI grades `examples/required/`
against this set.
-/

import Mathlib.Basic.Real.Basic
import AutograderLib

-- Must be proved by contradiction; the other tactics may be used alongside `by_contra`.
@[autogradedProof 5,
  allowedTactics #["intro", "obtain", "by_contra", "omega", "exact"],
  requiredTactics #["by_contra"]]
theorem no_half : ¬ ∃ n : ℕ, 2 * n = 1 := by
  sorry

-- Must cite `sq_nonneg`, though any other theorem is allowed.
@[autogradedProof 5,
  allowedTactics #["have", "exact"],
  requiredTheorems #["sq_nonneg"]]
theorem sq_sum_nonneg (a b : ℝ) : 0 ≤ a ^ 2 + b ^ 2 := by
  sorry

-- Must cite `not_le`. Writing it as `not_le.mp h` counts.
@[autogradedProof 5,
  allowedTactics #["exact", "rewrite"],
  requiredTheorems #["not_le"]]
theorem lt_of_not_le' (a b : ℝ) (h : ¬ a ≤ b) : b < a := by
  sorry

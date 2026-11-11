/-
# Requiring a method

`requiredTactics` and `requiredTheorems` make an exercise insist on a method, while the
other lists still say what else may be used alongside it. CI grades `examples/required/`
against this set.
-/

import Mathlib.Basic.Real.Basic
import AutograderLib

-- Must be proved by contradiction, though `exact lt_trans hab hbc` would do it directly.
-- The goal is not a negation on purpose: for `¬ P`, `intro` is itself proof by
-- contradiction, and requiring `by_contra` would only require the keyword.
@[autogradedProof 5,
  allowedTactics #["intro", "have", "exact", "by_contra", "rewrite"],
  allowedTheorems #["lt_trans", "not_lt", "lt_of_lt_of_le", "lt_irrefl", "absurd"],
  requiredTactics #["by_contra"]]
theorem lt_trans_by_contradiction (a b c : ℝ) (hab : a < b) (hbc : b < c) : a < c := by
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

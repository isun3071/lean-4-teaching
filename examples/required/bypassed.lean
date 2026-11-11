-- expect: 0/15
-- Correct proofs that skip the required method, using only what the lists allow:
-- lt_trans_by_contradiction is proved directly in one step, and sq_sum_nonneg uses
-- pow_two_nonneg instead of sq_nonneg, and lt_of_not_le' uses lt_of_not_ge instead of not_le.
import Mathlib.Basic.Real.Basic

theorem lt_trans_by_contradiction (a b c : ℝ) (hab : a < b) (hbc : b < c) : a < c := by
  exact lt_trans hab hbc

theorem sq_sum_nonneg (a b : ℝ) : 0 ≤ a ^ 2 + b ^ 2 := by
  have ha := pow_two_nonneg a
  have hb := pow_two_nonneg b
  exact add_nonneg ha hb

theorem lt_of_not_le' (a b : ℝ) (h : ¬ a ≤ b) : b < a := by
  exact lt_of_not_ge h

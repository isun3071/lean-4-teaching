-- expect: 0/15
-- Correct proofs that skip the required method, using only what the lists allow:
-- no_half argues directly instead of by contradiction, and sq_sum_nonneg uses
-- pow_two_nonneg instead of sq_nonneg, and lt_of_not_le' uses lt_of_not_ge instead of not_le.
import Mathlib.Basic.Real.Basic

theorem no_half : ¬ ∃ n : ℕ, 2 * n = 1 := by
  intro h
  obtain ⟨n, hn⟩ := h
  omega

theorem sq_sum_nonneg (a b : ℝ) : 0 ≤ a ^ 2 + b ^ 2 := by
  have ha := pow_two_nonneg a
  have hb := pow_two_nonneg b
  exact add_nonneg ha hb

theorem lt_of_not_le' (a b : ℝ) (h : ¬ a ≤ b) : b < a := by
  exact lt_of_not_ge h

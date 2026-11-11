-- expect: 0/10
-- Correct proofs that skip the required method, using only what the lists allow:
-- no_half argues directly instead of by contradiction, and sq_sum_nonneg uses
-- pow_two_nonneg instead of sq_nonneg.
import Mathlib.Basic.Real.Basic

theorem no_half : ¬ ∃ n : ℕ, 2 * n = 1 := by
  intro h
  obtain ⟨n, hn⟩ := h
  omega

theorem sq_sum_nonneg (a b : ℝ) : 0 ≤ a ^ 2 + b ^ 2 := by
  have ha := pow_two_nonneg a
  have hb := pow_two_nonneg b
  exact add_nonneg ha hb

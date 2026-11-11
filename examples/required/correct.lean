-- expect: 10/10
-- Each problem uses the method it requires.
import Mathlib.Basic.Real.Basic

theorem no_half : ¬ ∃ n : ℕ, 2 * n = 1 := by
  by_contra h
  obtain ⟨n, hn⟩ := h
  omega

theorem sq_sum_nonneg (a b : ℝ) : 0 ≤ a ^ 2 + b ^ 2 := by
  have ha := sq_nonneg a
  have hb := sq_nonneg b
  exact add_nonneg ha hb

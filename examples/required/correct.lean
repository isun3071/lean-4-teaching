-- expect: 15/15
-- Each problem uses the method it requires; lt_of_not_le' names not_le as not_le.mp.
import Mathlib.Basic.Real.Basic

theorem lt_trans_by_contradiction (a b c : ℝ) (hab : a < b) (hbc : b < c) : a < c := by
  by_contra h
  rewrite [not_lt] at h
  have hba := lt_of_lt_of_le hbc h
  have haa := lt_trans hab hba
  exact absurd haa (lt_irrefl a)

theorem sq_sum_nonneg (a b : ℝ) : 0 ≤ a ^ 2 + b ^ 2 := by
  have ha := sq_nonneg a
  have hb := sq_nonneg b
  exact add_nonneg ha hb

theorem lt_of_not_le' (a b : ℝ) (h : ¬ a ≤ b) : b < a := by
  exact not_le.mp h

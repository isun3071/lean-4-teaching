-- expect: 10/15
-- lt_trans_by_contradiction breaks two rules at once (a tactic off the list, and no
-- by_contra), and both are reported in one message.
import Mathlib.Basic.Real.Basic

theorem lt_trans_by_contradiction (a b c : ℝ) (hab : a < b) (hbc : b < c) : a < c := by
  apply lt_trans hab
  exact hbc

theorem sq_sum_nonneg (a b : ℝ) : 0 ≤ a ^ 2 + b ^ 2 := by
  have ha := sq_nonneg a
  have hb := sq_nonneg b
  exact add_nonneg ha hb

theorem lt_of_not_le' (a b : ℝ) (h : ¬ a ≤ b) : b < a := by
  exact not_le.mp h

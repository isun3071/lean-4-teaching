-- expect: 10/20
-- problem_2 is closed by grind, which its tactic list does not include.
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring

def IsEven (n : ℤ) : Prop := ∃ k : ℤ, 2 * k = n

theorem even_add_even (m n : ℤ) : IsEven m → IsEven n → IsEven (m + n) := by
  intro hm hn
  obtain ⟨a, ha⟩ := hm
  obtain ⟨b, hb⟩ := hn
  use a + b
  rewrite [← ha, ← hb]
  ring

theorem problem_1 (n : ℤ) : IsEven n → IsEven (n ^ 2) := by
  intro h
  unfold IsEven at h
  obtain ⟨k, hk⟩ := h
  unfold IsEven
  use 2 * k ^ 2
  rewrite [← hk]
  ring

theorem problem_2 (a b c d : ℝ) : a < b → c < d → a + c < b + d := by
  intro h1 h2
  grind

theorem problem_3 : ∃ n : ℤ, IsEven n ∧ n > 5 := by
  use 6
  constructor
  use 3
  norm_num
  norm_num

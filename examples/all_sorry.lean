-- expect: 0/20
-- The handout as students receive it, unchanged.
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
  sorry

theorem problem_2 (a b c d : ℝ) : a < b → c < d → a + c < b + d := by
  sorry

theorem problem_3 : True := by
  sorry

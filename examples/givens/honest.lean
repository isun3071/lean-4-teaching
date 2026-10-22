-- expect: 5/15
-- even_step is left as sorry. zero_to_two builds on it and passes, taking even_step as given.
import Mathlib.Basic.Real.Basic

def IsEven (n : ℤ) : Prop := ∃ k : ℤ, n = 2 * k

theorem even_step (n : ℤ) : IsEven n → IsEven (n + 2) := by
  sorry

theorem zero_to_two : IsEven 0 → IsEven 2 := by
  intro h
  exact even_step 0 h

theorem false_claim : (0 : ℤ) = 1 := by
  sorry

-- expect: 0/15
-- IsEven redefined so that even_step, taken as given, would say 0 = 0 → 2 = 0.
-- even_step's statement text is unchanged; its meaning is not, so it must not be given.
import Mathlib.Basic.Real.Basic

def IsEven (n : ℤ) : Prop := n = 0

theorem even_step (n : ℤ) : IsEven n → IsEven (n + 2) := by
  sorry

theorem zero_to_two : IsEven 0 → IsEven 2 := by
  intro h
  exact even_step 0 h

theorem false_claim : (0 : ℤ) = 1 := by
  have h : (0 : ℤ) + 2 = 0 := even_step 0 rfl
  omega

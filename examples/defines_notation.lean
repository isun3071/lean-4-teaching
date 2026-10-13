-- expect: 0/20
-- Notation of the student's own aliases a theorem problem_2 does not permit, so the name
-- never appears in the proof. Any problem with an allowlist is refused when a submission
-- defines syntax; notation the problem set itself declares is the instructor's and is fine.
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring

local notation "CHEAT" => @add_lt_add

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
  intro hab hcd
  exact CHEAT hab hcd

theorem problem_3 : True := by
  trivial

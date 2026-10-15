-- expect: 0/30
-- The student replaced the imports with `import Mathlib`. The file cannot load, and the message says which imports to restore.
import Mathlib

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
  have h3 : a + c < b + c := add_lt_add_left h1 c
  have h4 : b + c < b + d := add_lt_add_right h2 b
  exact lt_trans h3 h4

theorem problem_3 (n : ℤ) : IsEven n → IsEven (n ^ 2 + n) := by
  intro h
  have hsq : IsEven (n ^ 2) := by
    obtain ⟨k, hk⟩ := h
    use 2 * k ^ 2
    rewrite [← hk]
    ring
  exact even_add_even (n ^ 2) n hsq h

theorem problem_4 : ∃ n : ℤ, IsEven n ∧ n > 5 := by
  use 6
  constructor
  use 3
  norm_num
  norm_num

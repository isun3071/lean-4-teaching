/-
Compiled by CI with the template's imports, so a new Lean or Mathlib that drops a tactic
problem sets rely on fails here, by name, rather than as a mysterious 0 for students.
Every proof uses one tactic in the way a student would.
-/
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring

def IsEven (n : ℤ) : Prop := ∃ k : ℤ, 2 * k = n

example (p q : Prop) (hp : p) (hq : q) : p ∧ q := by
  constructor
  · exact hp
  · exact hq

example (p q : Prop) (h : p ∧ q) : q := by
  obtain ⟨_, hq⟩ := h
  exact hq

example (p q : Prop) (h : p ∨ q) : q ∨ p := by
  rcases h with hp | hq
  · right; exact hp
  · left; exact hq

example (p q : Prop) (h : p ∨ q) : q ∨ p := by
  cases h with
  | inl hp => exact Or.inr hp
  | inr hq => exact Or.inl hq

example (p q : Prop) (hpq : p → q) (hp : p) : q := by
  apply hpq
  exact hp

example (a b : ℝ) (h : a = b) : a + a = b + a := by
  nth_rewrite 1 [h]
  rfl

example (a b : ℝ) (h : a = b) : a + 1 = b + 1 := by
  rewrite [h]
  rfl

example (a b : ℝ) (h : a = b) : a + 1 = b + 1 := by
  rw [h]

example (a b : ℝ) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by
  ring

example : (2 : ℝ) + 2 = 4 := by
  norm_num

example : ¬ ((0 : ℝ) ≤ -131) := by
  norm_num

example (n : ℤ) : IsEven (2 * n) := by
  unfold IsEven
  use n

example (p : Prop) : p ∨ ¬ p := by
  by_cases h : p
  · exact Or.inl h
  · exact Or.inr h

example (p : Prop) (h : ¬ ¬ p) : p := by
  by_contra hn
  exact h hn

example (p q : Prop) (h : ¬ q → ¬ p) : p → q := by
  contrapose
  exact h

example (p : Prop) (h : ¬ ∀ x : ℕ, x > 0 → p) : ∃ x : ℕ, x > 0 ∧ ¬ p := by
  push_neg at h
  exact h

example : True := by
  trivial

example (a b : ℕ) (h : a < b) : a + 1 ≤ b := by
  omega

example (a b c : ℝ) (h1 : a ≤ b) (h2 : b ≤ c) : a ≤ c := by
  calc a ≤ b := h1
    _ ≤ c := h2

example (n : ℕ) : 0 + n = n := by
  induction n with
  | zero => rfl
  | succ k ih => rw [Nat.add_succ, ih]

example (a b : ℝ) (h : a ≤ b) : a ≤ b + 0 := by
  simp
  exact h

example (a b : ℝ) (h1 : a < b) : ¬ (b < a) := by
  grind

example : 3 ∣ 12 := by
  decide

example (a b : ℝ) (h : a ≤ b) : a ≤ b := by
  exact?

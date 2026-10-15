-- expect: 40/85
-- Nine problems fail, each for its own reason; the other eight are correct.
--   cases_on_or            does not compile (uses hq where hp is needed)
--   dvd_chain              cites dvd_trans, which is exactly the problem
--   dvd_chain_three        uses odd_add_odd, not on its allowedLemmas
--   powSum_succ            uses rw, where only rewrite is permitted
--   sum_of_squares         closes the base case with simp
--   choose_two_step        relies on its own lemma, which cites Nat.choose_succ_succ'
--   two_mul_le_sq_add_sq   uses nlinarith
--   le_zero_of_le_all_pos  uses push_neg
--   lt_by_calc             weakens the hypothesis a < b to a ≤ b
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Algebra.BigOperators.Intervals

def IsEven (n : ℤ) : Prop := ∃ k : ℤ, n = 2 * k
def IsOdd (n : ℤ) : Prop := ∃ k : ℤ, n = 2 * k + 1

/-- 1 + 2 + 4 + ... + 2^(n-1). -/
def powSum : ℕ → ℕ
  | 0 => 0
  | n + 1 => powSum n + 2 ^ n

-- ## Logic

theorem cases_on_or (p q r : Prop) : (p ∨ q) ∧ (p → r) ∧ (q → r) → r := by
  intro h
  obtain ⟨hpq, hpr, hqr⟩ := h
  rcases hpq with hp | hq
  · exact hpr hq
  · exact hqr hq

theorem exists_through_forall {α : Type} (p q : α → Prop) :
    (∃ x, p x) ∧ (∀ x, p x → q x) → ∃ x, q x := by
  intro h
  obtain ⟨⟨x, hx⟩, hpq⟩ := h
  use x
  apply hpq
  exact hx

-- A counterexample: `n = 0`.
theorem not_all_below (f : ℕ → ℕ) : ¬ ∀ n, f n < n := by
  intro h
  have h0 := h 0
  exact Nat.not_lt_zero (f 0) h0

-- ## Sets and functions

theorem inter_subset_inter {α : Type} (A B C : Set α) : A ⊆ B → A ∩ C ⊆ B ∩ C := by
  intro hAB x hx
  obtain ⟨hA, hC⟩ := hx
  constructor
  · exact hAB hA
  · exact hC

theorem injective_of_comp {α β γ : Type} (f : α → β) (g : β → γ) :
    Function.Injective (g ∘ f) → Function.Injective f := by
  intro hgf a b hab
  apply hgf
  exact congrArg g hab

-- ## Integers and divisibility

theorem odd_add_odd (m n : ℤ) : IsOdd m → IsOdd n → IsEven (m + n) := by
  intro hm hn
  unfold IsOdd at hm hn
  obtain ⟨a, ha⟩ := hm
  obtain ⟨b, hb⟩ := hn
  unfold IsEven
  use a + b + 1
  rewrite [ha, hb]
  ring

-- `dvd_trans` is exactly this, so no theorem is permitted.
theorem dvd_chain (a b c : ℤ) : a ∣ b → b ∣ c → a ∣ c := by
  intro hab hbc
  exact dvd_trans hab hbc

-- Builds on `dvd_chain`, and only on it.
theorem dvd_chain_three (a b c d : ℤ) : a ∣ b → b ∣ c → c ∣ d → a ∣ d := by
  intro hab hbc hcd
  have _unused := odd_add_odd
  have hac := dvd_chain a b c hab hbc
  exact dvd_chain a c d hac hcd

theorem no_odd_combination : ¬ ∃ m n : ℤ, 2 * m + 4 * n = 7 := by
  intro h
  obtain ⟨m, n, hmn⟩ := h
  omega

theorem prime_dvd_square (p a : ℕ) (hp : p.Prime) : p ∣ a * a → p ∣ a := by
  intro h
  have hor := (Nat.Prime.dvd_mul hp).mp h
  rcases hor with ha | ha
  · exact ha
  · exact ha

-- ## Induction

theorem powSum_succ (n : ℕ) : powSum n + 1 = 2 ^ n := by
  induction n with
  | zero => rfl
  | succ k ih =>
    rw [powSum, pow_succ, ← ih]
    ring

theorem sum_of_squares (n : ℕ) :
    6 * ∑ i ∈ Finset.range (n + 1), i ^ 2 = n * (n + 1) * (2 * n + 1) := by
  induction n with
  | zero => simp
  | succ k ih =>
    rewrite [Finset.sum_range_succ, mul_add, ih]
    ring

-- ## Counting

theorem my_pascal (n k : ℕ) :
    Nat.choose (n + 1) (k + 1) = Nat.choose n k + Nat.choose n (k + 1) :=
  Nat.choose_succ_succ' n k

theorem choose_two_step (n : ℕ) : Nat.choose (n + 1) 2 = Nat.choose n 2 + n := by
  rewrite [my_pascal, Nat.choose_one_right, add_comm]
  rfl

-- ## Real numbers

theorem two_mul_le_sq_add_sq (a b : ℝ) : 2 * a * b ≤ a ^ 2 + b ^ 2 := by
  nlinarith [sq_nonneg (a - b)]

theorem le_zero_of_le_all_pos (a : ℝ) (h : ∀ ε > 0, a ≤ ε) : a ≤ 0 := by
  by_contra hn
  push_neg at hn
  have h2 := h (a / 2) (by linarith)
  linarith

theorem lt_by_calc (a b c : ℝ) (h1 : a ≤ b) (h2 : b ≤ c) : a < c + 1 := by
  calc a ≤ b := h1
    _ ≤ c := h2
    _ < c + 1 := by linarith

theorem rewrite_one_side (x y : ℕ) (h : x = y + 1) : x * x = x * (y + 1) := by
  nth_rewrite 2 [h]
  rfl

-- ## State and prove

-- Students write their own statement: that the sum of two even integers is even.
theorem state_and_prove (m n : ℤ) : IsEven m → IsEven n → IsEven (m + n) := by
  intro hm hn
  obtain ⟨a, ha⟩ := hm
  obtain ⟨b, hb⟩ := hn
  use a + b
  rewrite [ha, hb]
  ring

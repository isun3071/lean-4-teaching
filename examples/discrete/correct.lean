-- expect: 100/100
-- Every problem solved within its lists.
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
  · exact hpr hp
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
  obtain ⟨k, hk⟩ := hab
  obtain ⟨m, hm⟩ := hbc
  use k * m
  rewrite [hm, hk]
  ring

-- Builds on `dvd_chain`, and only on it.
theorem dvd_chain_three (a b c d : ℤ) : a ∣ b → b ∣ c → c ∣ d → a ∣ d := by
  intro hab hbc hcd
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

theorem sq_mod_five_ne_two (n : ℕ) : n ^ 2 % 5 ≠ 2 := by
  rewrite [Nat.pow_mod]
  have hr : n % 5 < 5 := Nat.mod_lt n (by norm_num)
  have hall : ∀ r : Fin 5, r.val ^ 2 % 5 ≠ 2 := by decide
  exact hall ⟨n % 5, hr⟩

theorem powSum_succ (n : ℕ) : powSum n + 1 = 2 ^ n := by
  induction n with
  | zero => rfl
  | succ k ih =>
    rewrite [powSum, pow_succ, ← ih]
    ring

theorem sum_of_squares (n : ℕ) :
    6 * ∑ i ∈ Finset.range (n + 1), i ^ 2 = n * (n + 1) * (2 * n + 1) := by
  induction n with
  | zero =>
    rewrite [Finset.sum_range_one]
    rfl
  | succ k ih =>
    rewrite [Finset.sum_range_succ, mul_add, ih]
    ring

-- ## Counting

theorem two_n_add_one_le_pow (n : ℕ) (hn : 3 ≤ n) : 2 * n + 1 ≤ 2 ^ n := by
  induction n, hn using Nat.le_induction with
  | base => norm_num
  | succ k hk ih =>
    rewrite [pow_succ]
    linarith

theorem choose_two_step (n : ℕ) : Nat.choose (n + 1) 2 = Nat.choose n 2 + n := by
  rewrite [Nat.choose_succ_succ, Nat.choose_one_right, add_comm]
  rfl

-- ## Real numbers

theorem two_mul_le_sq_add_sq (a b : ℝ) : 2 * a * b ≤ a ^ 2 + b ^ 2 := by
  have h := sq_nonneg (a - b)
  have hexp : (a - b) ^ 2 = a ^ 2 - 2 * a * b + b ^ 2 := by ring
  linarith

theorem le_zero_of_le_all_pos (a : ℝ) (h : ∀ ε > 0, a ≤ ε) : a ≤ 0 := by
  by_contra hn
  rewrite [not_le] at hn
  have h2 := h (a / 2) (by linarith)
  linarith

theorem sq_eq_one_iff_cases (x : ℝ) : x ^ 2 = 1 ↔ x = 1 ∨ x = -1 := by
  constructor
  · intro h
    have h2 : (x - 1) * (x + 1) = 0 := by
      ring_nf
      linarith
    rcases mul_eq_zero.mp h2 with h3 | h3
    · left
      linarith
    · right
      linarith
  · intro h
    rcases h with h | h <;> rewrite [h] <;> norm_num

theorem lt_by_calc (a b c : ℝ) (h1 : a < b) (h2 : b ≤ c) : a < c + 1 := by
  calc a < b := h1
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

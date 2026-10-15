-- expect: 0/85
-- The handout as students receive it, unchanged.
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
  sorry

theorem exists_through_forall {α : Type} (p q : α → Prop) :
    (∃ x, p x) ∧ (∀ x, p x → q x) → ∃ x, q x := by
  sorry

-- A counterexample: `n = 0`.
theorem not_all_below (f : ℕ → ℕ) : ¬ ∀ n, f n < n := by
  sorry

-- ## Sets and functions

theorem inter_subset_inter {α : Type} (A B C : Set α) : A ⊆ B → A ∩ C ⊆ B ∩ C := by
  sorry

theorem injective_of_comp {α β γ : Type} (f : α → β) (g : β → γ) :
    Function.Injective (g ∘ f) → Function.Injective f := by
  sorry

-- ## Integers and divisibility

theorem odd_add_odd (m n : ℤ) : IsOdd m → IsOdd n → IsEven (m + n) := by
  sorry

-- `dvd_trans` is exactly this, so no theorem is permitted.
theorem dvd_chain (a b c : ℤ) : a ∣ b → b ∣ c → a ∣ c := by
  sorry

-- Builds on `dvd_chain`, and only on it.
theorem dvd_chain_three (a b c d : ℤ) : a ∣ b → b ∣ c → c ∣ d → a ∣ d := by
  sorry

theorem no_odd_combination : ¬ ∃ m n : ℤ, 2 * m + 4 * n = 7 := by
  sorry

theorem prime_dvd_square (p a : ℕ) (hp : p.Prime) : p ∣ a * a → p ∣ a := by
  sorry

-- ## Induction

theorem powSum_succ (n : ℕ) : powSum n + 1 = 2 ^ n := by
  sorry

theorem sum_of_squares (n : ℕ) :
    6 * ∑ i ∈ Finset.range (n + 1), i ^ 2 = n * (n + 1) * (2 * n + 1) := by
  sorry

-- ## Counting

theorem choose_two_step (n : ℕ) : Nat.choose (n + 1) 2 = Nat.choose n 2 + n := by
  sorry

-- ## Real numbers

theorem two_mul_le_sq_add_sq (a b : ℝ) : 2 * a * b ≤ a ^ 2 + b ^ 2 := by
  sorry

theorem le_zero_of_le_all_pos (a : ℝ) (h : ∀ ε > 0, a ≤ ε) : a ≤ 0 := by
  sorry

theorem lt_by_calc (a b c : ℝ) (h1 : a < b) (h2 : b ≤ c) : a < c + 1 := by
  sorry

-- `nth_rewrite`, unlike `rewrite`, does not close the goal with `rfl` afterwards.
theorem rewrite_one_side (x y : ℕ) (h : x = y + 1) : x * x = x * (y + 1) := by
  sorry

-- ## State and prove

-- Students write their own statement: that the sum of two even integers is even.
theorem state_and_prove : True := by
  sorry

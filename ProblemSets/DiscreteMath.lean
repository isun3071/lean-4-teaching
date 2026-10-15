/-
# A discrete mathematics problem set

A wider example than `Template.lean`: one problem from each topic a first course in
discrete mathematics usually covers, each with the allowlists such a problem would get.
CI grades `examples/discrete/` against it, on every push and on every newer Lean it tries,
so it also checks that the tactics and theorems these problems need are still there.
-/

import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Algebra.BigOperators.Intervals
import AutograderLib

def IsEven (n : ℤ) : Prop := ∃ k : ℤ, n = 2 * k
def IsOdd (n : ℤ) : Prop := ∃ k : ℤ, n = 2 * k + 1

/-- 1 + 2 + 4 + ... + 2^(n-1). -/
def powSum : ℕ → ℕ
  | 0 => 0
  | n + 1 => powSum n + 2 ^ n

-- ## Logic

@[autogradedProof 5,
  allowedTactics #["intro", "obtain", "rcases", "cases", "exact", "cdot"]]
theorem cases_on_or (p q r : Prop) : (p ∨ q) ∧ (p → r) ∧ (q → r) → r := by
  sorry

@[autogradedProof 5,
  allowedTactics #["intro", "obtain", "use", "exact", "apply"]]
theorem exists_through_forall {α : Type} (p q : α → Prop) :
    (∃ x, p x) ∧ (∀ x, p x → q x) → ∃ x, q x := by
  sorry

-- A counterexample: `n = 0`.
@[autogradedProof 5,
  allowedTactics #["intro", "have", "exact"],
  allowedTheorems #["Nat.not_lt_zero"]]
theorem not_all_below (f : ℕ → ℕ) : ¬ ∀ n, f n < n := by
  sorry

-- ## Sets and functions

@[autogradedProof 5,
  allowedTactics #["intro", "obtain", "constructor", "exact", "apply", "cdot"]]
theorem inter_subset_inter {α : Type} (A B C : Set α) : A ⊆ B → A ∩ C ⊆ B ∩ C := by
  sorry

@[autogradedProof 5,
  allowedTactics #["intro", "apply", "exact"],
  allowedTheorems #["congrArg"]]
theorem injective_of_comp {α β γ : Type} (f : α → β) (g : β → γ) :
    Function.Injective (g ∘ f) → Function.Injective f := by
  sorry

-- ## Integers and divisibility

@[autogradedProof 5,
  allowedTactics #["intro", "unfold", "obtain", "use", "rewrite", "ring"]]
theorem odd_add_odd (m n : ℤ) : IsOdd m → IsOdd n → IsEven (m + n) := by
  sorry

-- `dvd_trans` is exactly this, so no theorem is permitted.
@[autogradedProof 5,
  allowedTactics #["intro", "obtain", "use", "rewrite", "ring", "exact"],
  allowedTheorems #[]]
theorem dvd_chain (a b c : ℤ) : a ∣ b → b ∣ c → a ∣ c := by
  sorry

-- Builds on `dvd_chain`, and only on it.
@[autogradedProof 5,
  allowedTactics #["intro", "have", "exact"],
  allowedTheorems #[],
  allowedLemmas #["dvd_chain"]]
theorem dvd_chain_three (a b c d : ℤ) : a ∣ b → b ∣ c → c ∣ d → a ∣ d := by
  sorry

@[autogradedProof 5,
  allowedTactics #["intro", "obtain", "omega"]]
theorem no_odd_combination : ¬ ∃ m n : ℤ, 2 * m + 4 * n = 7 := by
  sorry

@[autogradedProof 5,
  allowedTactics #["intro", "have", "rcases", "obtain", "exact", "cdot"],
  allowedTheorems #["Nat.Prime.dvd_mul"]]
theorem prime_dvd_square (p a : ℕ) (hp : p.Prime) : p ∣ a * a → p ∣ a := by
  sorry

-- ## Induction

@[autogradedProof 5,
  allowedTactics #["induction", "rfl", "rewrite", "ring"],
  allowedTheorems #["pow_succ"]]
theorem powSum_succ (n : ℕ) : powSum n + 1 = 2 ^ n := by
  sorry

@[autogradedProof 5,
  allowedTactics #["induction", "rfl", "rewrite", "ring"],
  allowedTheorems #["Finset.sum_range_succ", "Finset.sum_range_one", "mul_add"]]
theorem sum_of_squares (n : ℕ) :
    6 * ∑ i ∈ Finset.range (n + 1), i ^ 2 = n * (n + 1) * (2 * n + 1) := by
  sorry

-- ## Counting

@[autogradedProof 5,
  allowedTactics #["rewrite", "rfl"],
  allowedTheorems #["Nat.choose_succ_succ", "Nat.choose_one_right", "add_comm"]]
theorem choose_two_step (n : ℕ) : Nat.choose (n + 1) 2 = Nat.choose n 2 + n := by
  sorry

-- ## Real numbers

@[autogradedProof 5,
  allowedTactics #["have", "ring", "linarith"],
  allowedTheorems #["sq_nonneg"]]
theorem two_mul_le_sq_add_sq (a b : ℝ) : 2 * a * b ≤ a ^ 2 + b ^ 2 := by
  sorry

@[autogradedProof 5,
  allowedTactics #["by_contra", "rewrite", "have", "linarith", "exact"],
  allowedTheorems #["not_le"]]
theorem le_zero_of_le_all_pos (a : ℝ) (h : ∀ ε > 0, a ≤ ε) : a ≤ 0 := by
  sorry

@[autogradedProof 5,
  allowedTactics #["calc", "exact", "linarith"]]
theorem lt_by_calc (a b c : ℝ) (h1 : a < b) (h2 : b ≤ c) : a < c + 1 := by
  sorry

-- `nth_rewrite`, unlike `rewrite`, does not close the goal with `rfl` afterwards.
@[autogradedProof 5,
  allowedTactics #["nth_rewrite", "rfl"]]
theorem rewrite_one_side (x y : ℕ) (h : x = y + 1) : x * x = x * (y + 1) := by
  sorry

-- ## State and prove

-- Students write their own statement: that the sum of two even integers is even.
@[gradedByHand]
theorem state_and_prove : True := by
  sorry

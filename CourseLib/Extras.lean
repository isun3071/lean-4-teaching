/-!
# Course definitions Mathlib does not supply

Definitions and results the problem sets use that Mathlib either lacks or keeps under
different names (`Nat.choose`, `Nat.factorial`), so importing this is safe with or without
Mathlib.
-/

/-! ## Counting

`Nat.factorial` and `Nat.choose` are Mathlib's, not core's. Defined by their recurrences,
which makes Pascal's rule hold by `rfl`. -/

def factorial : Nat → Nat
  | 0     => 1
  | n + 1 => (n + 1) * factorial n

def choose : Nat → Nat → Nat
  | _,     0     => 1
  | 0,     _ + 1 => 0
  | n + 1, k + 1 => choose n k + choose n (k + 1)

/-- `choose n 0 = 1`. Not provable by `rfl` for a variable `n`, because the recurrence
splits on its first argument before its second; without this lemma a counting proof
stalls on a goal that looks trivially true. -/
theorem choose_zero_right (n : Nat) : choose n 0 = 1 := by
  cases n <;> rfl

/-! ## Well-ordering

Core has `Nat.strongRecOn` but not `Nat.find`, so the well-ordering principle is stated
here rather than assumed. Proved from strong induction, so it is a theorem of the course's
own logic rather than an axiom. -/

theorem well_ordering (P : Nat → Prop) (h : ∃ n, P n) :
    ∃ m, P m ∧ ∀ k, k < m → ¬ P k := by
  obtain ⟨n, hn⟩ := h
  induction n using Nat.strongRecOn with
  | _ n ih =>
    by_cases hlt : ∃ k, k < n ∧ P k
    · obtain ⟨k, hk, hpk⟩ := hlt
      exact ih k hk hpk
    · exact ⟨n, hn, fun k hk hpk => hlt ⟨k, hk, hpk⟩⟩

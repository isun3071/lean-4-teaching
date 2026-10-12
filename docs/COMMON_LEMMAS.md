# Common lemmas for first proofs & discrete math

The lemmas you will actually reach for in an intro-to-proofs or discrete math course,
stated exactly as Lean defines them. Logic first, then arithmetic. Everything here is
available after `import CourseLib`.

**How to use:**
- `rewrite [name]` rewrites left→right in the goal; `rewrite [← name]` rewrites right→left
- `rewrite [name] at h` rewrites in a hypothesis instead of the goal
- After a `rewrite` chain leaves the goal in the form `X = X`, close it with `rfl`
- `rw` is `rewrite` plus an automatic `rfl`, so it is a **different tactic**; if a problem
  permits only `rewrite`, `rw` will be rejected
- Lemmas stated with `↔` can be rewritten with just like ones stated with `=`
- An assignment may permit only some of these tactics; the problem says which

---

# Part 1 — Propositional logic

The standard laws, under the names Lean gives them. A law stated with `↔` rewrites just
like one stated with `=`.

## Identity

| Lemma | Statement |
|---|---|
| `and_true` / `true_and` | `(p ∧ True) = p` / `(True ∧ p) = p` |
| `or_false` / `false_or` | `(p ∨ False) = p` / `(False ∨ p) = p` |

## Domination

| Lemma | Statement |
|---|---|
| `or_true` / `true_or` | `(p ∨ True) = True` / `(True ∨ p) = True` |
| `and_false` / `false_and` | `(p ∧ False) = False` / `(False ∧ p) = False` |

## Idempotence

| Lemma | Statement |
|---|---|
| `and_self` | `(p ∧ p) = p` |
| `or_self` | `(p ∨ p) = p` |

## Complement

| Lemma | Statement |
|---|---|
| `and_not_self_iff` | `a ∧ ¬a ↔ False` |
| `not_and_self_iff` | `¬a ∧ a ↔ False` |
| `not_true` | `¬True ↔ False` |
| `not_false` | `¬False` |
| `Classical.em` | `p ∨ ¬p`  (a term, use with `exact`; there is no rewrite form) |

## Double negation

| Lemma | Statement |
|---|---|
| `Classical.not_not` | `¬¬a ↔ a` |

## Commutativity and associativity

| Lemma | Statement |
|---|---|
| `and_comm` | `a ∧ b ↔ b ∧ a` |
| `or_comm` | `a ∨ b ↔ b ∨ a` |
| `and_assoc` | `(a ∧ b) ∧ c ↔ a ∧ b ∧ c` |
| `or_assoc` | `(a ∨ b) ∨ c ↔ a ∨ b ∨ c` |

## Distributivity

| Lemma | Statement |
|---|---|
| `and_or_left` | `a ∧ (b ∨ c) ↔ a ∧ b ∨ a ∧ c` |
| `or_and_right` | `(a ∨ b) ∧ c ↔ a ∧ c ∨ b ∧ c` |
| `or_and_left` | `a ∨ b ∧ c ↔ (a ∨ b) ∧ (a ∨ c)` |
| `and_or_right` | `a ∧ b ∨ c ↔ (a ∨ c) ∧ (b ∨ c)` |

## De Morgan

| Lemma | Statement |
|---|---|
| `not_and_or` | `¬(a ∧ b) ↔ ¬a ∨ ¬b` |
| `not_or` | `¬(p ∨ q) ↔ ¬p ∧ ¬q` |
| `not_and` | `¬(a ∧ b) ↔ a → ¬b` |

## Implication

| Lemma | Statement |
|---|---|
| `imp_iff_not_or` | `a → b ↔ ¬a ∨ b` |
| `Classical.not_imp` | `¬(a → b) ↔ a ∧ ¬b` |
| `and_imp` | `a ∧ b → c ↔ a → b → c` |
| `imp_self` | `a → a ↔ True` |

## Biconditional

| Lemma | Statement |
|---|---|
| `iff_iff_implies_and_implies` | `(a ↔ b) ↔ (a → b) ∧ (b → a)` |
| `iff_true` / `true_iff` | `(p ↔ True) = p` / `(True ↔ p) = p` |
| `iff_false` / `false_iff` | `(p ↔ False) = ¬p` / `(False ↔ p) = ¬p` |
| `iff_self` | `(p ↔ p) = True` |
| `eq_self_iff_true` | `a = a ↔ True` |

## Absorption

Not available. `p ∨ (p ∧ q) = p` and `p ∧ (p ∨ q) = p` are Mathlib lemmas; ask course staff
to add them to `CourseLib.lean` if an assignment needs them.

## Terms, not rewrites

Used with `exact` or `apply`.

| Name | Statement |
|---|---|
| `And.intro` | `a → b → a ∧ b` |
| `Or.inl` / `Or.inr` | `a → a ∨ b` / `b → a ∨ b` |
| `Or.elim` | `a ∨ b → (a → c) → (b → c) → c` |
| `absurd` | `a → ¬a → b` |
| `Classical.em` | `p ∨ ¬p` |
| `Classical.byContradiction` | `(¬p → False) → p` |

To split a conjunction in a hypothesis, `obtain ⟨h1, h2⟩ := h`. To split a disjunction,
`cases h with | inl h1 => ... | inr h2 => ...`.

# Part 2 — Predicate logic

| Lemma | Statement |
|---|---|
| `not_exists` | `(¬∃ x, p x) ↔ ∀ x, ¬p x` |
| `Classical.not_forall` | `(¬∀ x, p x) ↔ ∃ x, ¬p x` |
| `forall_and` | `(∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ ∀ x, q x` |
| `exists_or` | `(∃ x, p x ∨ q x) ↔ (∃ x, p x) ∨ ∃ x, q x` |
| `exists_imp` | `(∃ x, p x) → b ↔ ∀ x, p x → b` |
| `forall_const` | `(∀ _ : α, b) ↔ b`  (needs `α` nonempty) |
| `exists_const` | `(∃ _ : α, b) ↔ b`  (needs `α` nonempty) |

Note the asymmetry: `not_exists` is unprefixed, but pushing a negation through `∀` is
classical and must be written `Classical.not_forall`.

## A note on the `Classical.` prefix

Several of these live under `Classical.` rather than on their own: `Classical.not_not`,
`Classical.not_imp`, `Classical.not_forall`, `Classical.em`. Their unprefixed spellings are
Mathlib's, so write the prefix. `not_exists` and `not_or` need no prefix.

# Part 3 — Arithmetic

## 1. Addition — associativity, commutativity, identity

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.add_assoc` | (n m k : Nat) : n + m + k = n + (m + k) |
| `Nat.add_comm` | (n m : Nat) : n + m = m + n |
| `Nat.add_zero` | (n : Nat) : n + 0 = n |
| `Nat.zero_add` | (n : Nat) : 0 + n = n |

## 2. Multiplication — associativity, commutativity, identity, annihilation

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.mul_assoc` | (n m k : Nat) : n * m * k = n * (m * k) |
| `Nat.mul_comm` | (n m : Nat) : n * m = m * n |
| `Nat.mul_one` | (n : Nat) : n * 1 = n |
| `Nat.one_mul` | (n : Nat) : 1 * n = n |
| `Nat.mul_zero` | (n : Nat) : n * 0 = 0 |
| `Nat.zero_mul` | (n : Nat) : 0 * n = 0 |

## 3. Distributivity (expanding and factoring)

These four are the algebra workhorses. Forward `rw` expands; `rw [← ...]` factors out.

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.mul_add` | (n m k : Nat) : n * (m + k) = n * m + n * k |
| `Nat.add_mul` | (n m k : Nat) : (n + m) * k = n * k + m * k |

## 4. Successor form — what you need for induction

`Nat` addition/multiplication are *defined* by recursing on the first argument, so induction
proofs bottom out in these one-step rewrites. The Infoview will show `n + 1` as `n.succ`.

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.zero_add` | (n : Nat) : 0 + n = n |
| `Nat.succ_add` | (n m : Nat) : n.succ + m = (n + m).succ |
| `Nat.add_succ` | (n m : Nat) : n + m.succ = (n + m).succ |
| `Nat.zero_mul` | (n : Nat) : 0 * n = 0 |
| `Nat.succ_mul` | (n m : Nat) : n.succ * m = n * m + m |
| `Nat.mul_succ` | (n m : Nat) : n * m.succ = n * m + n |
| `Nat.pow_zero` | (n : Nat) : n ^ 0 = 1 |
| `Nat.pow_succ` | (n m : Nat) : n ^ m.succ = n ^ m * n |

## 5. Powers

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.pow_add` | (a m n : Nat) : a ^ (m + n) = a ^ m * a ^ n |
| `Nat.pow_mul` | (a m n : Nat) : a ^ (m * n) = (a ^ m) ^ n |

## 6. Truncated subtraction (Nat `-`)

Remember: in `Nat`, `3 - 5 = 0`. There are no negatives, so these lemmas look odd at first.

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.sub_zero` | (n : Nat) : n - 0 = n |
| `Nat.sub_self` | (n : Nat) : n - n = 0 |
| `Nat.sub_add_eq` | (a b c : Nat) : a - (b + c) = a - b - c |
| `Nat.add_sub_cancel` | (n m : Nat) : n + m - m = n |
| `Nat.add_sub_cancel_left` | (n m : Nat) : n + m - n = m |

## 7. Parity and modular arithmetic

The definition of even/odd you meet in class: `n` is even iff `n % 2 = 0`.

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.mod_two_eq_zero_or_one` | (n : Nat) : n % 2 = 0 ∨ n % 2 = 1 |
| `Nat.mod_eq_of_lt` | {a b : Nat} (h : a < b) : a % b = a |
| `Nat.mod_lt` | (x : Nat) {y : Nat} (hy : 0 < y) : x % y < y |
| `Nat.mod_self` | (n : Nat) : n % n = 0 |
| `Nat.mod_mod` | (a n : Nat) : a % n % n = a % n |

Reducing sums/products mod `k` — the rules behind "you may work mod k":

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.add_mod_left` | (x z : Nat) : (x + z) % x = z % x |
| `Nat.add_mod_right` | (x z : Nat) : (x + z) % z = x % z |
| `Nat.mul_mod_left` | (m n : Nat) : m * n % n = 0 |
| `Nat.mul_mod_right` | (m n : Nat) : m * n % m = 0 |

## 8. Divisibility (`a ∣ b` means `b % a = 0`)

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.dvd_refl` | (a : Nat) : a ∣ a |
| `Nat.dvd_zero` | (a : Nat) : a ∣ 0 |
| `Nat.dvd_trans` | {a b c : Nat} (h₁ : a ∣ b) (h₂ : b ∣ c) : a ∣ c |
| `Nat.dvd_add` | {a b c : Nat} (h₁ : a ∣ b) (h₂ : a ∣ c) : a ∣ b + c |
| `Nat.dvd_sub` | {k m n : Nat} (h₁ : k ∣ m) (h₂ : k ∣ n) : k ∣ m - n |
| `Nat.dvd_mul_right` | (a b : Nat) : a ∣ a * b |
| `Nat.dvd_mul_left` | (a b : Nat) : a ∣ b * a |
| `Nat.one_dvd` | (n : Nat) : 1 ∣ n |
| `Nat.dvd_one` | {n : Nat} : n ∣ 1 ↔ n = 1 |

## 9. gcd

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.gcd_comm` | (m n : Nat) : m.gcd n = n.gcd m |
| `Nat.gcd_rec` | (m n : Nat) : m.gcd n = (n % m).gcd m |
| `Nat.gcd_dvd_left` | (m n : Nat) : m.gcd n ∣ m |
| `Nat.gcd_dvd_right` | (m n : Nat) : m.gcd n ∣ n |
| `Nat.dvd_gcd` | {k m n : Nat} : k ∣ m → k ∣ n → k ∣ m.gcd n |
| `Nat.gcd_zero_left` | (y : Nat) : Nat.gcd 0 y = y |
| `Nat.gcd_zero_right` | (n : Nat) : n.gcd 0 = n |
| `Nat.gcd_one_right` | (n : Nat) : n.gcd 1 = 1 |

## 10. Order: `≤` and `<` on Nat

Definitions: `a ≤ b` iff `∃ c, b = a + c`; `a < b` is defined as `a + 1 ≤ b` (`a.succ ≤ b`).

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.zero_le` | (n : Nat) : 0 ≤ n |
| `Nat.le_refl` | (n : Nat) : n ≤ n |
| `Nat.le_trans` | {n m k : Nat} : n ≤ m → m ≤ k → n ≤ k |
| `Nat.le_antisymm` | {n m : Nat} (h₁ : n ≤ m) (h₂ : m ≤ n) : n = m |
| `Nat.le_total` | (m n : Nat) : m ≤ n ∨ n ≤ m |
| `Nat.le_succ` | (n : Nat) : n ≤ n.succ |
| `Nat.le_of_lt` | {n m : Nat} : n < m → n ≤ m |
| `Nat.lt_irrefl` | (n : Nat) : ¬n < n |
| `Nat.lt_trans` | {n m k : Nat} (h₁ : n < m) : m < k → n < k |
| `Nat.lt_succ_self` | (n : Nat) : n < n.succ |
| `Nat.not_lt_zero` | (n : Nat) : ¬n < 0 |
| `Nat.lt_of_lt_of_le` | {n m k : Nat} : n < m → m ≤ k → n < k |
| `Nat.lt_of_le_of_lt` | {n m k : Nat} (h₁ : n ≤ m) (h₂ : m < k) : n < k |
| `Nat.lt_of_succ_le` | {n m : Nat} (h : n.succ ≤ m) : n < m |
| `Nat.succ_le_of_lt` | {n m : Nat} (h : n < m) : n.succ ≤ m |
| `Nat.succ_le_succ` | {n m : Nat} : n ≤ m → n.succ ≤ m.succ |
| `Nat.succ_lt_succ` | {n m : Nat} : n < m → n.succ < m.succ |

## 11. min and max

| Lemma | Statement | Notes |
|---|---|---|
| `Nat.min_comm` | (a b : Nat) : min a b = min b a |
| `Nat.min_assoc` | (a b c : Nat) : min (min a b) c = min a (min b c) |
| `Nat.max_comm` | (a b : Nat) : max a b = max b a |
| `Nat.max_assoc` | (a b c : Nat) : max (max a b) c = max a (max b c) |
| `Nat.max_le` | {a b c : Nat} : max a b ≤ c ↔ a ≤ c ∧ b ≤ c |
| `Nat.le_max_left` | (a b : Nat) : a ≤ max a b |
| `Nat.le_max_right` | (a b : Nat) : b ≤ max a b |
| `Nat.min_le_left` | (a b : Nat) : min a b ≤ a |
| `Nat.min_le_right` | (a b : Nat) : min a b ≤ b |

---

## 12. Combining inequalities

Adding to both sides of an inequality, and chaining inequalities. Core Lean has these for
`Int` and `Nat` under a prefix; `Nat.` versions have the same names with `Nat.` in place of
`Int.`.

| Lemma | Statement |
|---|---|
| `Int.add_lt_add_left` | `a < b → ∀ c, c + a < c + b` |
| `Int.add_lt_add_right` | `a < b → ∀ c, a + c < b + c` |
| `Int.add_lt_add` | `a < b → c < d → a + c < b + d` |
| `Int.lt_trans` | `a < b → b < c → a < c` |
| `Int.le_trans` | `a ≤ b → b ≤ c → a ≤ c` |
| `Int.lt_of_lt_of_le` | `a < b → b ≤ c → a < c` |

### In problem sets over ℝ

Problem sets that use the real numbers import Mathlib, whose lemmas carry no prefix and
work for ℝ, ℤ and ℕ alike. **Mathlib names left and right the opposite way to core**: in
Mathlib, `add_lt_add_left` adds on the *right*.

| Lemma (Mathlib) | Statement |
|---|---|
| `add_lt_add_left` | `a < b → ∀ c, a + c < b + c` |
| `add_lt_add_right` | `a < b → ∀ c, c + a < c + b` |
| `add_lt_add` | `a < b → c < d → a + c < b + d` |
| `add_le_add` | `a ≤ b → c ≤ d → a + c ≤ b + d` |
| `lt_trans` | `a < b → b < c → a < c` |
| `le_trans` | `a ≤ b → b ≤ c → a ≤ c` |
| `lt_of_lt_of_le` | `a < b → b ≤ c → a < c` |
| `lt_of_le_of_lt` | `a ≤ b → b < c → a < c` |

If a proof that looks right fails with `could not unify` on one of these, try the other
side's name first.

---

## Tactic quick reference

Assignments usually restrict which of these you may use, and the restriction is enforced:
a proof using a tactic the problem does not permit scores zero even if it is correct. The
problem statement says which are allowed. `rewrite` and `rw` are different tactics, and
permitting one does not permit the other.

| Tactic | Use when |
|---|---|
| `rfl` | goal is `expr = expr` definitionally (e.g. `2 + 2 = 4`) |
| `rewrite [h]` / `rewrite [← h]` | goal contains a shape matching a lemma LHS (or RHS) |
| `rw [h]` | as `rewrite`, but also tries `rfl` afterwards |
| `nth_rewrite n [h]` | rewrite only the `n`th occurrence, counting from 1; a separate tactic from `rewrite` |
| `intro h` | goal is an implication or a `∀`; moves the antecedent into scope |
| `obtain ⟨h1, h2⟩ := h` | split a conjunction or an existential in a hypothesis |
| `cases h with \| inl a => ... \| inr b => ...` | split a disjunction into two cases |
| `constructor` | split a goal that is `↔` or `∧` into its two halves |
| `·` (focus bullet) | work on one goal at a time; listed in an allowlist as `"cdot"` |
| `omega` | goal is linear arithmetic over `Nat`/`Int` (rarely permitted) |
| `simp [l1, l2]` | goal normalizes under rewrite rules (rarely permitted) |
| `decide` | goal is decidable with concrete numbers |
| `induction n with` | proofs over all naturals; pair with §4 successor lemmas |
| `exact Nat.le_refl x` etc. | when a lemma *is* the goal directly |
| `apply h` | the lemma's conclusion matches the goal; subgoals become hypotheses |

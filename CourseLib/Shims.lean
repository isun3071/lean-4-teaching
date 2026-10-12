/-!
# Stand-ins for Mathlib

Pieces of Mathlib the problem sets use, reimplemented over core Lean under Mathlib's own
names, so that problem sets which do not import Mathlib can still use them and solutions
written against Mathlib port over unchanged. Each is a one-line classical specialization of
a core lemma, a plain definition, or a thin macro, which is all Mathlib itself does for
them.

**Never import this alongside Mathlib.** Mathlib defines every name here, and Lean refuses
an environment containing two definitions of the same name: a problem set importing both
fails before grading starts. A problem set that needs Mathlib (for example
`Mathlib.Basic.Real.Basic`, for ℝ) gets all of this from Mathlib instead, and imports
`CourseLib.Extras` for the rest of the prelude.
-/

theorem imp_iff_not_or {a b : Prop} : (a → b) ↔ (¬a ∨ b) :=
  open scoped Classical in Decidable.imp_iff_not_or

theorem not_and_or {a b : Prop} : ¬(a ∧ b) ↔ (¬a ∨ ¬b) :=
  open scoped Classical in Decidable.not_and_iff_not_or_not

/-! ## Sets

Core Lean has no `Set`. It is a one-line definition there as it is in Mathlib; what
Mathlib adds is thousands of proved lemmas about it, which an introductory course does
not need and cannot afford (importing Mathlib exceeds Gradescope's memory ceiling).
Definitions only, so that exercises about set identities remain exercises rather than
lookups. -/

def Set (α : Type u) := α → Prop

namespace Set
variable {α : Type u}

instance : Membership α (Set α) := ⟨fun s a => s a⟩

def univ : Set α := fun _ => True
def empty : Set α := fun _ => False
def union (s t : Set α) : Set α := fun a => a ∈ s ∨ a ∈ t
def inter (s t : Set α) : Set α := fun a => a ∈ s ∧ a ∈ t
def compl (s : Set α) : Set α := fun a => ¬ (a ∈ s)
def Subset (s t : Set α) : Prop := ∀ a, a ∈ s → a ∈ t

infixl:65 " ∪ " => union
infixl:70 " ∩ " => inter
infix:50 " ⊆ " => Subset

/-- Two sets with the same members are equal. The workhorse for proving set identities:
`Set.ext fun a => ...` reduces a set equation to a membership biconditional. -/
theorem ext {s t : Set α} (h : ∀ a, a ∈ s ↔ a ∈ t) : s = t :=
  funext fun a => propext (h a)

end Set

/-! ## `nth_rewrite`

Mathlib's `nth_rewrite n [h]` rewrites only the `n`th occurrence of `h`'s left-hand side,
where plain `rewrite` rewrites every one. Core Lean already supports occurrence selection
(`rewrite (occs := .pos [n])`); Mathlib's tactic is a thin wrapper over it, and so is this.

It keeps its own syntax, so an allowlist names it separately from `rewrite`: permitting one
does not permit the other. Occurrences are counted from 1, after the first match fixes the
lemma's arguments, exactly as in Mathlib. -/

open Lean Parser.Tactic in
syntax "nth_rewrite " num ppSpace rwRuleSeq (location)? : tactic

open Lean Parser.Tactic in
macro_rules
  | `(tactic| nth_rewrite $n:num $rs:rwRuleSeq) =>
    `(tactic| rewrite (occs := .pos [$n]) $rs:rwRuleSeq)
  | `(tactic| nth_rewrite $n:num $rs:rwRuleSeq $loc:location) =>
    `(tactic| rewrite (occs := .pos [$n]) $rs:rwRuleSeq $loc:location)

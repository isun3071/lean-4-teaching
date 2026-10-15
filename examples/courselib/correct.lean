-- expect: 20/20
-- A problem set built on CourseLib rather than Mathlib. `rewrite [choose]` unfolds an
-- imported definition by name, which makes Lean generate `choose.eq_3` inside this file;
-- that lemma belongs to the library definition, not to the student, and must not be
-- refused as untraceable.
import CourseLib

theorem choose_one (n : Nat) : choose n 1 = n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show choose (n + 1) 1 = n + 1
    rewrite [choose, choose_zero_right, ih, Nat.add_comm 1 n]
    rfl

theorem logic_law (p q : Prop) : p ∧ q → q := by
  intro h
  obtain ⟨hp, hq⟩ := h
  exact hq

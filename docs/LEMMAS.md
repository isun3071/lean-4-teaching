# Core rewrite lemmas (Nat / Int)

Exhaustive list of every declaration in core Lean whose type is an **equation** in the `Nat` or `Int` namespaces — i.e. everything `rw`, `simp [..]`, and `rfl` can consume.

Generated against toolchain `v4.33.1`; this project now pins `v4.34.0`, so a handful of entries
may differ. `COMMON_LEMMAS.md` is checked against the pinned toolchain and is the one to
trust when they disagree.

**Total: 2481 lemmas.** Generated programmatically by scanning the Lean environment (metaprogram at the bottom of this file), so it is complete by construction for this toolchain version. Internal `*.Internal.*` machinery (omega implementation details) is excluded.

Usage reminders:
- `rw [name]` rewrites LHS → RHS of the statement; `rw [← name]` does RHS → LHS
- `rw` matches the *first* syntactic occurrence; pin arguments with `rw [name a b]`
- `omega` supersedes most of the addition/subtraction/order lemmas for automation

---

## Int other (659)

| Lemma | Statement |
|---|---|
| `Int.Cooper.resolve_left'.congr_simp` | Int.Cooper.resolve_left'.congr_simp (a a✝ : Int) (e_a : a = a✝) (c c✝ : Int) (e_c : c = c✝) (d d✝ : Int) (e_d : d = d✝) (p Int.Cooper.resolve_left' |
| `Int.Cooper.resolve_left_eq` | Int.Cooper.resolve_left_eq (a c d p x : Int) (h₁ : p ≤ a * x) : Int.Cooper.resolve_left |
| `Int.Internal.Linear.Expr.add.injEq` | Int.Internal.Linear.Expr.add.injEq (a b a✝ b✝ : Int.Internal.Linear.Expr) : (a.add b = a✝.add b✝) = (a = a✝ ∧ b = b✝) |
| `Int.Internal.Linear.Expr.add.sizeOf_spec` | Int.Internal.Linear.Expr.add.sizeOf_spec (a b : Int.Internal.Linear.Expr) : sizeOf (a.add b) = 1 + sizeOf a + sizeOf b |
| `Int.Internal.Linear.Expr.brecOn.eq.{u}` | Int.Internal.Linear.Expr.brecOn.eq.{u} {motive : Int.Internal.Linear.Expr → Sort u} (t : Int.Internal.Linear.Expr) (F_1 Int.Internal.Linear.Expr.brecOn |
| `Int.Internal.Linear.Expr.denote.eq_1` | Int.Internal.Linear.Expr.denote.eq_1 (ctx : Int.Internal.Linear.Context) (a b : Int.Internal.Linear.Expr) : Int.Internal.Linear.Expr.denote Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.Expr.denote.eq_2` | Int.Internal.Linear.Expr.denote.eq_2 (ctx : Int.Internal.Linear.Context) (a b : Int.Internal.Linear.Expr) : Int.Internal.Linear.Expr.denote Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.Expr.denote.eq_3` | Int.Internal.Linear.Expr.denote.eq_3 (ctx : Int.Internal.Linear.Context) (a : Int.Internal.Linear.Expr) : Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.Expr.denote.eq_4` | Int.Internal.Linear.Expr.denote.eq_4 (ctx : Int.Internal.Linear.Context) (k : Int) : Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.Expr.denote.eq_5` | Int.Internal.Linear.Expr.denote.eq_5 (ctx : Int.Internal.Linear.Context) (v : Int.Internal.Linear.Var) : Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.Expr.denote.eq_6` | Int.Internal.Linear.Expr.denote.eq_6 (ctx : Int.Internal.Linear.Context) (k : Int) (e : Int.Internal.Linear.Expr) : Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.Expr.denote.eq_7` | Int.Internal.Linear.Expr.denote.eq_7 (ctx : Int.Internal.Linear.Context) (e : Int.Internal.Linear.Expr) (k : Int) : Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.Expr.denote.eq_def` | Int.Internal.Linear.Expr.denote.eq_def (ctx : Int.Internal.Linear.Context) (x✝ : Int.Internal.Linear.Expr) : Int.Internal.Linear.Expr.denote match \| \| \| \| \| \| \| |
| `Int.Internal.Linear.Expr.denote_norm` | Int.Internal.Linear.Expr.denote_norm (ctx : Int.Internal.Linear.Context) (e : Int.Internal.Linear.Expr) : Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Expr.denote_toPoly'_go` | Int.Internal.Linear.Expr.denote_toPoly'_go {k : Int} {p : Int.Internal.Linear.Poly} (ctx : Int.Internal.Linear.Context) (e Int.Internal.Linear.Poly.denote k |
| `Int.Internal.Linear.Expr.eq_of_norm_eq` | Int.Internal.Linear.Expr.eq_of_norm_eq (ctx : Int.Internal.Linear.Context) (e : Int.Internal.Linear.Expr) (p Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.Expr.mulL.injEq` | Int.Internal.Linear.Expr.mulL.injEq (k : Int) (a : Int.Internal.Linear.Expr) (k✝ : Int) (a✝ (Int.Internal.Linear.Expr.mulL |
| `Int.Internal.Linear.Expr.mulL.sizeOf_spec` | Int.Internal.Linear.Expr.mulL.sizeOf_spec (k : Int) (a : Int.Internal.Linear.Expr) : sizeOf |
| `Int.Internal.Linear.Expr.mulR.injEq` | Int.Internal.Linear.Expr.mulR.injEq (a : Int.Internal.Linear.Expr) (k : Int) (a✝ : Int.Internal.Linear.Expr) (k✝ |
| `Int.Internal.Linear.Expr.mulR.sizeOf_spec` | Int.Internal.Linear.Expr.mulR.sizeOf_spec (a : Int.Internal.Linear.Expr) (k : Int) : sizeOf |
| `Int.Internal.Linear.Expr.neg.inj` | Int.Internal.Linear.Expr.neg.inj {a a✝ : Int.Internal.Linear.Expr} : a.neg = a✝.neg → a = a✝ |
| `Int.Internal.Linear.Expr.neg.injEq` | Int.Internal.Linear.Expr.neg.injEq (a a✝ : Int.Internal.Linear.Expr) : (a.neg = a✝.neg) = (a = a✝) |
| `Int.Internal.Linear.Expr.neg.sizeOf_spec` | Int.Internal.Linear.Expr.neg.sizeOf_spec (a : Int.Internal.Linear.Expr) : sizeOf a.neg = 1 + sizeOf a |
| `Int.Internal.Linear.Expr.norm.eq_1` | Int.Internal.Linear.Expr.norm.eq_1 (e : Int.Internal.Linear.Expr) : e.norm = e.toPoly'.norm |
| `Int.Internal.Linear.Expr.num.inj` | Int.Internal.Linear.Expr.num.inj {v v✝ : Int} : Int.Internal.Linear.Expr.num |
| `Int.Internal.Linear.Expr.num.injEq` | Int.Internal.Linear.Expr.num.injEq (v v✝ : Int) : (Int.Internal.Linear.Expr.num |
| `Int.Internal.Linear.Expr.num.sizeOf_spec` | Int.Internal.Linear.Expr.num.sizeOf_spec (v : Int) : sizeOf (Int.Internal.Linear.Expr.num v) = 1 + sizeOf v |
| `Int.Internal.Linear.Expr.sub.injEq` | Int.Internal.Linear.Expr.sub.injEq (a b a✝ b✝ : Int.Internal.Linear.Expr) : (a.sub b = a✝.sub b✝) = (a = a✝ ∧ b = b✝) |
| `Int.Internal.Linear.Expr.sub.sizeOf_spec` | Int.Internal.Linear.Expr.sub.sizeOf_spec (a b : Int.Internal.Linear.Expr) : sizeOf (a.sub b) = 1 + sizeOf a + sizeOf b |
| `Int.Internal.Linear.Expr.toPoly'.eq_1` | Int.Internal.Linear.Expr.toPoly'.eq_1 (e : Int.Internal.Linear.Expr) : e.toPoly' |
| `Int.Internal.Linear.Expr.toPoly'.go.eq_1` | Int.Internal.Linear.Expr.toPoly'.go.eq_1 (coeff k : Int) : Int.Internal.Linear.Expr.toPoly'.go bif |
| `Int.Internal.Linear.Expr.toPoly'.go.eq_2` | Int.Internal.Linear.Expr.toPoly'.go.eq_2 (coeff : Int) (v : Int.Internal.Linear.Var) : Int.Internal.Linear.Expr.toPoly'.go Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Expr.toPoly'.go.eq_3` | Int.Internal.Linear.Expr.toPoly'.go.eq_3 (coeff : Int) (a b : Int.Internal.Linear.Expr) : Int.Internal.Linear.Expr.toPoly'.go Int.Internal.Linear.Expr.toPoly'.go |
| `Int.Internal.Linear.Expr.toPoly'.go.eq_4` | Int.Internal.Linear.Expr.toPoly'.go.eq_4 (coeff : Int) (a b : Int.Internal.Linear.Expr) : Int.Internal.Linear.Expr.toPoly'.go Int.Internal.Linear.Expr.toPoly'.go |
| `Int.Internal.Linear.Expr.toPoly'.go.eq_5` | Int.Internal.Linear.Expr.toPoly'.go.eq_5 (coeff k : Int) (a : Int.Internal.Linear.Expr) : Int.Internal.Linear.Expr.toPoly'.go bif |
| `Int.Internal.Linear.Expr.toPoly'.go.eq_6` | Int.Internal.Linear.Expr.toPoly'.go.eq_6 (coeff : Int) (a : Int.Internal.Linear.Expr) (k : Int) : Int.Internal.Linear.Expr.toPoly'.go bif |
| `Int.Internal.Linear.Expr.toPoly'.go.eq_7` | Int.Internal.Linear.Expr.toPoly'.go.eq_7 (coeff : Int) (a : Int.Internal.Linear.Expr) : Int.Internal.Linear.Expr.toPoly'.go |
| `Int.Internal.Linear.Expr.toPoly'.go.eq_def` | Int.Internal.Linear.Expr.toPoly'.go.eq_def (coeff : Int) (a✝ : Int.Internal.Linear.Expr) : Int.Internal.Linear.Expr.toPoly'.go match \| \| \| \| \| \| \| |
| `Int.Internal.Linear.Expr.var.inj` | Int.Internal.Linear.Expr.var.inj {i i✝ : Int.Internal.Linear.Var} : Int.Internal.Linear.Expr.var |
| `Int.Internal.Linear.Expr.var.injEq` | Int.Internal.Linear.Expr.var.injEq (i i✝ : Int.Internal.Linear.Var) : (Int.Internal.Linear.Expr.var |
| `Int.Internal.Linear.Expr.var.sizeOf_spec` | Int.Internal.Linear.Expr.var.sizeOf_spec (i : Int.Internal.Linear.Var) : sizeOf |
| `Int.Internal.Linear.OrOver.eq_1` | Int.Internal.Linear.OrOver.eq_1 (p : Nat → Prop) : Int.Internal.Linear.OrOver 0 p = False |
| `Int.Internal.Linear.OrOver.eq_2` | Int.Internal.Linear.OrOver.eq_2 (p : Nat → Prop) (fuel_1 : Nat) : Int.Internal.Linear.OrOver |
| `Int.Internal.Linear.OrOver.eq_def` | Int.Internal.Linear.OrOver.eq_def (n : Nat) (p : Nat → Prop) : Int.Internal.Linear.OrOver match \| \| |
| `Int.Internal.Linear.OrOver_cases_type.eq_1` | Int.Internal.Linear.OrOver_cases_type.eq_1 (p : Nat → Prop) : Int.Internal.Linear.OrOver_cases_type 0 p = p 0 |
| `Int.Internal.Linear.OrOver_cases_type.eq_2` | Int.Internal.Linear.OrOver_cases_type.eq_2 (p : Nat → Prop) (fuel_1 : Nat) : Int.Internal.Linear.OrOver_cases_type (¬p |
| `Int.Internal.Linear.OrOver_cases_type.eq_def` | Int.Internal.Linear.OrOver_cases_type.eq_def (n : Nat) (p : Nat → Prop) : Int.Internal.Linear.OrOver_cases_type match \| \| |
| `Int.Internal.Linear.Poly.add.injEq` | Int.Internal.Linear.Poly.add.injEq (k : Int) (v : Int.Internal.Linear.Var) (p : Int.Internal.Linear.Poly) (k✝ : Int) (v✝ (Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.add.sizeOf_spec` | Int.Internal.Linear.Poly.add.sizeOf_spec (k : Int) (v : Int.Internal.Linear.Var) (p : Int.Internal.Linear.Poly) : sizeOf |
| `Int.Internal.Linear.Poly.addConst.eq_1` | Int.Internal.Linear.Poly.addConst.eq_1 (k k_1 : Int) : (Int.Internal.Linear.Poly.num |
| `Int.Internal.Linear.Poly.addConst.eq_2` | Int.Internal.Linear.Poly.addConst.eq_2 (k k_1 : Int) (v : Int.Internal.Linear.Var) (p_2 : Int.Internal.Linear.Poly) : (Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.addConst.eq_def` | Int.Internal.Linear.Poly.addConst.eq_def (p : Int.Internal.Linear.Poly) (k : Int) : p.addConst match \| \| |
| `Int.Internal.Linear.Poly.addConst_k.eq_1` | Int.Internal.Linear.Poly.addConst_k.eq_1 (p : Int.Internal.Linear.Poly) (k : Int) : p.addConst_k Int.Internal.Linear.Poly.rec (fun |
| `Int.Internal.Linear.Poly.addConst_k_eq_addConst` | Int.Internal.Linear.Poly.addConst_k_eq_addConst (p : Int.Internal.Linear.Poly) (k : Int) : p.addConst_k k = p.addConst k |
| `Int.Internal.Linear.Poly.append.eq_1` | Int.Internal.Linear.Poly.append.eq_1 (p₂ : Int.Internal.Linear.Poly) (k : Int) : (Int.Internal.Linear.Poly.num |
| `Int.Internal.Linear.Poly.append.eq_2` | Int.Internal.Linear.Poly.append.eq_2 (p₂ : Int.Internal.Linear.Poly) (k : Int) (v : Int.Internal.Linear.Var) (p_1 (Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.append.eq_def` | Int.Internal.Linear.Poly.append.eq_def (p₁ p₂ : Int.Internal.Linear.Poly) : p₁.append match \| \| |
| `Int.Internal.Linear.Poly.beq'.eq_1` | Int.Internal.Linear.Poly.beq'.eq_1 (p₁ : Int.Internal.Linear.Poly) : p₁.beq' Int.Internal.Linear.Poly.rec (fun (fun Int.Internal.Linear.Poly.rec (fun p₁ |
| `Int.Internal.Linear.Poly.beq'_eq` | Int.Internal.Linear.Poly.beq'_eq (p₁ p₂ : Int.Internal.Linear.Poly) : (p₁.beq' p₂ = true) = (p₁ = p₂) |
| `Int.Internal.Linear.Poly.brecOn.eq.{u}` | Int.Internal.Linear.Poly.brecOn.eq.{u} {motive : Int.Internal.Linear.Poly → Sort u} (t : Int.Internal.Linear.Poly) (F_1 Int.Internal.Linear.Poly.brecOn |
| `Int.Internal.Linear.Poly.coeff.eq_1` | Int.Internal.Linear.Poly.coeff.eq_1 (x : Int.Internal.Linear.Var) (a : Int) (y : Int.Internal.Linear.Var) (p_2 |
| `Int.Internal.Linear.Poly.coeff.eq_2` | Int.Internal.Linear.Poly.coeff.eq_2 (x : Int.Internal.Linear.Var) (k : Int) : (Int.Internal.Linear.Poly.num |
| `Int.Internal.Linear.Poly.coeff.eq_def` | Int.Internal.Linear.Poly.coeff.eq_def (p : Int.Internal.Linear.Poly) (x : Int.Internal.Linear.Var) : p.coeff match \| \| |
| `Int.Internal.Linear.Poly.coeff_k.eq_1` | Int.Internal.Linear.Poly.coeff_k.eq_1 (p : Int.Internal.Linear.Poly) (x : Int.Internal.Linear.Var) : p.coeff_k |
| `Int.Internal.Linear.Poly.coeff_k_eq_coeff` | Int.Internal.Linear.Poly.coeff_k_eq_coeff (p : Int.Internal.Linear.Poly) (x : Int.Internal.Linear.Var) : p.coeff_k |
| `Int.Internal.Linear.Poly.combine'.eq_def` | Int.Internal.Linear.Poly.combine'.eq_def (fuel : Nat) (p₁ p₂ : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.combine' match \| \| match \| \| Int.Internal.Linear.Poly.add \| Int.Internal.Linear.Poly.add \| bif have bif else else bif Int.Internal.Linear.Poly.add (Int.Internal.Linear.Poly.combine' else Int.Internal.Linear.Poly.add (Int.Internal.Linear.Poly.combine' |
| `Int.Internal.Linear.Poly.combine.eq_1` | Int.Internal.Linear.Poly.combine.eq_1 (p₁ p₂ : Int.Internal.Linear.Poly) : p₁.combine |
| `Int.Internal.Linear.Poly.combine_mul_k'.eq_1` | Int.Internal.Linear.Poly.combine_mul_k'.eq_1 (fuel : Nat) (a b : Int) : Int.Internal.Linear.Poly.combine_mul_k' Nat.rec (fun (fun Int.Internal.Linear.Poly.rec (fun Int.Internal.Linear.Poly.rec (fun (fun Int.Internal.Linear.Poly.rec (fun Bool.rec (Bool.rec (Int.Internal.Linear.Poly.add (Nat.blt (have Bool.rec (Nat.beq p₂) p₁) fuel |
| `Int.Internal.Linear.Poly.denote'.go.eq_1` | Int.Internal.Linear.Poly.denote'.go.eq_1 (ctx : Int.Internal.Linear.Context) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.denote'.go Int.Internal.Linear.Poly.rec (fun Bool.rec (k.beq' p |
| `Int.Internal.Linear.Poly.denote'_add` | Int.Internal.Linear.Poly.denote'_add (ctx : Int.Internal.Linear.Context) (a : Int) (x : Int.Internal.Linear.Var) (p Int.Internal.Linear.Poly.denote' a |
| `Int.Internal.Linear.Poly.denote'_eq_denote` | Int.Internal.Linear.Poly.denote'_eq_denote (ctx : Int.Internal.Linear.Context) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.Poly.denote'_go_eq_denote` | Int.Internal.Linear.Poly.denote'_go_eq_denote (ctx : Int.Internal.Linear.Context) (p : Int.Internal.Linear.Poly) (r |
| `Int.Internal.Linear.Poly.denote.eq_1` | Int.Internal.Linear.Poly.denote.eq_1 (ctx : Int.Internal.Linear.Context) (k : Int) : Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Poly.denote.eq_2` | Int.Internal.Linear.Poly.denote.eq_2 (ctx : Int.Internal.Linear.Context) (k : Int) (v : Int.Internal.Linear.Var) (p_2 Int.Internal.Linear.Poly.denote k |
| `Int.Internal.Linear.Poly.denote.eq_def` | Int.Internal.Linear.Poly.denote.eq_def (ctx : Int.Internal.Linear.Context) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.denote match \| \| k |
| `Int.Internal.Linear.Poly.denote_addConst` | Int.Internal.Linear.Poly.denote_addConst (ctx : Int.Internal.Linear.Context) (p : Int.Internal.Linear.Poly) (k : Int) : Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Poly.denote_append` | Int.Internal.Linear.Poly.denote_append (ctx : Int.Internal.Linear.Context) (p₁ p₂ : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.denote Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Poly.denote_combine` | Int.Internal.Linear.Poly.denote_combine (ctx : Int.Internal.Linear.Context) (p₁ p₂ : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.denote Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Poly.denote_combine'` | Int.Internal.Linear.Poly.denote_combine' (ctx : Int.Internal.Linear.Context) (fuel : Nat) (p₁ Int.Internal.Linear.Poly.denote Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Poly.denote_combine_mul_k` | Int.Internal.Linear.Poly.denote_combine_mul_k (ctx : Int.Internal.Linear.Context) (a b : Int) (p₁ Int.Internal.Linear.Poly.denote a |
| `Int.Internal.Linear.Poly.denote_div_eq_of_divAll` | Int.Internal.Linear.Poly.denote_div_eq_of_divAll (ctx : Int.Internal.Linear.Context) (p : Int.Internal.Linear.Poly) (k Int.Internal.Linear.Poly.divAll Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Poly.denote_div_eq_of_divCoeffs` | Int.Internal.Linear.Poly.denote_div_eq_of_divCoeffs (ctx : Int.Internal.Linear.Context) (p : Int.Internal.Linear.Poly) (k Int.Internal.Linear.Poly.divCoeffs Int.Internal.Linear.Poly.denote Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Poly.denote_insert` | Int.Internal.Linear.Poly.denote_insert (ctx : Int.Internal.Linear.Context) (k : Int) (v : Int.Internal.Linear.Var) (p Int.Internal.Linear.Poly.denote Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Poly.denote_mul` | Int.Internal.Linear.Poly.denote_mul (ctx : Int.Internal.Linear.Context) (p : Int.Internal.Linear.Poly) (k : Int) : Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Poly.denote_norm` | Int.Internal.Linear.Poly.denote_norm (ctx : Int.Internal.Linear.Context) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.denote |
| `Int.Internal.Linear.Poly.div.eq_1` | Int.Internal.Linear.Poly.div.eq_1 (k k_1 : Int) : Int.Internal.Linear.Poly.div Int.Internal.Linear.Poly.num |
| `Int.Internal.Linear.Poly.div.eq_2` | Int.Internal.Linear.Poly.div.eq_2 (k k_1 : Int) (v : Int.Internal.Linear.Var) (p_1 : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.div Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.div.eq_def` | Int.Internal.Linear.Poly.div.eq_def (k : Int) (x✝ : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.div match \| \| |
| `Int.Internal.Linear.Poly.divAll.eq_1` | Int.Internal.Linear.Poly.divAll.eq_1 (k k_1 : Int) : Int.Internal.Linear.Poly.divAll |
| `Int.Internal.Linear.Poly.divAll.eq_2` | Int.Internal.Linear.Poly.divAll.eq_2 (k k_1 : Int) (v : Int.Internal.Linear.Var) (p_1 : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.divAll (k_1 |
| `Int.Internal.Linear.Poly.divAll.eq_def` | Int.Internal.Linear.Poly.divAll.eq_def (k : Int) (x✝ : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.divAll match \| \| |
| `Int.Internal.Linear.Poly.divCoeffs.eq_1` | Int.Internal.Linear.Poly.divCoeffs.eq_1 (k k_1 : Int) : Int.Internal.Linear.Poly.divCoeffs |
| `Int.Internal.Linear.Poly.divCoeffs.eq_2` | Int.Internal.Linear.Poly.divCoeffs.eq_2 (k k_1 : Int) (v : Int.Internal.Linear.Var) (p_1 : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.divCoeffs (k_1 |
| `Int.Internal.Linear.Poly.divCoeffs.eq_def` | Int.Internal.Linear.Poly.divCoeffs.eq_def (k : Int) (x✝ : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.divCoeffs match \| \| |
| `Int.Internal.Linear.Poly.gcdCoeffs.eq_1` | Int.Internal.Linear.Poly.gcdCoeffs.eq_1 (x✝ k : Int) : (Int.Internal.Linear.Poly.num k).gcdCoeffs x✝ = x✝ |
| `Int.Internal.Linear.Poly.gcdCoeffs.eq_2` | Int.Internal.Linear.Poly.gcdCoeffs.eq_2 (x✝ k' : Int) (v : Int.Internal.Linear.Var) (p : Int.Internal.Linear.Poly) : (Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.gcdCoeffs.eq_def` | Int.Internal.Linear.Poly.gcdCoeffs.eq_def (x✝ : Int.Internal.Linear.Poly) (x✝¹ : Int) : x✝.gcdCoeffs match \| \| |
| `Int.Internal.Linear.Poly.getConst.eq_1` | Int.Internal.Linear.Poly.getConst.eq_1 (k : Int) : (Int.Internal.Linear.Poly.num k).getConst = k |
| `Int.Internal.Linear.Poly.getConst.eq_2` | Int.Internal.Linear.Poly.getConst.eq_2 (k : Int) (v : Int.Internal.Linear.Var) (p_1 : Int.Internal.Linear.Poly) : (Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.getConst.eq_def` | Int.Internal.Linear.Poly.getConst.eq_def (x✝ : Int.Internal.Linear.Poly) : x✝.getConst match \| \| |
| `Int.Internal.Linear.Poly.insert.eq_1` | Int.Internal.Linear.Poly.insert.eq_1 (k : Int) (v : Int.Internal.Linear.Var) (k_1 : Int) : Int.Internal.Linear.Poly.insert Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.insert.eq_2` | Int.Internal.Linear.Poly.insert.eq_2 (k : Int) (v : Int.Internal.Linear.Var) (k_1 : Int) (v_1 : Int.Internal.Linear.Var) (p_2 Int.Internal.Linear.Poly.insert bif else bif else |
| `Int.Internal.Linear.Poly.insert.eq_def` | Int.Internal.Linear.Poly.insert.eq_def (k : Int) (v : Int.Internal.Linear.Var) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.insert match \| \| bif else bif else |
| `Int.Internal.Linear.Poly.isUnsatDiseq_k.eq_1` | Int.Internal.Linear.Poly.isUnsatDiseq_k.eq_1 (p : Int.Internal.Linear.Poly) : p.isUnsatDiseq_k |
| `Int.Internal.Linear.Poly.isUnsatDvd.eq_1` | Int.Internal.Linear.Poly.isUnsatDvd.eq_1 (k : Int) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.isUnsatDvd |
| `Int.Internal.Linear.Poly.isUnsatEq.eq_1` | Int.Internal.Linear.Poly.isUnsatEq.eq_1 (k : Int) : (Int.Internal.Linear.Poly.num k).isUnsatEq = (k != 0) |
| `Int.Internal.Linear.Poly.isUnsatEq.eq_2` | Int.Internal.Linear.Poly.isUnsatEq.eq_2 (p : Int.Internal.Linear.Poly) (x_1 |
| `Int.Internal.Linear.Poly.isUnsatEq_k.eq_1` | Int.Internal.Linear.Poly.isUnsatEq_k.eq_1 (p : Int.Internal.Linear.Poly) : p.isUnsatEq_k |
| `Int.Internal.Linear.Poly.isUnsatLe.eq_1` | Int.Internal.Linear.Poly.isUnsatLe.eq_1 (k : Int) : (Int.Internal.Linear.Poly.num k).isUnsatLe = decide (k > 0) |
| `Int.Internal.Linear.Poly.isUnsatLe.eq_2` | Int.Internal.Linear.Poly.isUnsatLe.eq_2 (p : Int.Internal.Linear.Poly) (x_1 |
| `Int.Internal.Linear.Poly.isValidEq.eq_1` | Int.Internal.Linear.Poly.isValidEq.eq_1 (k : Int) : (Int.Internal.Linear.Poly.num k).isValidEq = (k == 0) |
| `Int.Internal.Linear.Poly.isValidEq.eq_2` | Int.Internal.Linear.Poly.isValidEq.eq_2 (p : Int.Internal.Linear.Poly) (x_1 |
| `Int.Internal.Linear.Poly.isValidLe.eq_1` | Int.Internal.Linear.Poly.isValidLe.eq_1 (k : Int) : (Int.Internal.Linear.Poly.num k).isValidLe = decide (k ≤ 0) |
| `Int.Internal.Linear.Poly.isValidLe.eq_2` | Int.Internal.Linear.Poly.isValidLe.eq_2 (p : Int.Internal.Linear.Poly) (x_1 |
| `Int.Internal.Linear.Poly.leadCoeff.eq_1` | Int.Internal.Linear.Poly.leadCoeff.eq_1 (a : Int) (v : Int.Internal.Linear.Var) (p_2 : Int.Internal.Linear.Poly) : (Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.leadCoeff.eq_2` | Int.Internal.Linear.Poly.leadCoeff.eq_2 (p : Int.Internal.Linear.Poly) (x_1 ∀ p p.leadCoeff |
| `Int.Internal.Linear.Poly.mul'.eq_1` | Int.Internal.Linear.Poly.mul'.eq_1 (k k_1 : Int) : (Int.Internal.Linear.Poly.num |
| `Int.Internal.Linear.Poly.mul'.eq_2` | Int.Internal.Linear.Poly.mul'.eq_2 (k k_1 : Int) (v : Int.Internal.Linear.Var) (p_2 : Int.Internal.Linear.Poly) : (Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.mul'.eq_def` | Int.Internal.Linear.Poly.mul'.eq_def (p : Int.Internal.Linear.Poly) (k : Int) : p.mul' match \| \| |
| `Int.Internal.Linear.Poly.mul.eq_1` | Int.Internal.Linear.Poly.mul.eq_1 (p : Int.Internal.Linear.Poly) (k : Int) : p.mul |
| `Int.Internal.Linear.Poly.mul_k.eq_1` | Int.Internal.Linear.Poly.mul_k.eq_1 (p : Int.Internal.Linear.Poly) (k : Int) : p.mul_k Bool.rec (Int.Internal.Linear.Poly.rec (fun (Int.Internal.Linear.Poly.num |
| `Int.Internal.Linear.Poly.mul_k_eq_mul` | Int.Internal.Linear.Poly.mul_k_eq_mul (k : Int) (p : Int.Internal.Linear.Poly) : p.mul_k k = p.mul k |
| `Int.Internal.Linear.Poly.mul_minus_one_getConst_eq` | Int.Internal.Linear.Poly.mul_minus_one_getConst_eq (p : Int.Internal.Linear.Poly) : (p.mul (-1)).getConst = -p.getConst |
| `Int.Internal.Linear.Poly.norm.eq_1` | Int.Internal.Linear.Poly.norm.eq_1 (k : Int) : (Int.Internal.Linear.Poly.num k).norm = Int.Internal.Linear.Poly.num k |
| `Int.Internal.Linear.Poly.norm.eq_2` | Int.Internal.Linear.Poly.norm.eq_2 (k : Int) (v : Int.Internal.Linear.Var) (p_2 : Int.Internal.Linear.Poly) : (Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.norm.eq_def` | Int.Internal.Linear.Poly.norm.eq_def (p : Int.Internal.Linear.Poly) : p.norm match \| \| |
| `Int.Internal.Linear.Poly.num.inj` | Int.Internal.Linear.Poly.num.inj {k k✝ : Int} : Int.Internal.Linear.Poly.num |
| `Int.Internal.Linear.Poly.num.injEq` | Int.Internal.Linear.Poly.num.injEq (k k✝ : Int) : (Int.Internal.Linear.Poly.num |
| `Int.Internal.Linear.Poly.num.sizeOf_spec` | Int.Internal.Linear.Poly.num.sizeOf_spec (k : Int) : sizeOf (Int.Internal.Linear.Poly.num k) = 1 + sizeOf k |
| `Int.Internal.Linear.Poly.tail.eq_1` | Int.Internal.Linear.Poly.tail.eq_1 (a : Int) (v : Int.Internal.Linear.Var) (p_2 : Int.Internal.Linear.Poly) : (Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.Poly.tail.eq_2` | Int.Internal.Linear.Poly.tail.eq_2 (p : Int.Internal.Linear.Poly) (x_1 ∀ p p.tail |
| `Int.Internal.Linear.abs.eq_1` | Int.Internal.Linear.abs.eq_1 (x : Int) : Int.Internal.Linear.abs x = Int.ofNat x.natAbs |
| `Int.Internal.Linear.cdiv.eq_1` | Int.Internal.Linear.cdiv.eq_1 (a b : Int) : Int.Internal.Linear.cdiv a b = -(-a / b) |
| `Int.Internal.Linear.cdiv_add_cmod` | Int.Internal.Linear.cdiv_add_cmod (a b : Int) : b * Int.Internal.Linear.cdiv a b + Int.Internal.Linear.cmod a b = a |
| `Int.Internal.Linear.cdiv_eq_div_of_divides` | Int.Internal.Linear.cdiv_eq_div_of_divides {a b : Int} (h : a % b = 0) : a / b = Int.Internal.Linear.cdiv a b |
| `Int.Internal.Linear.cmod.eq_1` | Int.Internal.Linear.cmod.eq_1 (a b : Int) : Int.Internal.Linear.cmod a b = -(-a % b) |
| `Int.Internal.Linear.cooper_dvd_left_cert.eq_1` | Int.Internal.Linear.cooper_dvd_left_cert.eq_1 (p₁ p₂ p₃ : Int.Internal.Linear.Poly) (d : Int) (n : Nat) : Int.Internal.Linear.cooper_dvd_left_cert Int.Internal.Linear.Poly.casesOn Int.Internal.Linear.Poly.casesOn Int.Internal.Linear.Poly.casesOn (Nat.beq ((Nat.beq ((decide ((decide |
| `Int.Internal.Linear.cooper_dvd_left_split.eq_1` | Int.Internal.Linear.cooper_dvd_left_split.eq_1 (ctx : Int.Internal.Linear.Context) (p₁ p₂ p₃ : Int.Internal.Linear.Poly) (d Int.Internal.Linear.cooper_dvd_left_split (Int.Internal.Linear.Poly.denote' (((p₁.tail.mul 0 p₁.leadCoeff p₁.leadCoeff Int.Internal.Linear.Poly.denote' (((p₁.tail.mul |
| `Int.Internal.Linear.cooper_dvd_left_split_dvd1_cert.eq_1` | Int.Internal.Linear.cooper_dvd_left_split_dvd1_cert.eq_1 (p₁ p' : Int.Internal.Linear.Poly) (a k : Int) : Int.Internal.Linear.cooper_dvd_left_split_dvd1_cert (a.beq' |
| `Int.Internal.Linear.cooper_dvd_left_split_dvd2_cert.eq_1` | Int.Internal.Linear.cooper_dvd_left_split_dvd2_cert.eq_1 (p₁ p₃ : Int.Internal.Linear.Poly) (d : Int) (k : Nat) (d' Int.Internal.Linear.cooper_dvd_left_split_dvd2_cert (d'.beq' (p'.beq' ((Int.Internal.Linear.Poly.combine_mul_k (p₃.leadCoeff |
| `Int.Internal.Linear.cooper_dvd_left_split_ineq_cert.eq_1` | Int.Internal.Linear.cooper_dvd_left_split_ineq_cert.eq_1 (p₁ p₂ : Int.Internal.Linear.Poly) (k b : Int) (p' Int.Internal.Linear.cooper_dvd_left_split_ineq_cert (p₂.leadCoeff.beq' (p'.beq' |
| `Int.Internal.Linear.cooper_dvd_right_cert.eq_1` | Int.Internal.Linear.cooper_dvd_right_cert.eq_1 (p₁ p₂ p₃ : Int.Internal.Linear.Poly) (d : Int) (n : Nat) : Int.Internal.Linear.cooper_dvd_right_cert Int.Internal.Linear.Poly.casesOn Int.Internal.Linear.Poly.casesOn Int.Internal.Linear.Poly.casesOn Nat.beq (Nat.beq (decide |
| `Int.Internal.Linear.cooper_dvd_right_split.eq_1` | Int.Internal.Linear.cooper_dvd_right_split.eq_1 (ctx : Int.Internal.Linear.Context) (p₁ Int.Internal.Linear.cooper_dvd_right_split (Int.Internal.Linear.Poly.denote' (((p₁.tail.mul 0 p₂.leadCoeff p₂.leadCoeff Int.Internal.Linear.Poly.denote' (((p₂.tail.mul |
| `Int.Internal.Linear.cooper_dvd_right_split_dvd1_cert.eq_1` | Int.Internal.Linear.cooper_dvd_right_split_dvd1_cert.eq_1 (p₂ p' : Int.Internal.Linear.Poly) (b k : Int) : Int.Internal.Linear.cooper_dvd_right_split_dvd1_cert (b.beq' |
| `Int.Internal.Linear.cooper_dvd_right_split_dvd2_cert.eq_1` | Int.Internal.Linear.cooper_dvd_right_split_dvd2_cert.eq_1 (p₂ p₃ : Int.Internal.Linear.Poly) (d : Int) (k : Nat) (d' Int.Internal.Linear.cooper_dvd_right_split_dvd2_cert (d'.beq' (p'.beq' ((Int.Internal.Linear.Poly.combine_mul_k (-p₃.leadCoeff |
| `Int.Internal.Linear.cooper_dvd_right_split_ineq_cert.eq_1` | Int.Internal.Linear.cooper_dvd_right_split_ineq_cert.eq_1 (p₁ p₂ : Int.Internal.Linear.Poly) (k a : Int) (p' Int.Internal.Linear.cooper_dvd_right_split_ineq_cert (p₁.leadCoeff.beq' (p'.beq' |
| `Int.Internal.Linear.cooper_left_cert.eq_1` | Int.Internal.Linear.cooper_left_cert.eq_1 (p₁ p₂ : Int.Internal.Linear.Poly) (n : Nat) : Int.Internal.Linear.cooper_left_cert Int.Internal.Linear.Poly.casesOn Int.Internal.Linear.Poly.casesOn (Nat.beq |
| `Int.Internal.Linear.cooper_left_split.eq_1` | Int.Internal.Linear.cooper_left_split.eq_1 (ctx : Int.Internal.Linear.Context) (p₁ p₂ : Int.Internal.Linear.Poly) (k Int.Internal.Linear.cooper_left_split (Int.Internal.Linear.Poly.denote' (((p₁.tail.mul 0 p₁.leadCoeff |
| `Int.Internal.Linear.cooper_left_split_dvd_cert.eq_1` | Int.Internal.Linear.cooper_left_split_dvd_cert.eq_1 (p₁ p' : Int.Internal.Linear.Poly) (a k : Int) : Int.Internal.Linear.cooper_left_split_dvd_cert |
| `Int.Internal.Linear.cooper_left_split_ineq_cert.eq_1` | Int.Internal.Linear.cooper_left_split_ineq_cert.eq_1 (p₁ p₂ : Int.Internal.Linear.Poly) (k b : Int) (p' Int.Internal.Linear.cooper_left_split_ineq_cert (p₂.leadCoeff.beq' (p'.beq' |
| `Int.Internal.Linear.cooper_right_cert.eq_1` | Int.Internal.Linear.cooper_right_cert.eq_1 (p₁ p₂ : Int.Internal.Linear.Poly) (n : Nat) : Int.Internal.Linear.cooper_right_cert Int.Internal.Linear.Poly.casesOn Int.Internal.Linear.Poly.casesOn (Nat.beq |
| `Int.Internal.Linear.cooper_right_split.eq_1` | Int.Internal.Linear.cooper_right_split.eq_1 (ctx : Int.Internal.Linear.Context) (p₁ p₂ : Int.Internal.Linear.Poly) (k Int.Internal.Linear.cooper_right_split (Int.Internal.Linear.Poly.denote' (((p₁.tail.mul_k 0 p₂.leadCoeff |
| `Int.Internal.Linear.cooper_right_split_dvd_cert.eq_1` | Int.Internal.Linear.cooper_right_split_dvd_cert.eq_1 (p₂ p' : Int.Internal.Linear.Poly) (b k : Int) : Int.Internal.Linear.cooper_right_split_dvd_cert (b.beq' |
| `Int.Internal.Linear.cooper_right_split_ineq_cert.eq_1` | Int.Internal.Linear.cooper_right_split_ineq_cert.eq_1 (p₁ p₂ : Int.Internal.Linear.Poly) (k a : Int) (p' Int.Internal.Linear.cooper_right_split_ineq_cert (p₁.leadCoeff.beq' (p'.beq' |
| `Int.Internal.Linear.diseq_eq_subst_cert.eq_1` | Int.Internal.Linear.diseq_eq_subst_cert.eq_1 (x : Int.Internal.Linear.Var) (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.diseq_eq_subst_cert (!(p₁.coeff |
| `Int.Internal.Linear.diseq_split_cert.eq_1` | Int.Internal.Linear.diseq_split_cert.eq_1 (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.diseq_split_cert (p₂.beq' |
| `Int.Internal.Linear.div_eq` | Int.Internal.Linear.div_eq (a b k : Int) (h : b = k) : a / b = a / k |
| `Int.Internal.Linear.div_eq'` | Int.Internal.Linear.div_eq' (a b b' k : Int) (h₁ : b = b') (h₂ : (k == a / b') = true) : a / b = k |
| `Int.Internal.Linear.dvd_coeff_cert.eq_1` | Int.Internal.Linear.dvd_coeff_cert.eq_1 (k₁ : Int) (p₁ : Int.Internal.Linear.Poly) (k₂ : Int) (p₂ Int.Internal.Linear.dvd_coeff_cert |
| `Int.Internal.Linear.dvd_elim_cert.eq_1` | Int.Internal.Linear.dvd_elim_cert.eq_1 (k₁ : Int) (p₁ : Int.Internal.Linear.Poly) (k₂ : Int) (p₂ Int.Internal.Linear.dvd_elim_cert Int.Internal.Linear.Poly.rec |
| `Int.Internal.Linear.dvd_eq_false` | Int.Internal.Linear.dvd_eq_false (ctx : Int.Internal.Linear.Context) (k : Int) (e : Int.Internal.Linear.Expr) (h |
| `Int.Internal.Linear.dvd_le_tight_cert.eq_1` | Int.Internal.Linear.dvd_le_tight_cert.eq_1 (d : Int) (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.dvd_le_tight_cert (Int.blt' ((p₂.beq' (p₃.beq' |
| `Int.Internal.Linear.dvd_neg_le_tight_cert.eq_1` | Int.Internal.Linear.dvd_neg_le_tight_cert.eq_1 (d : Int) (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.dvd_neg_le_tight_cert (Int.blt' ((p₂.beq' (p₃.beq' (((p₁.addConst_k (-p₁.getConst |
| `Int.Internal.Linear.dvd_of_eq_cert.eq_1` | Int.Internal.Linear.dvd_of_eq_cert.eq_1 (x : Int.Internal.Linear.Var) (p₁ : Int.Internal.Linear.Poly) (d₂ : Int) (p₂ Int.Internal.Linear.dvd_of_eq_cert (d₂.beq' (p₂.beq' |
| `Int.Internal.Linear.dvd_solve_combine_cert.eq_1` | Int.Internal.Linear.dvd_solve_combine_cert.eq_1 (d₁ : Int) (p₁ : Int.Internal.Linear.Poly) (d₂ : Int) (p₂ Int.Internal.Linear.dvd_solve_combine_cert Int.Internal.Linear.Poly.rec (fun Int.Internal.Linear.Poly.rec (fun (Nat.beq ((g.beq' ((d.beq' (p.beq' (Int.Internal.Linear.Poly.add (Int.Internal.Linear.Poly.combine_mul_k p₂) p₁ |
| `Int.Internal.Linear.dvd_solve_elim_cert.eq_1` | Int.Internal.Linear.dvd_solve_elim_cert.eq_1 (d₁ d₂ d : Int) (p : Int.Internal.Linear.Poly) (a₁ : Int) (x₁ (p₂_2 Int.Internal.Linear.dvd_solve_elim_cert (Int.Internal.Linear.Poly.add (Nat.beq (d.beq' |
| `Int.Internal.Linear.dvd_solve_elim_cert.eq_2` | Int.Internal.Linear.dvd_solve_elim_cert.eq_2 (d₁ : Int) (p₁ : Int.Internal.Linear.Poly) (d₂ : Int) (p₂ (x_2 ∀ (x₂ p₁ Int.Internal.Linear.dvd_solve_elim_cert |
| `Int.Internal.Linear.ediv_emod` | Int.Internal.Linear.ediv_emod (x y : Int) : -1 * x + y * (x / y) + x % y = 0 |
| `Int.Internal.Linear.emod_le_cert.eq_1` | Int.Internal.Linear.emod_le_cert.eq_1 (y n : Int) : Int.Internal.Linear.emod_le_cert |
| `Int.Internal.Linear.eq_coeff` | Int.Internal.Linear.eq_coeff (ctx : Int.Internal.Linear.Context) (p p' : Int.Internal.Linear.Poly) (k : Int) : Int.Internal.Linear.eq_coeff_cert Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_coeff_cert.eq_1` | Int.Internal.Linear.eq_coeff_cert.eq_1 (p p' : Int.Internal.Linear.Poly) (k : Int) : Int.Internal.Linear.eq_coeff_cert |
| `Int.Internal.Linear.eq_def` | Int.Internal.Linear.eq_def (ctx : Int.Internal.Linear.Context) (x : Int.Internal.Linear.Var) (xPoly Int.Internal.Linear.eq_def_cert Int.Internal.Linear.Var.denote Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_def'` | Int.Internal.Linear.eq_def' (ctx : Int.Internal.Linear.Context) (x : Int.Internal.Linear.Var) (e Int.Internal.Linear.eq_def'_cert Int.Internal.Linear.Var.denote Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_def'_cert.eq_1` | Int.Internal.Linear.eq_def'_cert.eq_1 (x : Int.Internal.Linear.Var) (e : Int.Internal.Linear.Expr) (p Int.Internal.Linear.eq_def'_cert |
| `Int.Internal.Linear.eq_def'_norm` | Int.Internal.Linear.eq_def'_norm (ctx : Int.Internal.Linear.Context) (x : Int.Internal.Linear.Var) (e Int.Internal.Linear.eq_def'_norm_cert Int.Internal.Linear.Var.denote Int.Internal.Linear.Poly.denote' Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_def'_norm_cert.eq_1` | Int.Internal.Linear.eq_def'_norm_cert.eq_1 (x : Int.Internal.Linear.Var) (e : Int.Internal.Linear.Expr) (ePoly Int.Internal.Linear.eq_def'_norm_cert (ePoly.beq' |
| `Int.Internal.Linear.eq_def_cert.eq_1` | Int.Internal.Linear.eq_def_cert.eq_1 (x : Int.Internal.Linear.Var) (xPoly p : Int.Internal.Linear.Poly) : Int.Internal.Linear.eq_def_cert |
| `Int.Internal.Linear.eq_def_norm` | Int.Internal.Linear.eq_def_norm (ctx : Int.Internal.Linear.Context) (x : Int.Internal.Linear.Var) (xPoly Int.Internal.Linear.eq_def_cert Int.Internal.Linear.Var.denote Int.Internal.Linear.Poly.denote' Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_dvd_subst_cert.eq_1` | Int.Internal.Linear.eq_dvd_subst_cert.eq_1 (x : Int.Internal.Linear.Var) (p₁ : Int.Internal.Linear.Poly) (d₂ : Int) (p₂ Int.Internal.Linear.eq_dvd_subst_cert (d₃.beq' (p₃.beq' (Int.Internal.Linear.Poly.combine_mul_k (Int.Internal.Linear.Poly.insert (Int.Internal.Linear.Poly.insert |
| `Int.Internal.Linear.eq_eq_false` | Int.Internal.Linear.eq_eq_false (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) : (lhs.sub (Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.eq_eq_false_of_divCoeff` | Int.Internal.Linear.eq_eq_false_of_divCoeff (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) (k Int.Internal.Linear.unsatEqDivCoeffCert (Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.eq_eq_subst` | Int.Internal.Linear.eq_eq_subst (ctx : Int.Internal.Linear.Context) (x : Int.Internal.Linear.Var) (p₁ Int.Internal.Linear.eq_eq_subst_cert Int.Internal.Linear.Poly.denote' Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_eq_subst'` | Int.Internal.Linear.eq_eq_subst' (ctx : Int.Internal.Linear.Context) (a b : Int) (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.eq_eq_subst'_cert Int.Internal.Linear.Poly.denote' Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_eq_subst'_cert.eq_1` | Int.Internal.Linear.eq_eq_subst'_cert.eq_1 (a b : Int) (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.eq_eq_subst'_cert |
| `Int.Internal.Linear.eq_eq_subst_cert.eq_1` | Int.Internal.Linear.eq_eq_subst_cert.eq_1 (x : Int.Internal.Linear.Var) (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.eq_eq_subst_cert p₃.beq' |
| `Int.Internal.Linear.eq_eq_true` | Int.Internal.Linear.eq_eq_true (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) : (lhs.sub (Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.eq_le_subst_nonneg_cert.eq_1` | Int.Internal.Linear.eq_le_subst_nonneg_cert.eq_1 (x : Int.Internal.Linear.Var) (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.eq_le_subst_nonneg_cert (Int.ble' |
| `Int.Internal.Linear.eq_le_subst_nonpos_cert.eq_1` | Int.Internal.Linear.eq_le_subst_nonpos_cert.eq_1 (x : Int.Internal.Linear.Var) (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.eq_le_subst_nonpos_cert ((p₁.coeff |
| `Int.Internal.Linear.eq_norm` | Int.Internal.Linear.eq_norm (ctx : Int.Internal.Linear.Context) (p₁ p₂ : Int.Internal.Linear.Poly) (h Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_norm_expr` | Int.Internal.Linear.eq_norm_expr (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) (p Int.Internal.Linear.norm_eq_cert Int.Internal.Linear.Expr.denote Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_norm_poly` | Int.Internal.Linear.eq_norm_poly (ctx : Int.Internal.Linear.Context) (p p' : Int.Internal.Linear.Poly) : Int.Internal.Linear.Poly.denote' Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_of_core` | Int.Internal.Linear.eq_of_core (ctx : Int.Internal.Linear.Context) (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.eq_of_core_cert Int.Internal.Linear.Poly.denote' Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_of_core_cert.eq_1` | Int.Internal.Linear.eq_of_core_cert.eq_1 (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.eq_of_core_cert |
| `Int.Internal.Linear.eq_of_le_ge` | Int.Internal.Linear.eq_of_le_ge (ctx : Int.Internal.Linear.Context) (p₁ p₂ : Int.Internal.Linear.Poly) : Int.Internal.Linear.eq_of_le_ge_cert Int.Internal.Linear.Poly.denote' Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.eq_of_le_ge_cert.eq_1` | Int.Internal.Linear.eq_of_le_ge_cert.eq_1 (p₁ p₂ : Int.Internal.Linear.Poly) : Int.Internal.Linear.eq_of_le_ge_cert |
| `Int.Internal.Linear.eq_of_zero_dvd` | Int.Internal.Linear.eq_of_zero_dvd (ctx : Int.Internal.Linear.Context) (p : Int.Internal.Linear.Poly) : 0 |
| `Int.Internal.Linear.eq_one_mul` | Int.Internal.Linear.eq_one_mul (a : Int) : a = 1 * a |
| `Int.Internal.Linear.eq_unsat_coeff_cert.eq_1` | Int.Internal.Linear.eq_unsat_coeff_cert.eq_1 (p : Int.Internal.Linear.Poly) (k : Int) : Int.Internal.Linear.eq_unsat_coeff_cert (Int.Internal.Linear.Poly.divCoeffs ((Int.blt' |
| `Int.Internal.Linear.instBEqPoly.beq.eq_1` | Int.Internal.Linear.instBEqPoly.beq.eq_1 (a b : Int) : Int.Internal.Linear.instBEqPoly.beq |
| `Int.Internal.Linear.instBEqPoly.beq.eq_2` | Int.Internal.Linear.instBEqPoly.beq.eq_2 (a : Int) (a_1 : Int.Internal.Linear.Var) (a_2 : Int.Internal.Linear.Poly) (b Int.Internal.Linear.instBEqPoly.beq (Int.Internal.Linear.Poly.add (a |
| `Int.Internal.Linear.instBEqPoly.beq.eq_3` | Int.Internal.Linear.instBEqPoly.beq.eq_3 (x✝ x✝¹ : Int.Internal.Linear.Poly) (x_4 (x_5 ∀ (b_1 x✝ Int.Internal.Linear.instBEqPoly.beq |
| `Int.Internal.Linear.instBEqPoly.beq.eq_def` | Int.Internal.Linear.instBEqPoly.beq.eq_def (x✝ x✝¹ : Int.Internal.Linear.Poly) : Int.Internal.Linear.instBEqPoly.beq match \| \| a \| |
| `Int.Internal.Linear.instBEqPoly.beq_spec` | Int.Internal.Linear.instBEqPoly.beq_spec (x✝ x✝¹ : Int.Internal.Linear.Poly) : (x✝ match \| \| a \| |
| `Int.Internal.Linear.instBEqPoly.beq_spec_1` | Int.Internal.Linear.instBEqPoly.beq_spec_1 (a b : Int) : (Int.Internal.Linear.Poly.num |
| `Int.Internal.Linear.instBEqPoly.beq_spec_2` | Int.Internal.Linear.instBEqPoly.beq_spec_2 (a : Int) (a_1 : Int.Internal.Linear.Var) (a_2 : Int.Internal.Linear.Poly) (b (Int.Internal.Linear.Poly.add (a |
| `Int.Internal.Linear.instBEqPoly.beq_spec_3` | Int.Internal.Linear.instBEqPoly.beq_spec_3 (x✝ x✝¹ : Int.Internal.Linear.Poly) (x_4 (x_5 ∀ (b_1 x✝ (x✝ |
| `Int.Internal.Linear.le_coeff_cert.eq_1` | Int.Internal.Linear.le_coeff_cert.eq_1 (p₁ p₂ : Int.Internal.Linear.Poly) (k : Int) : Int.Internal.Linear.le_coeff_cert (Int.blt' |
| `Int.Internal.Linear.le_combine_cert.eq_1` | Int.Internal.Linear.le_combine_cert.eq_1 (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.le_combine_cert p₃.beq' |
| `Int.Internal.Linear.le_combine_coeff_cert.eq_1` | Int.Internal.Linear.le_combine_coeff_cert.eq_1 (p₁ p₂ p₃ : Int.Internal.Linear.Poly) (k : Int) : Int.Internal.Linear.le_combine_coeff_cert (Int.blt' ((Int.Internal.Linear.Poly.divCoeffs (Int.Internal.Linear.Poly.combine_mul_k (p₃.beq' (Int.Internal.Linear.Poly.div (Int.Internal.Linear.Poly.combine_mul_k |
| `Int.Internal.Linear.le_eq_false` | Int.Internal.Linear.le_eq_false (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) : (lhs.sub (Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.le_eq_true` | Int.Internal.Linear.le_eq_true (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) : (lhs.sub (Int.Internal.Linear.Expr.denote |
| `Int.Internal.Linear.le_neg_cert.eq_1` | Int.Internal.Linear.le_neg_cert.eq_1 (p₁ p₂ : Int.Internal.Linear.Poly) : Int.Internal.Linear.le_neg_cert |
| `Int.Internal.Linear.le_of_le_cert.eq_def` | Int.Internal.Linear.le_of_le_cert.eq_def (p₁ p₂ : Int.Internal.Linear.Poly) : Int.Internal.Linear.le_of_le_cert match \| \| \| \| a₁ |
| `Int.Internal.Linear.le_of_le_diseq_cert.eq_1` | Int.Internal.Linear.le_of_le_diseq_cert.eq_1 (p₁ p₂ p₃ : Int.Internal.Linear.Poly) : Int.Internal.Linear.le_of_le_diseq_cert (p₂.beq' |
| `Int.Internal.Linear.mod_eq` | Int.Internal.Linear.mod_eq (a b k : Int) (h : b = k) : a % b = a % k |
| `Int.Internal.Linear.mod_eq'` | Int.Internal.Linear.mod_eq' (a b b' k : Int) (h₁ : b = b') (h₂ : (k == a % b') = true) : a % b = k |
| `Int.Internal.Linear.mul_eq_kk` | Int.Internal.Linear.mul_eq_kk (a b k₁ k₂ k : Int) (h₁ : a = k₁) (h₂ : b = k₂) (h₃ : (k₁ * k₂ == k) = true) : a * b = k |
| `Int.Internal.Linear.mul_eq_kkx` | Int.Internal.Linear.mul_eq_kkx (a b k₁ k₂ c k : Int) (h₁ : a = k₁) (h₂ : b = k₂ * c) (h₃ : (k₁ * k₂ == k) = true) : a |
| `Int.Internal.Linear.mul_eq_kxk` | Int.Internal.Linear.mul_eq_kxk (a b k₁ c k₂ k : Int) (h₁ : a = k₁ * c) (h₂ : b = k₂) (h₃ : (k₁ * k₂ == k) = true) : a |
| `Int.Internal.Linear.mul_eq_zero_left` | Int.Internal.Linear.mul_eq_zero_left (a b : Int) (h : a = 0) : a * b = 0 |
| `Int.Internal.Linear.mul_eq_zero_right` | Int.Internal.Linear.mul_eq_zero_right (a b : Int) (h : b = 0) : a * b = 0 |
| `Int.Internal.Linear.natCast_sub` | Int.Internal.Linear.natCast_sub (x y : Nat) : ↑(x - y) = if ↑y + -1 * ↑x ≤ 0 then ↑x + -1 * ↑y else 0 |
| `Int.Internal.Linear.neg_fold` | Int.Internal.Linear.neg_fold (a : Int) : a.neg = -a |
| `Int.Internal.Linear.norm_dvd` | Int.Internal.Linear.norm_dvd (ctx : Int.Internal.Linear.Context) (k : Int) (e : Int.Internal.Linear.Expr) (p e.norm.beq' |
| `Int.Internal.Linear.norm_dvd_gcd` | Int.Internal.Linear.norm_dvd_gcd (ctx : Int.Internal.Linear.Context) (k₁ : Int) (e₁ : Int.Internal.Linear.Expr) (k₂ Int.Internal.Linear.norm_dvd_gcd_cert (k₁ |
| `Int.Internal.Linear.norm_dvd_gcd_cert.eq_1` | Int.Internal.Linear.norm_dvd_gcd_cert.eq_1 (k₁ : Int) (e₁ : Int.Internal.Linear.Expr) (k₂ : Int) (p₂ Int.Internal.Linear.norm_dvd_gcd_cert |
| `Int.Internal.Linear.norm_eq` | Int.Internal.Linear.norm_eq (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) (p (Int.Internal.Linear.Expr.denote (Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.norm_eq_cert.eq_1` | Int.Internal.Linear.norm_eq_cert.eq_1 (lhs rhs : Int.Internal.Linear.Expr) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.norm_eq_cert |
| `Int.Internal.Linear.norm_eq_coeff` | Int.Internal.Linear.norm_eq_coeff (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) (p Int.Internal.Linear.norm_eq_coeff_cert (Int.Internal.Linear.Expr.denote (Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.norm_eq_coeff_cert.eq_1` | Int.Internal.Linear.norm_eq_coeff_cert.eq_1 (lhs rhs : Int.Internal.Linear.Expr) (p : Int.Internal.Linear.Poly) (k Int.Internal.Linear.norm_eq_coeff_cert |
| `Int.Internal.Linear.norm_eq_var` | Int.Internal.Linear.norm_eq_var (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) (x (Int.Internal.Linear.Expr.denote (Int.Internal.Linear.Var.denote |
| `Int.Internal.Linear.norm_eq_var_cert.eq_1` | Int.Internal.Linear.norm_eq_var_cert.eq_1 (lhs rhs : Int.Internal.Linear.Expr) (x y : Int.Internal.Linear.Var) : Int.Internal.Linear.norm_eq_var_cert (lhs.sub (Int.Internal.Linear.Poly.add |
| `Int.Internal.Linear.norm_eq_var_const` | Int.Internal.Linear.norm_eq_var_const (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) (x (Int.Internal.Linear.Expr.denote (Int.Internal.Linear.Var.denote |
| `Int.Internal.Linear.norm_eq_var_const_cert.eq_1` | Int.Internal.Linear.norm_eq_var_const_cert.eq_1 (lhs rhs : Int.Internal.Linear.Expr) (x : Int.Internal.Linear.Var) (k Int.Internal.Linear.norm_eq_var_const_cert (lhs.sub |
| `Int.Internal.Linear.norm_le` | Int.Internal.Linear.norm_le (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) (p (Int.Internal.Linear.Expr.denote (Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.norm_le_coeff` | Int.Internal.Linear.norm_le_coeff (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) (p Int.Internal.Linear.norm_eq_coeff_cert (Int.Internal.Linear.Expr.denote (Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.norm_le_coeff_tight` | Int.Internal.Linear.norm_le_coeff_tight (ctx : Int.Internal.Linear.Context) (lhs rhs : Int.Internal.Linear.Expr) (p Int.Internal.Linear.norm_le_coeff_tight_cert (Int.Internal.Linear.Expr.denote (Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.norm_le_coeff_tight_cert.eq_1` | Int.Internal.Linear.norm_le_coeff_tight_cert.eq_1 (lhs rhs : Int.Internal.Linear.Expr) (p : Int.Internal.Linear.Poly) (k Int.Internal.Linear.norm_le_coeff_tight_cert (Int.blt' ((Int.Internal.Linear.Poly.divCoeffs (p.beq' |
| `Int.Internal.Linear.not_le_norm_expr_cert.eq_1` | Int.Internal.Linear.not_le_norm_expr_cert.eq_1 (lhs rhs : Int.Internal.Linear.Expr) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.not_le_norm_expr_cert |
| `Int.Internal.Linear.not_le_of_le_cert.eq_def` | Int.Internal.Linear.not_le_of_le_cert.eq_def (p₁ p₂ : Int.Internal.Linear.Poly) : Int.Internal.Linear.not_le_of_le_cert match \| \| \| \| a₁ |
| `Int.Internal.Linear.of_var_eq` | Int.Internal.Linear.of_var_eq (ctx : Int.Internal.Linear.Context) (x : Int.Internal.Linear.Var) (k : Int) (p Int.Internal.Linear.of_var_eq_cert Int.Internal.Linear.Var.denote |
| `Int.Internal.Linear.of_var_eq_cert.eq_1` | Int.Internal.Linear.of_var_eq_cert.eq_1 (x : Int.Internal.Linear.Var) (k : Int) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.of_var_eq_cert p.beq' |
| `Int.Internal.Linear.of_var_eq_mul` | Int.Internal.Linear.of_var_eq_mul (ctx : Int.Internal.Linear.Context) (x : Int.Internal.Linear.Var) (k : Int) (y Int.Internal.Linear.of_var_eq_mul_cert Int.Internal.Linear.Var.denote Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.of_var_eq_mul_cert.eq_1` | Int.Internal.Linear.of_var_eq_mul_cert.eq_1 (x : Int.Internal.Linear.Var) (k : Int) (y : Int.Internal.Linear.Var) (p Int.Internal.Linear.of_var_eq_mul_cert p.beq' |
| `Int.Internal.Linear.of_var_eq_var` | Int.Internal.Linear.of_var_eq_var (ctx : Int.Internal.Linear.Context) (x y : Int.Internal.Linear.Var) (p Int.Internal.Linear.of_var_eq_var_cert Int.Internal.Linear.Var.denote Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.of_var_eq_var_cert.eq_1` | Int.Internal.Linear.of_var_eq_var_cert.eq_1 (x y : Int.Internal.Linear.Var) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.of_var_eq_var_cert p.beq' |
| `Int.Internal.Linear.pow_eq` | Int.Internal.Linear.pow_eq (a : Int) (b : Nat) (a' b' k : Int) (h₁ : a = a') (h₂ : ↑b = b') (h₃ |
| `Int.Internal.Linear.sub_fold` | Int.Internal.Linear.sub_fold (a b : Int) : a.sub b = a - b |
| `Int.Internal.Linear.unsatEqDivCoeffCert.eq_1` | Int.Internal.Linear.unsatEqDivCoeffCert.eq_1 (lhs rhs : Int.Internal.Linear.Expr) (k : Int) : Int.Internal.Linear.unsatEqDivCoeffCert (Int.Internal.Linear.Poly.divCoeffs ((Int.blt' |
| `Int.Internal.Linear.var_eq` | Int.Internal.Linear.var_eq (ctx : Int.Internal.Linear.Context) (x : Int.Internal.Linear.Var) (k : Int) (p Int.Internal.Linear.var_eq_cert Int.Internal.Linear.Poly.denote' |
| `Int.Internal.Linear.var_eq_cert.eq_1` | Int.Internal.Linear.var_eq_cert.eq_1 (x : Int.Internal.Linear.Var) (k : Int) (p : Int.Internal.Linear.Poly) : Int.Internal.Linear.var_eq_cert Int.Internal.Linear.Poly.rec (fun Int.Internal.Linear.Poly.rec p |
| `Int.Nonneg.num_cert.eq_1` | Int.Nonneg.num_cert.eq_1 (a : Int) : Int.Nonneg.num_cert a = decide (a ≥ 0) |
| `Int.bdiv_add_bmod` | Int.bdiv_add_bmod (x : Int) (m : Nat) : ↑m * x.bdiv m + x.bmod m = x |
| `Int.bdiv_add_bmod'` | Int.bdiv_add_bmod' (x : Int) (m : Nat) : x.bdiv m * ↑m + x.bmod m = x |
| `Int.beq'.eq_1` | Int.beq'.eq_1 (a b : Int) : a.beq' Int.rec (fun |
| `Int.beq'_eq` | Int.beq'_eq (a b : Int) : (a.beq' b = true) = (a = b) |
| `Int.beq'_eq_beq` | Int.beq'_eq_beq (a b : Int) : a.beq' b = (a == b) |
| `Int.beq'_ne` | Int.beq'_ne (a b : Int) : (a.beq' b = false) = (a ≠ b) |
| `Int.ble'.eq_1` | Int.ble'.eq_1 (a b : Int) : a.ble' Int.rec (fun |
| `Int.ble'_eq_false` | Int.ble'_eq_false (a b : Int) : (a.ble' b = false) = ¬a ≤ b |
| `Int.ble'_eq_true` | Int.ble'_eq_true (a b : Int) : (a.ble' b = true) = (a ≤ b) |
| `Int.blt'.eq_1` | Int.blt'.eq_1 (a b : Int) : a.blt' Int.rec (fun |
| `Int.blt'_eq_false` | Int.blt'_eq_false (a b : Int) : (a.blt' b = false) = ¬a < b |
| `Int.blt'_eq_true` | Int.blt'_eq_true (a b : Int) : (a.blt' b = true) = (a < b) |
| `Int.compare_eq_ite_le` | Int.compare_eq_ite_le (a b : Int) : compare |
| `Int.compare_eq_ite_lt` | Int.compare_eq_ite_lt (a b : Int) : compare |
| `Int.compare_swap` | Int.compare_swap (a b : Int) : (compare a b).swap = compare b a |
| `Int.default_eq_zero` | Int.default_eq_zero : default = 0 |
| `Int.divExact.congr_simp` | Int.divExact.congr_simp (x x✝ : Int) (e_x : x = x✝) (y y✝ : Int) (e_y : y = y✝) (h : y ∣ x) : x.divExact |
| `Int.divExact_eq_bdiv` | Int.divExact_eq_bdiv {a : Int} {b : Nat} (h : ↑b ∣ a) : a.divExact (↑b) h = a.bdiv b |
| `Int.divExact_eq_ediv` | Int.divExact_eq_ediv {x y : Int} (h : y ∣ x) : x.divExact y h = x / y |
| `Int.divExact_eq_fdiv` | Int.divExact_eq_fdiv {a b : Int} (h : b ∣ a) : a.divExact b h = a.fdiv b |
| `Int.divExact_eq_tdiv` | Int.divExact_eq_tdiv {a b : Int} (h : b ∣ a) : a.divExact b h = a.tdiv b |
| `Int.ext_ediv_emod` | Int.ext_ediv_emod {n a b : Int} (h0 : a / n = b / n) (h1 : a % n = b % n) : a = b |
| `Int.fmod.eq_1` | Int.fmod.eq_1 (x✝ : Int) : Int.fmod 0 x✝ = 0 |
| `Int.fmod.eq_2` | Int.fmod.eq_2 (m n : Nat) (x_2 : m = 0 → False) : (Int.ofNat m).fmod (Int.ofNat n) = Int.ofNat (m % n) |
| `Int.fmod.eq_3` | Int.fmod.eq_3 (m n : Nat) : (Int.ofNat m.succ).fmod (Int.negSucc n) = Int.subNatNat (m % n.succ) n |
| `Int.fmod.eq_4` | Int.fmod.eq_4 (m n : Nat) : (Int.negSucc m).fmod (Int.ofNat n) = Int.subNatNat n (m % n).succ |
| `Int.fmod.eq_5` | Int.fmod.eq_5 (m n : Nat) : (Int.negSucc m).fmod (Int.negSucc n) = -Int.ofNat (m.succ % n.succ) |
| `Int.fmod_add_fdiv_mul` | Int.fmod_add_fdiv_mul (a b : Int) : a.fmod b + a.fdiv b * b = a |
| `Int.fmod_add_fmod` | Int.fmod_add_fmod (m n k : Int) : (m.fmod n + k).fmod n = (m + k).fmod n |
| `Int.fmod_add_mul_fdiv` | Int.fmod_add_mul_fdiv (a b : Int) : a.fmod b + b * a.fdiv b = a |
| `Int.fmod_def` | Int.fmod_def (a b : Int) : a.fmod b = a - b * a.fdiv b |
| `Int.fmod_eq_emod` | Int.fmod_eq_emod {a b : Int} : a.fmod b = a % b + if 0 ≤ b ∨ b ∣ a then 0 else b |
| `Int.fmod_eq_emod_of_nonneg` | Int.fmod_eq_emod_of_nonneg (a : Int) {b : Int} (hb : 0 ≤ b) : a.fmod b = a % b |
| `Int.fmod_eq_of_lt` | Int.fmod_eq_of_lt {a b : Int} (H1 : 0 ≤ a) (H2 : a < b) : a.fmod b = a |
| `Int.fmod_eq_tmod` | Int.fmod_eq_tmod {a b : Int} : a.fmod a.tmod |
| `Int.fmod_eq_tmod_of_nonneg` | Int.fmod_eq_tmod_of_nonneg {a b : Int} (ha : 0 ≤ a) (hb : 0 ≤ b) : a.fmod b = a.tmod b |
| `Int.fmod_eq_zero_of_dvd` | Int.fmod_eq_zero_of_dvd {a b : Int} : a ∣ b → b.fmod a = 0 |
| `Int.fmod_fmod` | Int.fmod_fmod (a b : Int) : (a.fmod b).fmod b = a.fmod b |
| `Int.fmod_fmod_of_dvd` | Int.fmod_fmod_of_dvd (n : Int) {m k : Int} (h : m ∣ k) : (n.fmod k).fmod m = n.fmod m |
| `Int.fmod_one` | Int.fmod_one (a : Int) : a.fmod 1 = 0 |
| `Int.fmod_self` | Int.fmod_self {a : Int} : a.fmod a = 0 |
| `Int.fmod_zero` | Int.fmod_zero (a : Int) : a.fmod 0 = a |
| `Int.getD_toArray_rcc` | Int.getD_toArray_rcc {m n fallback : Int} {i : Nat} : (m...=n).toArray.getD |
| `Int.getD_toArray_rcc_eq_add` | Int.getD_toArray_rcc_eq_add {m n fallback : Int} {i : Nat} (h : i < (n + 1 - m).toNat) : (m...=n).toArray.getD |
| `Int.getD_toArray_rcc_eq_fallback` | Int.getD_toArray_rcc_eq_fallback {m n fallback : Int} {i : Nat} (h : (n + 1 - m).toNat ≤ i) : (m...=n).toArray.getD |
| `Int.getD_toArray_rco` | Int.getD_toArray_rco {m n fallback : Int} {i : Nat} : (m...n).toArray.getD |
| `Int.getD_toArray_rco_eq_add` | Int.getD_toArray_rco_eq_add {m n fallback : Int} {i : Nat} (h : i < (n - m).toNat) : (m...n).toArray.getD |
| `Int.getD_toArray_rco_eq_fallback` | Int.getD_toArray_rco_eq_fallback {m n fallback : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m...n).toArray.getD |
| `Int.getD_toArray_roc` | Int.getD_toArray_roc {m n fallback : Int} {i : Nat} : (m<...=n).toArray.getD |
| `Int.getD_toArray_roc_eq_add` | Int.getD_toArray_roc_eq_add {m n fallback : Int} {i : Nat} (h : i < (n - m).toNat) : (m<...=n).toArray.getD |
| `Int.getD_toArray_roc_eq_fallback` | Int.getD_toArray_roc_eq_fallback {m n fallback : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m<...=n).toArray.getD |
| `Int.getD_toArray_roo` | Int.getD_toArray_roo {m n fallback : Int} {i : Nat} : (m<...n).toArray.getD |
| `Int.getD_toArray_roo_eq_add` | Int.getD_toArray_roo_eq_add {m n fallback : Int} {i : Nat} (h : i < (n - (m + 1)).toNat) : (m<...n).toArray.getD |
| `Int.getD_toArray_roo_eq_fallback` | Int.getD_toArray_roo_eq_fallback {m n fallback : Int} {i : Nat} (h : (n - (m + 1)).toNat ≤ i) : (m<...n).toArray.getD |
| `Int.getD_toList_rcc` | Int.getD_toList_rcc {m n fallback : Int} {i : Nat} : (m...=n).toList.getD |
| `Int.getD_toList_rcc_eq_add` | Int.getD_toList_rcc_eq_add {m n fallback : Int} {i : Nat} (h : i < (n + 1 - m).toNat) : (m...=n).toList.getD |
| `Int.getD_toList_rcc_eq_fallback` | Int.getD_toList_rcc_eq_fallback {m n fallback : Int} {i : Nat} (h : (n + 1 - m).toNat ≤ i) : (m...=n).toList.getD |
| `Int.getD_toList_rco` | Int.getD_toList_rco {m n fallback : Int} {i : Nat} : (m...n).toList.getD |
| `Int.getD_toList_rco_eq_add` | Int.getD_toList_rco_eq_add {m n fallback : Int} {i : Nat} (h : i < (n - m).toNat) : (m...n).toList.getD |
| `Int.getD_toList_rco_eq_fallback` | Int.getD_toList_rco_eq_fallback {m n fallback : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m...n).toList.getD |
| `Int.getD_toList_roc` | Int.getD_toList_roc {m n fallback : Int} {i : Nat} : (m<...=n).toList.getD |
| `Int.getD_toList_roc_eq_add` | Int.getD_toList_roc_eq_add {m n fallback : Int} {i : Nat} (h : i < (n - m).toNat) : (m<...=n).toList.getD |
| `Int.getD_toList_roc_eq_fallback` | Int.getD_toList_roc_eq_fallback {m n fallback : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m<...=n).toList.getD |
| `Int.getD_toList_roo` | Int.getD_toList_roo {m n fallback : Int} {i : Nat} : (m<...n).toList.getD |
| `Int.getD_toList_roo_eq_add` | Int.getD_toList_roo_eq_add {m n fallback : Int} {i : Nat} (h : i < (n - (m + 1)).toNat) : (m<...n).toList.getD |
| `Int.getD_toList_roo_eq_fallback` | Int.getD_toList_roo_eq_fallback {m n fallback : Int} {i : Nat} (h : (n - (m + 1)).toNat ≤ i) : (m<...n).toList.getD |
| `Int.getElem!_toArray_rcc` | Int.getElem!_toArray_rcc {m n : Int} {i : Nat} : (m...=n).toArray[i]! = if i < (n + 1 - m).toNat then m + ↑i else 0 |
| `Int.getElem!_toArray_rcc_eq_add` | Int.getElem!_toArray_rcc_eq_add {m n : Int} {i : Nat} (h : i < (n + 1 - m).toNat) : (m...=n).toArray[i]! = m + ↑i |
| `Int.getElem!_toArray_rcc_eq_zero` | Int.getElem!_toArray_rcc_eq_zero {m n : Int} {i : Nat} (h : (n + 1 - m).toNat ≤ i) : (m...=n).toArray[i]! = 0 |
| `Int.getElem!_toArray_rco` | Int.getElem!_toArray_rco {m n : Int} {i : Nat} : (m...n).toArray[i]! = if i < (n - m).toNat then m + ↑i else 0 |
| `Int.getElem!_toArray_rco_eq_add` | Int.getElem!_toArray_rco_eq_add {m n : Int} {i : Nat} (h : i < (n - m).toNat) : (m...n).toArray[i]! = m + ↑i |
| `Int.getElem!_toArray_rco_eq_zero` | Int.getElem!_toArray_rco_eq_zero {m n : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m...n).toArray[i]! = 0 |
| `Int.getElem!_toArray_roc` | Int.getElem!_toArray_roc {m n : Int} {i : Nat} : (m<...=n).toArray[i]! = if i < (n - m).toNat then m + 1 + ↑i else 0 |
| `Int.getElem!_toArray_roc_eq_add` | Int.getElem!_toArray_roc_eq_add {m n : Int} {i : Nat} (h : i < (n - m).toNat) : (m<...=n).toArray[i]! = m + 1 + ↑i |
| `Int.getElem!_toArray_roc_eq_zero` | Int.getElem!_toArray_roc_eq_zero {m n : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m<...=n).toArray[i]! = 0 |
| `Int.getElem!_toArray_roo` | Int.getElem!_toArray_roo {m n : Int} {i : Nat} : (m<...n).toArray[i]! |
| `Int.getElem!_toArray_roo_eq_add` | Int.getElem!_toArray_roo_eq_add {m n : Int} {i : Nat} (h : i < (n - (m + 1)).toNat) : (m<...n).toArray[i]! = m + 1 + ↑i |
| `Int.getElem!_toArray_roo_eq_zero` | Int.getElem!_toArray_roo_eq_zero {m n : Int} {i : Nat} (h : (n - (m + 1)).toNat ≤ i) : (m<...n).toArray[i]! = 0 |
| `Int.getElem!_toList_rcc` | Int.getElem!_toList_rcc {m n : Int} {i : Nat} : (m...=n).toList[i]! = if i < (n + 1 - m).toNat then m + ↑i else 0 |
| `Int.getElem!_toList_rcc_eq_add` | Int.getElem!_toList_rcc_eq_add {m n : Int} {i : Nat} (h : i < (n + 1 - m).toNat) : (m...=n).toList[i]! = m + ↑i |
| `Int.getElem!_toList_rcc_eq_zero` | Int.getElem!_toList_rcc_eq_zero {m n : Int} {i : Nat} (h : (n + 1 - m).toNat ≤ i) : (m...=n).toList[i]! = 0 |
| `Int.getElem!_toList_rco` | Int.getElem!_toList_rco {m n : Int} {i : Nat} : (m...n).toList[i]! = if i < (n - m).toNat then m + ↑i else 0 |
| `Int.getElem!_toList_rco_eq_add` | Int.getElem!_toList_rco_eq_add {m n : Int} {i : Nat} (h : i < (n - m).toNat) : (m...n).toList[i]! = m + ↑i |
| `Int.getElem!_toList_rco_eq_zero` | Int.getElem!_toList_rco_eq_zero {m n : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m...n).toList[i]! = 0 |
| `Int.getElem!_toList_roc` | Int.getElem!_toList_roc {m n : Int} {i : Nat} : (m<...=n).toList[i]! = if i < (n - m).toNat then m + 1 + ↑i else 0 |
| `Int.getElem!_toList_roc_eq_add` | Int.getElem!_toList_roc_eq_add {m n : Int} {i : Nat} (h : i < (n - m).toNat) : (m<...=n).toList[i]! = m + 1 + ↑i |
| `Int.getElem!_toList_roc_eq_zero` | Int.getElem!_toList_roc_eq_zero {m n : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m<...=n).toList[i]! = 0 |
| `Int.getElem!_toList_roo` | Int.getElem!_toList_roo {m n : Int} {i : Nat} : (m<...n).toList[i]! = if i < (n - (m + 1)).toNat then m + 1 + ↑i else 0 |
| `Int.getElem!_toList_roo_eq_add` | Int.getElem!_toList_roo_eq_add {m n : Int} {i : Nat} (h : i < (n - (m + 1)).toNat) : (m<...n).toList[i]! = m + 1 + ↑i |
| `Int.getElem!_toList_roo_eq_zero` | Int.getElem!_toList_roo_eq_zero {m n : Int} {i : Nat} (h : (n - (m + 1)).toNat ≤ i) : (m<...n).toList[i]! = 0 |
| `Int.getElem?_toArray_rcc` | Int.getElem?_toArray_rcc {m n : Int} {i : Nat} : (m...=n).toArray[i]? |
| `Int.getElem?_toArray_rcc_eq_none` | Int.getElem?_toArray_rcc_eq_none {m n : Int} {i : Nat} (h : (n + 1 - m).toNat ≤ i) : (m...=n).toArray[i]? = none |
| `Int.getElem?_toArray_rcc_eq_some` | Int.getElem?_toArray_rcc_eq_some {m n : Int} {i : Nat} (h : i < (n + 1 - m).toNat) : (m...=n).toArray[i]? |
| `Int.getElem?_toArray_rco` | Int.getElem?_toArray_rco {m n : Int} {i : Nat} : (m...n).toArray[i]? = if i < (n - m).toNat then some (m + ↑i) else none |
| `Int.getElem?_toArray_rco_eq_none` | Int.getElem?_toArray_rco_eq_none {m n : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m...n).toArray[i]? = none |
| `Int.getElem?_toArray_rco_eq_some` | Int.getElem?_toArray_rco_eq_some {m n : Int} {i : Nat} (h : i < (n - m).toNat) : (m...n).toArray[i]? = some (m + ↑i) |
| `Int.getElem?_toArray_roc` | Int.getElem?_toArray_roc {m n : Int} {i : Nat} : (m<...=n).toArray[i]? |
| `Int.getElem?_toArray_roc_eq_none` | Int.getElem?_toArray_roc_eq_none {m n : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m<...=n).toArray[i]? = none |
| `Int.getElem?_toArray_roc_eq_some` | Int.getElem?_toArray_roc_eq_some {m n : Int} {i : Nat} (h : i < (n - m).toNat) : (m<...=n).toArray[i]? |
| `Int.getElem?_toArray_roo` | Int.getElem?_toArray_roo {m n : Int} {i : Nat} : (m<...n).toArray[i]? |
| `Int.getElem?_toArray_roo_eq_none` | Int.getElem?_toArray_roo_eq_none {m n : Int} {i : Nat} (h : (n - (m + 1)).toNat ≤ i) : (m<...n).toArray[i]? = none |
| `Int.getElem?_toArray_roo_eq_some` | Int.getElem?_toArray_roo_eq_some {m n : Int} {i : Nat} (h : i < (n - (m + 1)).toNat) : (m<...n).toArray[i]? |
| `Int.getElem?_toList_rcc` | Int.getElem?_toList_rcc {m n : Int} {i : Nat} : (m...=n).toList[i]? |
| `Int.getElem?_toList_rcc_eq_none` | Int.getElem?_toList_rcc_eq_none {m n : Int} {i : Nat} (h : (n + 1 - m).toNat ≤ i) : (m...=n).toList[i]? = none |
| `Int.getElem?_toList_rcc_eq_some` | Int.getElem?_toList_rcc_eq_some {m n : Int} {i : Nat} (h : i < (n + 1 - m).toNat) : (m...=n).toList[i]? = some (m + ↑i) |
| `Int.getElem?_toList_rco` | Int.getElem?_toList_rco {m n : Int} {i : Nat} : (m...n).toList[i]? = if i < (n - m).toNat then some (m + ↑i) else none |
| `Int.getElem?_toList_rco_eq_none` | Int.getElem?_toList_rco_eq_none {m n : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m...n).toList[i]? = none |
| `Int.getElem?_toList_rco_eq_some` | Int.getElem?_toList_rco_eq_some {m n : Int} {i : Nat} (h : i < (n - m).toNat) : (m...n).toList[i]? = some (m + ↑i) |
| `Int.getElem?_toList_roc` | Int.getElem?_toList_roc {m n : Int} {i : Nat} : (m<...=n).toList[i]? |
| `Int.getElem?_toList_roc_eq_none` | Int.getElem?_toList_roc_eq_none {m n : Int} {i : Nat} (h : (n - m).toNat ≤ i) : (m<...=n).toList[i]? = none |
| `Int.getElem?_toList_roc_eq_some` | Int.getElem?_toList_roc_eq_some {m n : Int} {i : Nat} (h : i < (n - m).toNat) : (m<...=n).toList[i]? = some (m + 1 + ↑i) |
| `Int.getElem?_toList_roo` | Int.getElem?_toList_roo {m n : Int} {i : Nat} : (m<...n).toList[i]? |
| `Int.getElem?_toList_roo_eq_none` | Int.getElem?_toList_roo_eq_none {i : Nat} {m n : Int} (h : (n - (m + 1)).toNat ≤ i) : (m<...n).toList[i]? = none |
| `Int.getElem?_toList_roo_eq_some` | Int.getElem?_toList_roo_eq_some {m n : Int} {i : Nat} (h : i < (n - (m + 1)).toNat) : (m<...n).toList[i]? |
| `Int.getElem_toArray_rcc` | Int.getElem_toArray_rcc {m n : Int} {i : Nat} (_h : i < (m...=n).toArray.size) : (m...=n).toArray[i] = m + ↑i |
| `Int.getElem_toArray_rco` | Int.getElem_toArray_rco {m n : Int} {i : Nat} (_h : i < (m...n).toArray.size) : (m...n).toArray[i] = m + ↑i |
| `Int.getElem_toArray_roc` | Int.getElem_toArray_roc {m n : Int} {i : Nat} (_h : i < (m<...=n).toArray.size) : (m<...=n).toArray[i] = m + 1 + ↑i |
| `Int.getElem_toArray_roo` | Int.getElem_toArray_roo {m n : Int} {i : Nat} (_h : i < (m<...n).toArray.size) : (m<...n).toArray[i] = m + 1 + ↑i |
| `Int.getElem_toList_rcc` | Int.getElem_toList_rcc {m n : Int} {i : Nat} (_h : i < (m...=n).toList.length) : (m...=n).toList[i] = m + ↑i |
| `Int.getElem_toList_rco` | Int.getElem_toList_rco {m n : Int} {i : Nat} (_h : i < (m...n).toList.length) : (m...n).toList[i] = m + ↑i |
| `Int.getElem_toList_roc` | Int.getElem_toList_roc {m n : Int} {i : Nat} (_h : i < (m<...=n).toList.length) : (m<...=n).toList[i] = m + 1 + ↑i |
| `Int.getElem_toList_roo` | Int.getElem_toList_roo {m n : Int} {i : Nat} (_h : i < (m<...n).toList.length) : (m<...n).toList[i] = m + 1 + ↑i |
| `Int.isNone_getElem?_toArray_rcc_eq` | Int.isNone_getElem?_toArray_rcc_eq {m n : Int} {i : Nat} : ((m...=n).toArray[i]?.isNone |
| `Int.isNone_getElem?_toArray_rco_eq` | Int.isNone_getElem?_toArray_rco_eq {m n : Int} {i : Nat} : ((m...n).toArray[i]?.isNone = true) = ((n - m).toNat ≤ i) |
| `Int.isNone_getElem?_toArray_roc_eq` | Int.isNone_getElem?_toArray_roc_eq {m n : Int} {i : Nat} : ((m<...=n).toArray[i]?.isNone = true) = ((n - m).toNat ≤ i) |
| `Int.isNone_getElem?_toArray_roo_eq` | Int.isNone_getElem?_toArray_roo_eq {m n : Int} {i : Nat} : ((m<...n).toArray[i]?.isNone |
| `Int.isNone_getElem?_toList_rcc_eq` | Int.isNone_getElem?_toList_rcc_eq {m n : Int} {i : Nat} : ((m...=n).toList[i]?.isNone = true) = ((n + 1 - m).toNat ≤ i) |
| `Int.isNone_getElem?_toList_rco_eq` | Int.isNone_getElem?_toList_rco_eq {m n : Int} {i : Nat} : ((m...n).toList[i]?.isNone = true) = ((n - m).toNat ≤ i) |
| `Int.isNone_getElem?_toList_roc_eq` | Int.isNone_getElem?_toList_roc_eq {m n : Int} {i : Nat} : ((m<...=n).toList[i]?.isNone = true) = ((n - m).toNat ≤ i) |
| `Int.isNone_getElem?_toList_roo_eq` | Int.isNone_getElem?_toList_roo_eq {m n : Int} {i : Nat} : ((m<...n).toList[i]?.isNone |
| `Int.isSome_getElem?_toArray_rcc_eq` | Int.isSome_getElem?_toArray_rcc_eq {m n : Int} {i : Nat} : ((m...=n).toArray[i]?.isSome |
| `Int.isSome_getElem?_toArray_rco_eq` | Int.isSome_getElem?_toArray_rco_eq {m n : Int} {i : Nat} : ((m...n).toArray[i]?.isSome = true) = (i < (n - m).toNat) |
| `Int.isSome_getElem?_toArray_roc_eq` | Int.isSome_getElem?_toArray_roc_eq {m n : Int} {i : Nat} : ((m<...=n).toArray[i]?.isSome = true) = (i < (n - m).toNat) |
| `Int.isSome_getElem?_toArray_roo_eq` | Int.isSome_getElem?_toArray_roo_eq {m n : Int} {i : Nat} : ((m<...n).toArray[i]?.isSome |
| `Int.isSome_getElem?_toList_rcc_eq` | Int.isSome_getElem?_toList_rcc_eq {m n : Int} {i : Nat} : ((m...=n).toList[i]?.isSome = true) = (i < (n + 1 - m).toNat) |
| `Int.isSome_getElem?_toList_rco_eq` | Int.isSome_getElem?_toList_rco_eq {m n : Int} {i : Nat} : ((m...n).toList[i]?.isSome = true) = (i < (n - m).toNat) |
| `Int.isSome_getElem?_toList_roc_eq` | Int.isSome_getElem?_toList_roc_eq {m n : Int} {i : Nat} : ((m<...=n).toList[i]?.isSome = true) = (i < (n - m).toNat) |
| `Int.isSome_getElem?_toList_roo_eq` | Int.isSome_getElem?_toList_roo_eq {m n : Int} {i : Nat} : ((m<...n).toList[i]?.isSome |
| `Int.length_toList_rcc` | Int.length_toList_rcc {a b : Int} : (a...=b).toList.length = (b + 1 - a).toNat |
| `Int.length_toList_rco` | Int.length_toList_rco {a b : Int} : (a...b).toList.length = (b - a).toNat |
| `Int.length_toList_roc` | Int.length_toList_roc {a b : Int} : (a<...=b).toList.length = (b - a).toNat |
| `Int.length_toList_roo` | Int.length_toList_roo {a b : Int} : (a<...b).toList.length = (b - a - 1).toNat |
| `Int.map_add_toArray_rcc` | Int.map_add_toArray_rcc {m n k : Int} : Array.map (fun x => x + k) (m...=n).toArray = ((m + k)...=n + k).toArray |
| `Int.map_add_toArray_rcc'` | Int.map_add_toArray_rcc' {m n k : Int} : Array.map (fun x => k + x) (m...=n).toArray = ((k + m)...=k + n).toArray |
| `Int.map_add_toArray_rco` | Int.map_add_toArray_rco {m n k : Int} : Array.map (fun x => x + k) (m...n).toArray = ((m + k)...n + k).toArray |
| `Int.map_add_toArray_rco'` | Int.map_add_toArray_rco' {m n k : Int} : Array.map (fun x => k + x) (m...n).toArray = ((k + m)...k + n).toArray |
| `Int.map_add_toArray_roc` | Int.map_add_toArray_roc {m n k : Int} : Array.map (fun x => x + k) (m<...=n).toArray = ((m + k)<...=n + k).toArray |
| `Int.map_add_toArray_roc'` | Int.map_add_toArray_roc' {m n k : Int} : Array.map (fun x => k + x) (m<...=n).toArray = ((k + m)<...=k + n).toArray |
| `Int.map_add_toArray_roo` | Int.map_add_toArray_roo {m n k : Int} : Array.map (fun x => x + k) (m<...n).toArray = ((m + k)<...n + k).toArray |
| `Int.map_add_toArray_roo'` | Int.map_add_toArray_roo' {m n k : Int} : Array.map (fun x => k + x) (m<...n).toArray = ((k + m)<...k + n).toArray |
| `Int.map_add_toList_rcc` | Int.map_add_toList_rcc {m n k : Int} : List.map (fun x => x + k) (m...=n).toList = ((m + k)...=n + k).toList |
| `Int.map_add_toList_rcc'` | Int.map_add_toList_rcc' {m n k : Int} : List.map (fun x => k + x) (m...=n).toList = ((k + m)...=k + n).toList |
| `Int.map_add_toList_rco` | Int.map_add_toList_rco {m n k : Int} : List.map (fun x => x + k) (m...n).toList = ((m + k)...n + k).toList |
| `Int.map_add_toList_rco'` | Int.map_add_toList_rco' {m n k : Int} : List.map (fun x => k + x) (m...n).toList = ((k + m)...k + n).toList |
| `Int.map_add_toList_roc` | Int.map_add_toList_roc {m n k : Int} : List.map (fun x => x + k) (m<...=n).toList = ((m + k)<...=n + k).toList |
| `Int.map_add_toList_roc'` | Int.map_add_toList_roc' {m n k : Int} : List.map (fun x => k + x) (m<...=n).toList = ((k + m)<...=k + n).toList |
| `Int.map_add_toList_roo` | Int.map_add_toList_roo {m n k : Int} : List.map (fun x => x + k) (m<...n).toList = ((m + k)<...n + k).toList |
| `Int.map_add_toList_roo'` | Int.map_add_toList_roo' {m n k : Int} : List.map (fun x => k + x) (m<...n).toList = ((k + m)<...k + n).toList |
| `Int.negOfNat_add` | Int.negOfNat_add (m n : Nat) : Int.negOfNat m + Int.negOfNat n = Int.negOfNat (m + n) |
| `Int.negOfNat_eq` | Int.negOfNat_eq {n : Nat} : Int.negOfNat n = -Int.ofNat n |
| `Int.negOfNat_eq_subNatNat_zero` | Int.negOfNat_eq_subNatNat_zero (n : Nat) : Int.negOfNat n = Int.subNatNat 0 n |
| `Int.negOfNat_mul_negSucc` | Int.negOfNat_mul_negSucc (m n : Nat) : Int.negOfNat n * Int.negSucc m = Int.ofNat (n * m.succ) |
| `Int.negOfNat_mul_ofNat` | Int.negOfNat_mul_ofNat (m n : Nat) : Int.negOfNat m * ↑n = Int.negOfNat (m * n) |
| `Int.negSucc.inj` | Int.negSucc.inj {a✝ a✝¹ : Nat} : Int.negSucc a✝ = Int.negSucc a✝¹ → a✝ = a✝¹ |
| `Int.negSucc.injEq` | Int.negSucc.injEq (a✝ a✝¹ : Nat) : (Int.negSucc a✝ = Int.negSucc a✝¹) = (a✝ = a✝¹) |
| `Int.negSucc.sizeOf_spec` | Int.negSucc.sizeOf_spec (a✝ : Nat) : sizeOf (Int.negSucc a✝) = 1 + sizeOf a✝ |
| `Int.negSucc_add_negSucc` | Int.negSucc_add_negSucc (m n : Nat) : Int.negSucc m + Int.negSucc n = Int.negSucc (m + n).succ |
| `Int.negSucc_add_ofNat` | Int.negSucc_add_ofNat (m n : Nat) : Int.negSucc m + ↑n = Int.subNatNat n m.succ |
| `Int.negSucc_ediv` | Int.negSucc_ediv (m : Nat) {b : Int} (H : 0 < b) : Int.negSucc m / b = -((↑m).ediv b + 1) |
| `Int.negSucc_ediv_negSucc` | Int.negSucc_ediv_negSucc {a b : Nat} : Int.negSucc a / Int.negSucc b = ↑(a / (b + 1) + 1) |
| `Int.negSucc_ediv_ofNat_succ` | Int.negSucc_ediv_ofNat_succ {a b : Nat} : Int.negSucc a / ↑(b + 1) = Int.negSucc (a / b.succ) |
| `Int.negSucc_emod` | Int.negSucc_emod (m : Nat) {b : Int} (bpos : 0 < b) : Int.negSucc m % b = b - 1 - ↑m % b |
| `Int.negSucc_emod_negSucc` | Int.negSucc_emod_negSucc {a b : Nat} : Int.negSucc a % Int.negSucc b = Int.subNatNat (b + 1) (a % (b + 1)).succ |
| `Int.negSucc_emod_ofNat` | Int.negSucc_emod_ofNat {a b : Nat} : Int.negSucc a % ↑b = Int.subNatNat b (a % b).succ |
| `Int.negSucc_eq` | Int.negSucc_eq (n : Nat) : Int.negSucc n = -(↑n + 1) |
| `Int.negSucc_max_zero` | Int.negSucc_max_zero (n : Nat) : max (Int.negSucc n) 0 = 0 |
| `Int.negSucc_mul_negOfNat` | Int.negSucc_mul_negOfNat (m n : Nat) : Int.negSucc m * Int.negOfNat n = Int.ofNat (m.succ * n) |
| `Int.negSucc_mul_negSucc` | Int.negSucc_mul_negSucc (m n : Nat) : Int.negSucc m * Int.negSucc n = ↑m.succ * ↑n.succ |
| `Int.negSucc_mul_ofNat` | Int.negSucc_mul_ofNat (m n : Nat) : Int.negSucc m * ↑n = -↑(m.succ * n) |
| `Int.negSucc_mul_subNatNat` | Int.negSucc_mul_subNatNat (m n k : Nat) : Int.negSucc m * Int.subNatNat n k = Int.subNatNat (m.succ * k) (m.succ * n) |
| `Int.negSucc_pow` | Int.negSucc_pow (m n : Nat) : Int.negSucc |
| `Int.negSucc_shiftRight` | Int.negSucc_shiftRight (m n : Nat) : Int.negSucc m >>> n = Int.negSucc (m >>> n) |
| `Int.negSucc_sub_one` | Int.negSucc_sub_one (n : Nat) : Int.negSucc n - 1 = Int.negSucc (n + 1) |
| `Int.not_ge_eq` | Int.not_ge_eq (a b : Int) : (¬a ≥ b) = (a + 1 ≤ b) |
| `Int.not_gt_eq` | Int.not_gt_eq (a b : Int) : (¬a > b) = (a ≤ b) |
| `Int.not_le_eq` | Int.not_le_eq (a b : Int) : (¬a ≤ b) = (b + 1 ≤ a) |
| `Int.not_lt_eq` | Int.not_lt_eq (a b : Int) : (¬a < b) = (b ≤ a) |
| `Int.repr_eq_if` | Int.repr_eq_if {a : Int} : a.repr = if 0 ≤ a then a.toNat.repr else "-" ++ (-a).toNat.repr |
| `Int.shiftLeft.eq_1` | Int.shiftLeft.eq_1 (x✝ n : Nat) : (Int.ofNat n).shiftLeft x✝ = Int.ofNat (n <<< x✝) |
| `Int.shiftLeft.eq_2` | Int.shiftLeft.eq_2 (x✝ n : Nat) : (Int.negSucc n).shiftLeft x✝ = Int.negSucc ((n + 1) <<< x✝ - 1) |
| `Int.shiftLeft_add` | Int.shiftLeft_add (a : Int) (b c : Nat) : a <<< (b + c) = a <<< b <<< c |
| `Int.shiftLeft_eq` | Int.shiftLeft_eq (a : Int) (b : Nat) : a <<< b = a * 2 ^ b |
| `Int.shiftLeft_eq'` | Int.shiftLeft_eq' (a : Int) (b : Nat) : a <<< b = a * ↑(2 ^ b) |
| `Int.shiftLeft_mul` | Int.shiftLeft_mul (a b : Int) (n : Nat) : a <<< n * b = (a * b) <<< n |
| `Int.shiftLeft_mul_shiftLeft` | Int.shiftLeft_mul_shiftLeft (a b : Int) (m n : Nat) : a <<< m * b <<< n = (a * b) <<< (m + n) |
| `Int.shiftLeft_shiftRight_cancel` | Int.shiftLeft_shiftRight_cancel (a : Int) (b : Nat) : a <<< b >>> b = a |
| `Int.shiftLeft_shiftRight_eq` | Int.shiftLeft_shiftRight_eq (a : Int) (b c : Nat) : a <<< b >>> c = a <<< (b - c) >>> (c - b) |
| `Int.shiftLeft_shiftRight_eq_shiftLeft_of_le` | Int.shiftLeft_shiftRight_eq_shiftLeft_of_le {b c : Nat} (h : c ≤ b) (a : Int) : a <<< b >>> c = a <<< (b - c) |
| `Int.shiftLeft_shiftRight_eq_shiftRight_of_le` | Int.shiftLeft_shiftRight_eq_shiftRight_of_le {b c : Nat} (h : b ≤ c) (a : Int) : a <<< b >>> c = a >>> (c - b) |
| `Int.shiftLeft_succ` | Int.shiftLeft_succ (m : Int) (n : Nat) : m <<< (n + 1) = m <<< n * 2 |
| `Int.shiftLeft_succ'` | Int.shiftLeft_succ' (m : Int) (n : Nat) : m <<< (n + 1) = 2 * m <<< n |
| `Int.shiftLeft_zero` | Int.shiftLeft_zero (n : Int) : n <<< 0 = n |
| `Int.shiftRight.eq_1` | Int.shiftRight.eq_1 (x✝ n : Nat) : (Int.ofNat n).shiftRight x✝ = Int.ofNat (n >>> x✝) |
| `Int.shiftRight.eq_2` | Int.shiftRight.eq_2 (x✝ n : Nat) : (Int.negSucc n).shiftRight x✝ = Int.negSucc (n >>> x✝) |
| `Int.shiftRight_add` | Int.shiftRight_add (i : Int) (m n : Nat) : i >>> (m + n) = i >>> m >>> n |
| `Int.shiftRight_eq` | Int.shiftRight_eq (n : Int) (s : Nat) : n >>> s = n.shiftRight s |
| `Int.shiftRight_eq_div_pow` | Int.shiftRight_eq_div_pow (m : Int) (n : Nat) : m >>> n = m / ↑(2 ^ n) |
| `Int.shiftRight_shiftLeft_cancel` | Int.shiftRight_shiftLeft_cancel {a : Int} {b : Nat} (h : 2 ^ b ∣ a) : a >>> b <<< b = a |
| `Int.shiftRight_trailingZeros_mod_two` | Int.shiftRight_trailingZeros_mod_two {i : Int} (h : i ≠ 0) : i >>> i.trailingZeros % 2 = 1 |
| `Int.shiftRight_zero` | Int.shiftRight_zero (n : Int) : n >>> 0 = n |
| `Int.size_rcc` | Int.size_rcc {a b : Int} : (a...=b).size = (b + 1 - a).toNat |
| `Int.size_rco` | Int.size_rco {a b : Int} : (a...b).size = (b - a).toNat |
| `Int.size_roc` | Int.size_roc {a b : Int} : (a<...=b).size = (b - a).toNat |
| `Int.size_roo` | Int.size_roo {a b : Int} : (a<...b).size = (b - a - 1).toNat |
| `Int.size_toArray_rco` | Int.size_toArray_rco {a b : Int} : (a...b).toArray.size = (b - a).toNat |
| `Int.size_toArray_roc` | Int.size_toArray_roc {a b : Int} : (a<...=b).toArray.size = (b - a).toNat |
| `Int.size_toArray_roo` | Int.size_toArray_roo {a b : Int} : (a<...b).toArray.size = (b - a - 1).toNat |
| `Int.subNatNat.eq_1` | Int.subNatNat.eq_1 (m n : Nat) : Int.subNatNat match \| \| |
| `Int.subNatNat_add` | Int.subNatNat_add (m n k : Nat) : Int.subNatNat (m + n) k = ↑m + Int.subNatNat n k |
| `Int.subNatNat_add_add` | Int.subNatNat_add_add (m n k : Nat) : Int.subNatNat (m + k) (n + k) = Int.subNatNat m n |
| `Int.subNatNat_add_left` | Int.subNatNat_add_left {m n : Nat} : Int.subNatNat (m + n) m = ↑n |
| `Int.subNatNat_add_negSucc` | Int.subNatNat_add_negSucc (m n k : Nat) : Int.subNatNat m n + Int.negSucc k = Int.subNatNat m (n + k.succ) |
| `Int.subNatNat_add_right` | Int.subNatNat_add_right {m n : Nat} : Int.subNatNat m (m + n + 1) = Int.negSucc n |
| `Int.subNatNat_eq_coe` | Int.subNatNat_eq_coe {m n : Nat} : Int.subNatNat m n = ↑m - ↑n |
| `Int.subNatNat_of_le` | Int.subNatNat_of_le {m n : Nat} (h : n ≤ m) : Int.subNatNat m n = ↑(m - n) |
| `Int.subNatNat_of_lt` | Int.subNatNat_of_lt {m n : Nat} (h : m < n) : Int.subNatNat m n = Int.negSucc (n - m).pred |
| `Int.subNatNat_of_sub_eq_succ` | Int.subNatNat_of_sub_eq_succ {m n k : Nat} (h : n - m = k.succ) : Int.subNatNat m n = Int.negSucc k |
| `Int.subNatNat_of_sub_eq_zero` | Int.subNatNat_of_sub_eq_zero {m n : Nat} (h : n - m = 0) : Int.subNatNat m n = ↑(m - n) |
| `Int.subNatNat_self` | Int.subNatNat_self (n : Nat) : Int.subNatNat n n = 0 |
| `Int.subNatNat_sub` | Int.subNatNat_sub {n m : Nat} (h : n ≤ m) (k : Nat) : Int.subNatNat (m - n) k = Int.subNatNat m (k + n) |
| `Int.tdiv.eq_1` | Int.tdiv.eq_1 (m n : Nat) : (Int.ofNat m).tdiv (Int.ofNat n) = Int.ofNat (m / n) |
| `Int.tdiv.eq_2` | Int.tdiv.eq_2 (m n : Nat) : (Int.ofNat m).tdiv (Int.negSucc n) = -Int.ofNat (m / n.succ) |
| `Int.tdiv.eq_3` | Int.tdiv.eq_3 (m n : Nat) : (Int.negSucc m).tdiv (Int.ofNat n) = -Int.ofNat (m.succ / n) |
| `Int.tdiv.eq_4` | Int.tdiv.eq_4 (m n : Nat) : (Int.negSucc m).tdiv (Int.negSucc n) = Int.ofNat (m.succ / n.succ) |
| `Int.tdiv_cases` | Int.tdiv_cases (n m : Int) : n.tdiv |
| `Int.tdiv_eq_ediv` | Int.tdiv_eq_ediv {a b : Int} : a.tdiv b = a / b + if 0 ≤ a ∨ b ∣ a then 0 else b.sign |
| `Int.tdiv_eq_ediv_of_dvd` | Int.tdiv_eq_ediv_of_dvd {a b : Int} (h : b ∣ a) : a.tdiv b = a / b |
| `Int.tdiv_eq_ediv_of_nonneg` | Int.tdiv_eq_ediv_of_nonneg {a b : Int} : 0 ≤ a → a.tdiv b = a / b |
| `Int.tdiv_eq_fdiv` | Int.tdiv_eq_fdiv {a b : Int} : a.tdiv a.fdiv |
| `Int.tdiv_eq_of_eq_mul_left` | Int.tdiv_eq_of_eq_mul_left {a b c : Int} (H1 : b ≠ 0) (H2 : a = c * b) : a.tdiv b = c |
| `Int.tdiv_eq_of_eq_mul_right` | Int.tdiv_eq_of_eq_mul_right {a b c : Int} (H1 : b ≠ 0) (H2 : a = b * c) : a.tdiv b = c |
| `Int.tdiv_eq_tdiv_of_mul_eq_mul` | Int.tdiv_eq_tdiv_of_mul_eq_mul {a b c d : Int} (H2 : d ∣ c) (H3 : b ≠ 0) (H4 : d ≠ 0) (H5 : a * d = b * c) : a.tdiv |
| `Int.tdiv_eq_zero_of_lt` | Int.tdiv_eq_zero_of_lt {a b : Int} (H1 : 0 ≤ a) (H2 : a < b) : a.tdiv b = 0 |
| `Int.tdiv_mul_add_tmod` | Int.tdiv_mul_add_tmod (m k : Int) : m.tdiv k * k + m.tmod k = m |
| `Int.tdiv_mul_cancel` | Int.tdiv_mul_cancel {a b : Int} (H : b ∣ a) : a.tdiv b * b = a |
| `Int.tdiv_mul_cancel_of_dvd` | Int.tdiv_mul_cancel_of_dvd {a b : Int} (H : b ∣ a) : a.tdiv b * b = a |
| `Int.tdiv_mul_cancel_of_tmod_eq_zero` | Int.tdiv_mul_cancel_of_tmod_eq_zero {a b : Int} (H : a.tmod b = 0) : a.tdiv b * b = a |
| `Int.tdiv_mul_self` | Int.tdiv_mul_self (a b : Int) : a.tdiv b * b = a - a.tmod b |
| `Int.tdiv_neg` | Int.tdiv_neg (a b : Int) : a.tdiv (-b) = -a.tdiv b |
| `Int.tdiv_one` | Int.tdiv_one (a : Int) : a.tdiv 1 = a |
| `Int.tdiv_self` | Int.tdiv_self {a : Int} (H : a ≠ 0) : a.tdiv a = 1 |
| `Int.tdiv_sign` | Int.tdiv_sign (a b : Int) : a.tdiv b.sign = a * b.sign |
| `Int.tdiv_zero` | Int.tdiv_zero (a : Int) : a.tdiv 0 = 0 |
| `Int.tmod.eq_1` | Int.tmod.eq_1 (m n : Nat) : (Int.ofNat m).tmod (Int.ofNat n) = Int.ofNat (m % n) |
| `Int.tmod.eq_2` | Int.tmod.eq_2 (m n : Nat) : (Int.ofNat m).tmod (Int.negSucc n) = Int.ofNat (m % n.succ) |
| `Int.tmod.eq_3` | Int.tmod.eq_3 (m n : Nat) : (Int.negSucc m).tmod (Int.ofNat n) = -Int.ofNat (m.succ % n) |
| `Int.tmod.eq_4` | Int.tmod.eq_4 (m n : Nat) : (Int.negSucc m).tmod (Int.negSucc n) = -Int.ofNat (m.succ % n.succ) |
| `Int.tmod_add_mul_tdiv` | Int.tmod_add_mul_tdiv (a b : Int) : a.tmod b + b * a.tdiv b = a |
| `Int.tmod_add_tdiv_mul` | Int.tmod_add_tdiv_mul (m k : Int) : m.tmod k + m.tdiv k * k = m |
| `Int.tmod_def` | Int.tmod_def (a b : Int) : a.tmod b = a - b * a.tdiv b |
| `Int.tmod_eq_emod` | Int.tmod_eq_emod {a b : Int} : a.tmod b = a % b - ↑(if 0 ≤ a ∨ b ∣ a then 0 else b.natAbs) |
| `Int.tmod_eq_emod_of_nonneg` | Int.tmod_eq_emod_of_nonneg {a b : Int} (ha : 0 ≤ a) : a.tmod b = a % b |
| `Int.tmod_eq_fmod` | Int.tmod_eq_fmod {a b : Int} : a.tmod a.fmod |
| `Int.tmod_eq_of_lt` | Int.tmod_eq_of_lt {a b : Int} (H1 : 0 ≤ a) (H2 : a < b) : a.tmod b = a |
| `Int.tmod_eq_zero_of_dvd` | Int.tmod_eq_zero_of_dvd {a b : Int} : a ∣ b → b.tmod a = 0 |
| `Int.tmod_neg` | Int.tmod_neg (a b : Int) : a.tmod (-b) = a.tmod b |
| `Int.tmod_one` | Int.tmod_one (a : Int) : a.tmod 1 = 0 |
| `Int.tmod_self` | Int.tmod_self {a : Int} : a.tmod a = 0 |
| `Int.tmod_tmod` | Int.tmod_tmod (a b : Int) : (a.tmod b).tmod b = a.tmod b |
| `Int.tmod_tmod_of_dvd` | Int.tmod_tmod_of_dvd (n : Int) {m k : Int} (h : m ∣ k) : (n.tmod k).tmod m = n.tmod m |
| `Int.tmod_zero` | Int.tmod_zero (a : Int) : a.tmod 0 = a |
| `Int.toArray_rcc_add_right_eq_map` | Int.toArray_rcc_add_right_eq_map {m n : Int} : (m...=m + n).toArray = Array.map (fun x => x + m) (0...=n).toArray |
| `Int.toArray_rcc_eq_empty` | Int.toArray_rcc_eq_empty {m n : Int} (h : n < m) : (m...=n).toArray = #[] |
| `Int.toArray_rcc_eq_if` | Int.toArray_rcc_eq_if {m n : Int} : (m...=n).toArray = if m ≤ n then #[m] ++ ((m + 1)...=n).toArray else #[] |
| `Int.toArray_rcc_eq_push` | Int.toArray_rcc_eq_push {m n : Int} (h : m ≤ n) : (m...=n).toArray = (m...n).toArray.push n |
| `Int.toArray_rcc_eq_singleton` | Int.toArray_rcc_eq_singleton {m n : Int} (h : n = m) : (m...=n).toArray = #[m] |
| `Int.toArray_rcc_eq_singleton_append` | Int.toArray_rcc_eq_singleton_append {m n : Int} (h : m ≤ n) : (m...=n).toArray = #[m] ++ ((m + 1)...=n).toArray |
| `Int.toArray_rcc_eq_toArray_rco` | Int.toArray_rcc_eq_toArray_rco {m n : Int} : (m...=n).toArray = (m...n + 1).toArray |
| `Int.toArray_rcc_succ_right_eq_append_map` | Int.toArray_rcc_succ_right_eq_append_map {m n : Int} (h : m ≤ n + 1) : (m...=n |
| `Int.toArray_rcc_succ_right_eq_push` | Int.toArray_rcc_succ_right_eq_push {m n : Int} (h : m ≤ n + 1) : (m...=n + 1).toArray = (m...=n).toArray.push (n + 1) |
| `Int.toArray_rcc_succ_succ` | Int.toArray_rcc_succ_succ {m n : Int} : ((m + 1)...=n + 1).toArray = Array.map (fun x => x + 1) (m...=n).toArray |
| `Int.toArray_rco_add_add_eq_append` | Int.toArray_rco_add_add_eq_append {m : Int} {n k : Nat} : (m...m |
| `Int.toArray_rco_add_right_eq_map` | Int.toArray_rco_add_right_eq_map {m n : Int} : (m...m + n).toArray = Array.map (fun x => x + m) (0...n).toArray |
| `Int.toArray_rco_append_toArray_rco` | Int.toArray_rco_append_toArray_rco {l m n : Int} (h : l ≤ m) (h' : m ≤ n) : (l...m).toArray |
| `Int.toArray_rco_eq_empty` | Int.toArray_rco_eq_empty {m n : Int} (h : n ≤ m) : (m...n).toArray = #[] |
| `Int.toArray_rco_eq_if` | Int.toArray_rco_eq_if {m n : Int} : (m...n).toArray = if m < n then #[m] ++ ((m + 1)...n).toArray else #[] |
| `Int.toArray_rco_eq_if_push` | Int.toArray_rco_eq_if_push {m n : Int} : (m...n).toArray = if m < n then (m...n - 1).toArray.push (n - 1) else #[] |
| `Int.toArray_rco_eq_push` | Int.toArray_rco_eq_push {m n : Int} (h : m < n) : (m...n).toArray = (m...n - 1).toArray.push (n - 1) |
| `Int.toArray_rco_eq_singleton` | Int.toArray_rco_eq_singleton {m n : Int} (h : n = m + 1) : (m...n).toArray = #[m] |
| `Int.toArray_rco_eq_singleton_append` | Int.toArray_rco_eq_singleton_append {m n : Int} (h : m < n) : (m...n).toArray = #[m] ++ ((m + 1)...n).toArray |
| `Int.toArray_rco_succ_right_eq_append_map` | Int.toArray_rco_succ_right_eq_append_map {m n : Int} (h : m ≤ n) : (m...n |
| `Int.toArray_rco_succ_right_eq_push` | Int.toArray_rco_succ_right_eq_push {m n : Int} (h : m ≤ n) : (m...n + 1).toArray = (m...n).toArray.push n |
| `Int.toArray_rco_succ_succ` | Int.toArray_rco_succ_succ {m n : Int} : ((m + 1)...n + 1).toArray = Array.map (fun x => x + 1) (m...n).toArray |
| `Int.toArray_roc_add_right_eq_map` | Int.toArray_roc_add_right_eq_map {m n : Int} : (m<...=m + n).toArray = Array.map (fun x => x + m + 1) (0...n).toArray |
| `Int.toArray_roc_append_toArray_roc` | Int.toArray_roc_append_toArray_roc {l m n : Int} (h : l ≤ m) (h' : m ≤ n) : (l<...=m).toArray |
| `Int.toArray_roc_eq_if` | Int.toArray_roc_eq_if {m n : Int} : (m<...=n).toArray = if m + 1 ≤ n then #[m + 1] ++ ((m + 1)<...=n).toArray else #[] |
| `Int.toArray_roc_eq_nil` | Int.toArray_roc_eq_nil {m n : Int} (h : n ≤ m) : (m<...=n).toArray = #[] |
| `Int.toArray_roc_eq_push` | Int.toArray_roc_eq_push {m n : Int} (h : m < n) : (m<...=n).toArray = (m<...=n - 1).toArray.push n |
| `Int.toArray_roc_eq_singleton` | Int.toArray_roc_eq_singleton {m n : Int} (h : n = m + 1) : (m<...=n).toArray = #[m + 1] |
| `Int.toArray_roc_eq_singleton_append` | Int.toArray_roc_eq_singleton_append {m n : Int} (h : m < n) : (m<...=n).toArray = #[m + 1] ++ ((m + 1)<...=n).toArray |
| `Int.toArray_roc_eq_toArray_rcc` | Int.toArray_roc_eq_toArray_rcc {m n : Int} : (m<...=n).toArray = ((m + 1)...=n).toArray |
| `Int.toArray_roc_eq_toArray_rco` | Int.toArray_roc_eq_toArray_rco {m n : Int} : (m<...=n).toArray = ((m + 1)...n + 1).toArray |
| `Int.toArray_roc_eq_toArray_roo` | Int.toArray_roc_eq_toArray_roo {m n : Int} : (m<...=n).toArray = (m<...n + 1).toArray |
| `Int.toArray_roc_succ_right_eq_append_map` | Int.toArray_roc_succ_right_eq_append_map {m n : Int} (h : m ≤ n) : (m<...=n |
| `Int.toArray_roc_succ_right_eq_push` | Int.toArray_roc_succ_right_eq_push {m n : Int} (h : m ≤ n) : (m<...=n + 1).toArray = (m<...=n).toArray.push (n + 1) |
| `Int.toArray_roc_succ_succ` | Int.toArray_roc_succ_succ {m n : Int} : ((m + 1)<...=n + 1).toArray = Array.map (fun x => x + 1) (m<...=n).toArray |
| `Int.toArray_roo_add_right_eq_map` | Int.toArray_roo_add_right_eq_map {m n : Int} : (m<...m + 1 + n).toArray = Array.map (fun x => x + m + 1) (0...n).toArray |
| `Int.toArray_roo_eq_if` | Int.toArray_roo_eq_if {m n : Int} : (m<...n).toArray = if m + 1 < n then #[m + 1] ++ ((m + 1)<...n).toArray else #[] |
| `Int.toArray_roo_eq_nil` | Int.toArray_roo_eq_nil {m n : Int} (h : n ≤ m + 1) : (m<...n).toArray = #[] |
| `Int.toArray_roo_eq_push` | Int.toArray_roo_eq_push {m n : Int} (h : m + 1 < n) : (m<...n).toArray = (m<...n - 1).toArray.push (n - 1) |
| `Int.toArray_roo_eq_singleton` | Int.toArray_roo_eq_singleton {m n : Int} (h : n = m + 2) : (m<...n).toArray = #[m + 1] |
| `Int.toArray_roo_eq_singleton_append` | Int.toArray_roo_eq_singleton_append {m n : Int} (h : m + 1 < n) : (m<...n).toArray = #[m + 1] ++ ((m + 1)<...n).toArray |
| `Int.toArray_roo_eq_toArray_rco` | Int.toArray_roo_eq_toArray_rco {m n : Int} : (m<...n).toArray = ((m + 1)...n).toArray |
| `Int.toArray_roo_succ_right_eq_append_map` | Int.toArray_roo_succ_right_eq_append_map {m n : Int} (h : m < n) : (m<...n |
| `Int.toArray_roo_succ_right_eq_push` | Int.toArray_roo_succ_right_eq_push {m n : Int} (h : m < n) : (m<...n + 1).toArray = (m<...n).toArray.push n |
| `Int.toArray_roo_succ_succ` | Int.toArray_roo_succ_succ {m n : Int} : ((m + 1)<...n + 1).toArray = Array.map (fun x => x + 1) (m<...n).toArray |
| `Int.toArray_toList_rcc` | Int.toArray_toList_rcc {m n : Int} : (m...=n).toList.toArray = (m...=n).toArray |
| `Int.toArray_toList_rco` | Int.toArray_toList_rco {m n : Int} : (m...n).toList.toArray = (m...n).toArray |
| `Int.toArray_toList_roc` | Int.toArray_toList_roc {m n : Int} : (m<...=n).toList.toArray = (m<...=n).toArray |
| `Int.toArray_toList_roo` | Int.toArray_toList_roo {m n : Int} : (m<...n).toList.toArray = (m<...n).toArray |
| `Int.toList_rcc_add_right_eq_map` | Int.toList_rcc_add_right_eq_map {m n : Int} : (m...=m + n).toList = List.map (fun x => x + m) (0...=n).toList |
| `Int.toList_rcc_eq_append` | Int.toList_rcc_eq_append {m n : Int} (h : m ≤ n) : (m...=n).toList = (m...n).toList ++ [n] |
| `Int.toList_rcc_eq_cons` | Int.toList_rcc_eq_cons {m n : Int} (h : m ≤ n) : (m...=n).toList = m :: ((m + 1)...=n).toList |
| `Int.toList_rcc_eq_if` | Int.toList_rcc_eq_if {m n : Int} : (m...=n).toList = if m ≤ n then m :: ((m + 1)...=n).toList else [] |
| `Int.toList_rcc_eq_nil` | Int.toList_rcc_eq_nil {m n : Int} (h : n < m) : (m...=n).toList = [] |
| `Int.toList_rcc_eq_singleton` | Int.toList_rcc_eq_singleton {m n : Int} (h : n = m) : (m...=n).toList = [m] |
| `Int.toList_rcc_eq_toList_rco` | Int.toList_rcc_eq_toList_rco {m n : Int} : (m...=n).toList = (m...n + 1).toList |
| `Int.toList_rcc_succ_right_eq_append` | Int.toList_rcc_succ_right_eq_append {m n : Int} (h : m ≤ n + 1) : (m...=n + 1).toList = (m...=n).toList ++ [n + 1] |
| `Int.toList_rcc_succ_right_eq_cons_map` | Int.toList_rcc_succ_right_eq_cons_map {m n : Int} (h : m ≤ n + 1) : (m...=n |
| `Int.toList_rcc_succ_succ` | Int.toList_rcc_succ_succ {m n : Int} : ((m + 1)...=n + 1).toList = List.map (fun x => x + 1) (m...=n).toList |
| `Int.toList_rco_add_add_eq_append` | Int.toList_rco_add_add_eq_append {m : Int} {n k : Nat} : (m...m |
| `Int.toList_rco_add_right_eq_map` | Int.toList_rco_add_right_eq_map {m n : Int} : (m...m + n).toList = List.map (fun x => x + m) (0...n).toList |
| `Int.toList_rco_append_toList_rco` | Int.toList_rco_append_toList_rco {l m n : Int} (h : l ≤ m) (h' : m ≤ n) : (l...m).toList |
| `Int.toList_rco_eq_append` | Int.toList_rco_eq_append {m n : Int} (h : m < n) : (m...n).toList = (m...n - 1).toList ++ [n - 1] |
| `Int.toList_rco_eq_cons` | Int.toList_rco_eq_cons {m n : Int} (h : m < n) : (m...n).toList = m :: ((m + 1)...n).toList |
| `Int.toList_rco_eq_if` | Int.toList_rco_eq_if {m n : Int} : (m...n).toList = if m < n then m :: ((m + 1)...n).toList else [] |
| `Int.toList_rco_eq_if_append` | Int.toList_rco_eq_if_append {m n : Int} : (m...n).toList = if m < n then (m...n - 1).toList ++ [n - 1] else [] |
| `Int.toList_rco_eq_nil` | Int.toList_rco_eq_nil {m n : Int} (h : n ≤ m) : (m...n).toList = [] |
| `Int.toList_rco_eq_singleton` | Int.toList_rco_eq_singleton {m n : Int} (h : n = m + 1) : (m...n).toList = [m] |
| `Int.toList_rco_succ_right_eq_append` | Int.toList_rco_succ_right_eq_append {m n : Int} (h : m ≤ n) : (m...n + 1).toList = (m...n).toList ++ [n] |
| `Int.toList_rco_succ_right_eq_cons_map` | Int.toList_rco_succ_right_eq_cons_map {m n : Int} (h : m ≤ n) : (m...n |
| `Int.toList_rco_succ_succ` | Int.toList_rco_succ_succ {m n : Int} : ((m + 1)...n + 1).toList = List.map (fun x => x + 1) (m...n).toList |
| `Int.toList_roc_add_right_eq_map` | Int.toList_roc_add_right_eq_map {m n : Int} : (m<...=m + n).toList = List.map (fun x => x + m + 1) (0...n).toList |
| `Int.toList_roc_append_toList_roc` | Int.toList_roc_append_toList_roc {l m n : Int} (h : l ≤ m) (h' : m ≤ n) : (l<...=m).toList |
| `Int.toList_roc_eq_append` | Int.toList_roc_eq_append {m n : Int} (h : m < n) : (m<...=n).toList = (m<...=n - 1).toList ++ [n] |
| `Int.toList_roc_eq_cons` | Int.toList_roc_eq_cons {m n : Int} (h : m < n) : (m<...=n).toList = (m + 1) :: ((m + 1)<...=n).toList |
| `Int.toList_roc_eq_if` | Int.toList_roc_eq_if {m n : Int} : (m<...=n).toList = if m + 1 ≤ n then (m + 1) :: ((m + 1)<...=n).toList else [] |
| `Int.toList_roc_eq_nil` | Int.toList_roc_eq_nil {m n : Int} (h : n ≤ m) : (m<...=n).toList = [] |
| `Int.toList_roc_eq_singleton` | Int.toList_roc_eq_singleton {m n : Int} (h : n = m + 1) : (m<...=n).toList = [m + 1] |
| `Int.toList_roc_eq_toList_rcc` | Int.toList_roc_eq_toList_rcc {m n : Int} : (m<...=n).toList = ((m + 1)...=n).toList |
| `Int.toList_roc_eq_toList_rco` | Int.toList_roc_eq_toList_rco {m n : Int} : (m<...=n).toList = ((m + 1)...n + 1).toList |
| `Int.toList_roc_eq_toList_roo` | Int.toList_roc_eq_toList_roo {m n : Int} : (m<...=n).toList = (m<...n + 1).toList |
| `Int.toList_roc_succ_right_eq_append` | Int.toList_roc_succ_right_eq_append {m n : Int} (h : m ≤ n) : (m<...=n + 1).toList = (m<...=n).toList ++ [n + 1] |
| `Int.toList_roc_succ_right_eq_cons_map` | Int.toList_roc_succ_right_eq_cons_map {m n : Int} (h : m ≤ n) : (m<...=n |
| `Int.toList_roc_succ_succ` | Int.toList_roc_succ_succ {m n : Int} : ((m + 1)<...=n + 1).toList = List.map (fun x => x + 1) (m<...=n).toList |
| `Int.toList_roo_add_right_eq_map` | Int.toList_roo_add_right_eq_map {m n : Int} : (m<...m + 1 + n).toList = List.map (fun x => x + m + 1) (0...n).toList |
| `Int.toList_roo_eq_append` | Int.toList_roo_eq_append {m n : Int} (h : m + 1 < n) : (m<...n).toList = (m<...n - 1).toList ++ [n - 1] |
| `Int.toList_roo_eq_cons` | Int.toList_roo_eq_cons {m n : Int} (h : m + 1 < n) : (m<...n).toList = (m + 1) :: ((m + 1)<...n).toList |
| `Int.toList_roo_eq_if` | Int.toList_roo_eq_if {m n : Int} : (m<...n).toList = if m + 1 < n then (m + 1) :: ((m + 1)<...n).toList else [] |
| `Int.toList_roo_eq_nil` | Int.toList_roo_eq_nil {m n : Int} (h : n ≤ m + 1) : (m<...n).toList = [] |
| `Int.toList_roo_eq_singleton` | Int.toList_roo_eq_singleton {m n : Int} (h : n = m + 2) : (m<...n).toList = [m + 1] |
| `Int.toList_roo_eq_toList_rco` | Int.toList_roo_eq_toList_rco {m n : Int} : (m<...n).toList = ((m + 1)...n).toList |
| `Int.toList_roo_succ_right_eq_append` | Int.toList_roo_succ_right_eq_append {m n : Int} (h : m < n) : (m<...n + 1).toList = (m<...n).toList ++ [n] |
| `Int.toList_roo_succ_right_eq_cons_map` | Int.toList_roo_succ_right_eq_cons_map {m n : Int} (h : m < n) : (m<...n |
| `Int.toList_roo_succ_succ` | Int.toList_roo_succ_succ {m n : Int} : ((m + 1)<...n + 1).toList = List.map (fun x => x + 1) (m<...n).toList |
| `Int.toList_toArray_rcc` | Int.toList_toArray_rcc {m n : Int} : (m...=n).toArray.toList = (m...=n).toList |
| `Int.toList_toArray_rco` | Int.toList_toArray_rco {m n : Int} : (m...n).toArray.toList = (m...n).toList |
| `Int.toList_toArray_roc` | Int.toList_toArray_roc {m n : Int} : (m<...=n).toArray.toList = (m<...=n).toList |
| `Int.toList_toArray_roo` | Int.toList_toArray_roo {m n : Int} : (m<...n).toArray.toList = (m<...n).toList |
| `Int.toNat.eq_1` | Int.toNat.eq_1 (n : Nat) : (Int.ofNat n).toNat = n |
| `Int.toNat.eq_2` | Int.toNat.eq_2 (a : Nat) : (Int.negSucc a).toNat = 0 |
| `Int.toNat?.eq_1` | Int.toNat?.eq_1 (n : Nat) : (Int.ofNat n).toNat? = some n |
| `Int.toNat?.eq_2` | Int.toNat?.eq_2 (a : Nat) : (Int.negSucc a).toNat? = none |
| `Int.toNat_add` | Int.toNat_add {a b : Int} (ha : 0 ≤ a) (hb : 0 ≤ b) : (a + b).toNat = a.toNat + b.toNat |
| `Int.toNat_add_nat` | Int.toNat_add_nat {a : Int} (ha : 0 ≤ a) (n : Nat) : (a + ↑n).toNat = a.toNat + n |
| `Int.toNat_add_toNat_neg_eq_natAbs` | Int.toNat_add_toNat_neg_eq_natAbs (n : Int) : n.toNat + (-n).toNat = n.natAbs |
| `Int.toNat_emod` | Int.toNat_emod {x y : Int} (hx : 0 ≤ x) (hy : 0 ≤ y) : (x % y).toNat = x.toNat % y.toNat |
| `Int.toNat_eq_max` | Int.toNat_eq_max (a : Int) : ↑a.toNat = max a 0 |
| `Int.toNat_mul` | Int.toNat_mul {a b : Int} (ha : 0 ≤ a) (hb : 0 ≤ b) : (a * b).toNat = a.toNat * b.toNat |
| `Int.toNat_natCast` | Int.toNat_natCast (n : Nat) : (↑n).toNat = n |
| `Int.toNat_natCast_add_one` | Int.toNat_natCast_add_one {n : Nat} : (↑n + 1).toNat = n + 1 |
| `Int.toNat_negSucc` | Int.toNat_negSucc (n : Nat) : (Int.negSucc n).toNat = 0 |
| `Int.toNat_neg_nat` | Int.toNat_neg_nat (n : Nat) : (-↑n).toNat = 0 |
| `Int.toNat_neg_natCast` | Int.toNat_neg_natCast (n : Nat) : (-↑n).toNat = 0 |
| `Int.toNat_of_nonneg` | Int.toNat_of_nonneg {a : Int} (h : 0 ≤ a) : ↑a.toNat = a |
| `Int.toNat_of_nonpos` | Int.toNat_of_nonpos {z : Int} : z ≤ 0 → z.toNat = 0 |
| `Int.toNat_one` | Int.toNat_one : Int.toNat 1 = 1 |
| `Int.toNat_pow_of_nonneg` | Int.toNat_pow_of_nonneg {x : Int} (h : 0 ≤ x) (k : Nat) : (x ^ k).toNat = x.toNat ^ k |
| `Int.toNat_sub` | Int.toNat_sub (m n : Nat) : (↑m - ↑n).toNat = m - n |
| `Int.toNat_sub'` | Int.toNat_sub' (a : Int) (b : Nat) : (a - ↑b).toNat = a.toNat - b |
| `Int.toNat_sub''` | Int.toNat_sub'' {a b : Int} (ha : 0 ≤ a) (hb : 0 ≤ b) : (a - b).toNat = a.toNat - b.toNat |
| `Int.toNat_sub_max_self` | Int.toNat_sub_max_self (a : Int) : (a - max a 0).toNat = 0 |
| `Int.toNat_sub_of_le` | Int.toNat_sub_of_le {a b : Int} (h : b ≤ a) : ↑(a - b).toNat = a - b |
| `Int.toNat_sub_self_max` | Int.toNat_sub_self_max (a : Int) : (a - max 0 a).toNat = 0 |
| `Int.toNat_sub_toNat_neg` | Int.toNat_sub_toNat_neg (n : Int) : ↑n.toNat - ↑(-n).toNat = n |
| `Int.toNat_zero` | Int.toNat_zero : Int.toNat 0 = 0 |
| `Int.toString_eq_repr` | Int.toString_eq_repr {a : Int} : toString a = a.repr |
| `Int.trailingZeros.aux.congr_simp` | Int.trailingZeros.aux.congr_simp (k k✝ : Nat) (e_k : k = k✝) (i i✝ : Int) (e_i : i = i✝) (hi : i ≠ 0) (hk Int.trailingZeros.aux |
| `Int.trailingZeros.aux.eq_1` | Int.trailingZeros.aux.eq_1 (i : Int) (hi : i ≠ 0) (acc k_2 : Nat) (x_1 : k_2 + 1 ≠ 0) (hk_2 : i.natAbs ≤ k_2 + 1) : Int.trailingZeros.aux if |
| `Int.trailingZeros.aux.eq_def` | Int.trailingZeros.aux.eq_def (k : Nat) (i : Int) (hi : i ≠ 0) (hk : i.natAbs ≤ k) (acc : Nat) : Int.trailingZeros.aux match \| |
| `Int.trailingZeros.eq_1` | Int.trailingZeros.eq_1 (i : Int) : i.trailingZeros = if h : i = 0 then 0 else Int.trailingZeros.aux i.natAbs i h ⋯ 0 |
| `Int.trailingZeros_eq_zero_of_mod_eq` | Int.trailingZeros_eq_zero_of_mod_eq {i : Int} (h : i % 2 = 1) : i.trailingZeros = 0 |
| `Int.trailingZeros_neg` | Int.trailingZeros_neg (x : Int) : (-x).trailingZeros = x.trailingZeros |
| `Int.trailingZeros_shiftLeft` | Int.trailingZeros_shiftLeft {x : Int} (hx : x ≠ 0) (n : Nat) : (x <<< n).trailingZeros = x.trailingZeros + n |
| `Int.trailingZeros_two_mul` | Int.trailingZeros_two_mul {i : Int} (h : i ≠ 0) : (2 * i).trailingZeros = i.trailingZeros + 1 |
| `Int.trailingZeros_two_mul_add_one` | Int.trailingZeros_two_mul_add_one (i : Int) : (2 * i + 1).trailingZeros = 0 |
| `Int.trailingZeros_zero` | Int.trailingZeros_zero : Int.trailingZeros 0 = 0 |

## Int Addition / subtraction (105)

| Lemma | Statement |
|---|---|
| `Int.add_assoc` | Int.add_assoc (a b c : Int) : a + b + c = a + (b + c) |
| `Int.add_bmod` | Int.add_bmod (a b : Int) (n : Nat) : (a + b).bmod n = (a.bmod n + b.bmod n).bmod n |
| `Int.add_bmod_bmod` | Int.add_bmod_bmod {x y : Int} {n : Nat} : (x + y.bmod n).bmod n = (x + y).bmod n |
| `Int.add_bmod_eq_add_bmod_left` | Int.add_bmod_eq_add_bmod_left {x : Int} {n : Nat} {y : Int} (i : Int) (h : x.bmod n = y.bmod n) : (i |
| `Int.add_bmod_eq_add_bmod_right` | Int.add_bmod_eq_add_bmod_right {x : Int} {n : Nat} {y : Int} (i : Int) (H : x.bmod n = y.bmod n) : (x |
| `Int.add_bmod_left` | Int.add_bmod_left (a : Nat) (b : Int) : (↑a + b).bmod a = b.bmod a |
| `Int.add_bmod_right` | Int.add_bmod_right (a : Int) (b : Nat) : (a + ↑b).bmod b = a.bmod b |
| `Int.add_comm` | Int.add_comm (a b : Int) : a + b = b + a |
| `Int.add_def` | Int.add_def {a b : Int} : a.add b = a + b |
| `Int.add_ediv` | Int.add_ediv {a b c : Int} (h : c ≠ 0) : (a + b) / c = a / c + b / c + if ↑c.natAbs ≤ a % c + b % c then c.sign else 0 |
| `Int.add_ediv_of_dvd_left` | Int.add_ediv_of_dvd_left {a b c : Int} (H : c ∣ a) : (a + b) / c = a / c + b / c |
| `Int.add_ediv_of_dvd_right` | Int.add_ediv_of_dvd_right {a b c : Int} (H : c ∣ b) : (a + b) / c = a / c + b / c |
| `Int.add_ediv_of_pos` | Int.add_ediv_of_pos {a b c : Int} (h : 0 < c) : (a + b) / c = a / c + b / c + if c ≤ a % c + b % c then 1 else 0 |
| `Int.add_emod` | Int.add_emod (a b n : Int) : (a + b) % n = (a % n + b % n) % n |
| `Int.add_emod_bmod` | Int.add_emod_bmod {y : Int} (x : Int) (n : Nat) : (y + x % ↑n).bmod n = (y + x).bmod n |
| `Int.add_emod_emod` | Int.add_emod_emod (m n k : Int) : (m + n % k) % k = (m + n) % k |
| `Int.add_emod_eq_add_emod_left` | Int.add_emod_eq_add_emod_left {m n k : Int} (i : Int) (H : m % n = k % n) : (i + m) % n = (i + k) % n |
| `Int.add_emod_eq_add_emod_right` | Int.add_emod_eq_add_emod_right {m n k : Int} (i : Int) (H : m % n = k % n) : (m + i) % n = (k + i) % n |
| `Int.add_emod_left` | Int.add_emod_left (a b : Int) : (a + b) % a = b % a |
| `Int.add_emod_right` | Int.add_emod_right (a b : Int) : (a + b) % b = a % b |
| `Int.add_fdiv_of_dvd_left` | Int.add_fdiv_of_dvd_left {a b c : Int} (H : c ∣ a) : (a + b).fdiv c = a.fdiv c + b.fdiv c |
| `Int.add_fdiv_of_dvd_right` | Int.add_fdiv_of_dvd_right {a b c : Int} (H : c ∣ b) : (a + b).fdiv c = a.fdiv c + b.fdiv c |
| `Int.add_fmod` | Int.add_fmod (a b n : Int) : (a + b).fmod n = (a.fmod n + b.fmod n).fmod n |
| `Int.add_fmod_eq_add_fmod_left` | Int.add_fmod_eq_add_fmod_left {m n k : Int} (i : Int) (H : m.fmod n = k.fmod n) : (i + m).fmod n = (i + k).fmod n |
| `Int.add_fmod_eq_add_fmod_right` | Int.add_fmod_eq_add_fmod_right {m n k : Int} (i : Int) (H : m.fmod n = k.fmod n) : (m + i).fmod n = (k + i).fmod n |
| `Int.add_fmod_fmod` | Int.add_fmod_fmod (m n k : Int) : (m + n.fmod k).fmod k = (m + n).fmod k |
| `Int.add_fmod_left` | Int.add_fmod_left (a b : Int) : (a + b).fmod a = b.fmod a |
| `Int.add_fmod_right` | Int.add_fmod_right (a b : Int) : (a + b).fmod b = a.fmod b |
| `Int.add_left_cancel` | Int.add_left_cancel {a b c : Int} (h : a + b = a + c) : b = c |
| `Int.add_left_comm` | Int.add_left_comm (a b c : Int) : a + (b + c) = b + (a + c) |
| `Int.add_left_neg` | Int.add_left_neg (a : Int) : -a + a = 0 |
| `Int.add_mul` | Int.add_mul (a b c : Int) : (a + b) * c = a * c + b * c |
| `Int.add_mul_bmod_self_left` | Int.add_mul_bmod_self_left (a : Int) (b : Nat) (c : Int) : (a + ↑b * c).bmod b = a.bmod b |
| `Int.add_mul_bmod_self_right` | Int.add_mul_bmod_self_right (a b : Int) (c : Nat) : (a + b * ↑c).bmod c = a.bmod c |
| `Int.add_mul_ediv_left` | Int.add_mul_ediv_left (a : Int) {b : Int} (c : Int) (H : b ≠ 0) : (a + b * c) / b = a / b + c |
| `Int.add_mul_ediv_right` | Int.add_mul_ediv_right (a b : Int) {c : Int} (H : c ≠ 0) : (a + b * c) / c = a / c + b |
| `Int.add_mul_emod_self_left` | Int.add_mul_emod_self_left (a b c : Int) : (a + b * c) % b = a % b |
| `Int.add_mul_emod_self_right` | Int.add_mul_emod_self_right (a b c : Int) : (a + b * c) % c = a % c |
| `Int.add_mul_fdiv_left` | Int.add_mul_fdiv_left (a : Int) {b : Int} (c : Int) (H : b ≠ 0) : (a + b * c).fdiv b = a.fdiv b + c |
| `Int.add_mul_fdiv_right` | Int.add_mul_fdiv_right (a b : Int) {c : Int} (H : c ≠ 0) : (a + b * c).fdiv c = a.fdiv c + b |
| `Int.add_mul_fmod_self_left` | Int.add_mul_fmod_self_left (a b c : Int) : (a + b * c).fmod b = a.fmod b |
| `Int.add_mul_fmod_self_right` | Int.add_mul_fmod_self_right (a b c : Int) : (a + b * c).fmod c = a.fmod c |
| `Int.add_neg_bmod_self` | Int.add_neg_bmod_self (a : Int) (b : Nat) : (a + -↑b).bmod b = a.bmod b |
| `Int.add_neg_cancel_left` | Int.add_neg_cancel_left (a b : Int) : a + (-a + b) = b |
| `Int.add_neg_cancel_right` | Int.add_neg_cancel_right (a b : Int) : a + b + -b = a |
| `Int.add_neg_emod_self` | Int.add_neg_emod_self (a b : Int) : (a + -b) % b = a % b |
| `Int.add_neg_eq_sub` | Int.add_neg_eq_sub {a b : Int} : a + -b = a - b |
| `Int.add_neg_fmod_self` | Int.add_neg_fmod_self (a b : Int) : (a + -b).fmod b = a.fmod b |
| `Int.add_neg_mul_bmod_self_left` | Int.add_neg_mul_bmod_self_left (a : Int) (b : Nat) (c : Int) : (a + -(↑b * c)).bmod b = a.bmod b |
| `Int.add_neg_mul_bmod_self_right` | Int.add_neg_mul_bmod_self_right (a b : Int) (c : Nat) : (a + -(b * ↑c)).bmod c = a.bmod c |
| `Int.add_neg_mul_emod_self_left` | Int.add_neg_mul_emod_self_left (a b c : Int) : (a + -(b * c)) % b = a % b |
| `Int.add_neg_mul_emod_self_right` | Int.add_neg_mul_emod_self_right (a b c : Int) : (a + -(b * c)) % c = a % c |
| `Int.add_neg_mul_fmod_self_left` | Int.add_neg_mul_fmod_self_left (a b c : Int) : (a + -(b * c)).fmod b = a.fmod b |
| `Int.add_neg_mul_fmod_self_right` | Int.add_neg_mul_fmod_self_right (a b c : Int) : (a + -(b * c)).fmod c = a.fmod c |
| `Int.add_neg_one` | Int.add_neg_one (i : Int) : i + -1 = i - 1 |
| `Int.add_of_le.congr_simp` | Int.add_of_le.congr_simp {a b : Int} (h : a ≤ b) : Int.add_of_le h = Int.add_of_le h |
| `Int.add_one_tdiv` | Int.add_one_tdiv {a b : Int} : (a + 1).tdiv b = a.tdiv b + if 0 < a + 1 ∧ b ∣ a + 1 ∨ a < 0 ∧ b ∣ a then b.sign else 0 |
| `Int.add_one_tdiv_of_pos` | Int.add_one_tdiv_of_pos {a b : Int} (h : 0 < b) : (a |
| `Int.add_right_comm` | Int.add_right_comm (a b c : Int) : a + b + c = a + c + b |
| `Int.add_right_neg` | Int.add_right_neg (a : Int) : a + -a = 0 |
| `Int.add_shiftLeft` | Int.add_shiftLeft (a b : Int) (n : Nat) : (a + b) <<< n = a <<< n + b <<< n |
| `Int.add_sub_add_left` | Int.add_sub_add_left (k n m : Int) : k + n - (k + m) = n - m |
| `Int.add_sub_add_right` | Int.add_sub_add_right (n k m : Int) : n + k - (m + k) = n - m |
| `Int.add_sub_assoc` | Int.add_sub_assoc (a b c : Int) : a + b - c = a + (b - c) |
| `Int.add_sub_cancel` | Int.add_sub_cancel (a b : Int) : a + b - b = a |
| `Int.add_zero` | Int.add_zero (a : Int) : a + 0 = a |
| `Int.pred_toNat` | Int.pred_toNat (i : Int) : (i - 1).toNat = i.toNat - 1 |
| `Int.sub_add_cancel` | Int.sub_add_cancel (a b : Int) : a - b + b = a |
| `Int.sub_bmod` | Int.sub_bmod (a b : Int) (n : Nat) : (a - b).bmod n = (a.bmod n - b.bmod n).bmod n |
| `Int.sub_bmod_bmod` | Int.sub_bmod_bmod {x y : Int} {n : Nat} : (x - y.bmod n).bmod n = (x - y).bmod n |
| `Int.sub_bmod_left` | Int.sub_bmod_left (a : Nat) (b : Int) : (↑a - b).bmod a = (-b).bmod a |
| `Int.sub_bmod_right` | Int.sub_bmod_right (a : Int) (b : Nat) : (a - ↑b).bmod b = a.bmod b |
| `Int.sub_ediv_of_dvd` | Int.sub_ediv_of_dvd (a : Int) {b c : Int} (hcb : c ∣ b) : (a - b) / c = a / c - b / c |
| `Int.sub_ediv_of_dvd_sub` | Int.sub_ediv_of_dvd_sub {a b c : Int} (hcab : c ∣ a - b) : (a - b) / c = a / c - b / c |
| `Int.sub_emod` | Int.sub_emod (a b n : Int) : (a - b) % n = (a % n - b % n) % n |
| `Int.sub_emod_bmod` | Int.sub_emod_bmod {y : Int} (x : Int) (n : Nat) : (x - y % ↑n).bmod n = (x - y).bmod n |
| `Int.sub_emod_emod` | Int.sub_emod_emod (m n k : Int) : (m - n % k) % k = (m - n) % k |
| `Int.sub_emod_left` | Int.sub_emod_left (a b : Int) : (a - b) % a = -b % a |
| `Int.sub_emod_right` | Int.sub_emod_right (a b : Int) : (a - b) % b = a % b |
| `Int.sub_eq_add_neg` | Int.sub_eq_add_neg {a b : Int} : a - b = a + -b |
| `Int.sub_eq_zero_of_eq` | Int.sub_eq_zero_of_eq {a b : Int} (h : a = b) : a - b = 0 |
| `Int.sub_fdiv_of_dvd` | Int.sub_fdiv_of_dvd (a : Int) {b c : Int} (hcb : c ∣ b) : (a - b).fdiv c = a.fdiv c - b.fdiv c |
| `Int.sub_fmod` | Int.sub_fmod (a b n : Int) : (a - b).fmod n = (a.fmod n - b.fmod n).fmod n |
| `Int.sub_fmod_left` | Int.sub_fmod_left (a b : Int) : (a - b).fmod a = (-b).fmod a |
| `Int.sub_fmod_right` | Int.sub_fmod_right (a b : Int) : (a - b).fmod b = a.fmod b |
| `Int.sub_max_sub_left` | Int.sub_max_sub_left (a b c : Int) : max (a - b) (a - c) = a - min b c |
| `Int.sub_max_sub_right` | Int.sub_max_sub_right (a b c : Int) : max (a - c) (b - c) = max a b - c |
| `Int.sub_min_sub_left` | Int.sub_min_sub_left (a b c : Int) : min (a - b) (a - c) = a - max b c |
| `Int.sub_min_sub_right` | Int.sub_min_sub_right (a b c : Int) : min (a - c) (b - c) = min a b - c |
| `Int.sub_mul` | Int.sub_mul (a b c : Int) : (a - b) * c = a * c - b * c |
| `Int.sub_mul_bmod_self_left` | Int.sub_mul_bmod_self_left (a : Int) (b : Nat) (c : Int) : (a - ↑b * c).bmod b = a.bmod b |
| `Int.sub_mul_bmod_self_right` | Int.sub_mul_bmod_self_right (a b : Int) (c : Nat) : (a - b * ↑c).bmod c = a.bmod c |
| `Int.sub_mul_ediv_left` | Int.sub_mul_ediv_left (a : Int) {b : Int} (c : Int) (H : b ≠ 0) : (a - b * c) / b = a / b - c |
| `Int.sub_mul_ediv_right` | Int.sub_mul_ediv_right (a b : Int) {c : Int} (H : c ≠ 0) : (a - b * c) / c = a / c - b |
| `Int.sub_mul_emod_self_left` | Int.sub_mul_emod_self_left (a b c : Int) : (a - b * c) % b = a % b |
| `Int.sub_mul_emod_self_right` | Int.sub_mul_emod_self_right (a b c : Int) : (a - b * c) % c = a % c |
| `Int.sub_mul_fdiv_left` | Int.sub_mul_fdiv_left (a : Int) {b : Int} (c : Int) (H : b ≠ 0) : (a - b * c).fdiv b = a.fdiv b - c |
| `Int.sub_mul_fdiv_right` | Int.sub_mul_fdiv_right (a b : Int) {c : Int} (H : c ≠ 0) : (a - b * c).fdiv c = a.fdiv c - b |
| `Int.sub_mul_fmod_self_left` | Int.sub_mul_fmod_self_left (a b c : Int) : (a - b * c).fmod b = a.fmod b |
| `Int.sub_mul_fmod_self_right` | Int.sub_mul_fmod_self_right (a b c : Int) : (a - b * c).fmod c = a.fmod c |
| `Int.sub_neg` | Int.sub_neg (a b : Int) : a - -b = a + b |
| `Int.sub_self` | Int.sub_self (a : Int) : a - a = 0 |
| `Int.sub_sub` | Int.sub_sub (a b c : Int) : a - b - c = a - (b + c) |
| `Int.sub_sub_self` | Int.sub_sub_self (a b : Int) : a - (a - b) = b |
| `Int.sub_zero` | Int.sub_zero (a : Int) : a - 0 = a |

## Int Division / modulus / gcd (217)

| Lemma | Statement |
|---|---|
| `Int.bmod.eq_1` | Int.bmod.eq_1 (x : Int) (m : Nat) : x.bmod m = if x % ↑m < (↑m + 1) / 2 then x % ↑m else x % ↑m - ↑m |
| `Int.bmod_add_bdiv` | Int.bmod_add_bdiv (x : Int) (m : Nat) : x.bmod m + ↑m * x.bdiv m = x |
| `Int.bmod_add_bdiv'` | Int.bmod_add_bdiv' (x : Int) (m : Nat) : x.bmod m + x.bdiv m * ↑m = x |
| `Int.bmod_add_bmod` | Int.bmod_add_bmod {x : Int} {n : Nat} {y : Int} : (x.bmod n + y).bmod n = (x + y).bmod n |
| `Int.bmod_bmod` | Int.bmod_bmod {x : Int} {m : Nat} : (x.bmod m).bmod m = x.bmod m |
| `Int.bmod_bmod_of_dvd` | Int.bmod_bmod_of_dvd {a : Int} {n m : Nat} (hnm : n ∣ m) : (a.bmod m).bmod n = a.bmod n |
| `Int.bmod_def` | Int.bmod_def (x : Int) (m : Nat) : x.bmod m = if x % ↑m < (↑m + 1) / 2 then x % ↑m else x % ↑m - ↑m |
| `Int.bmod_emod` | Int.bmod_emod {x : Int} {m : Nat} : x.bmod m % ↑m = x % ↑m |
| `Int.bmod_eq_emod` | Int.bmod_eq_emod (x : Int) (m : Nat) : x.bmod m = x % ↑m - ↑(if x % ↑m ≥ (↑m + 1) / 2 then m else 0) |
| `Int.bmod_eq_emod_of_lt` | Int.bmod_eq_emod_of_lt {x : Int} {m : Nat} (hx : x % ↑m < (↑m + 1) / 2) : x.bmod m = x % ↑m |
| `Int.bmod_eq_neg` | Int.bmod_eq_neg {n : Nat} {m : Int} (hm : 0 ≤ m) (hn : ↑n = 2 * m) : m.bmod n = -m |
| `Int.bmod_eq_of_le` | Int.bmod_eq_of_le {n : Int} {m : Nat} (hn' : -(↑m / 2) ≤ n) (hn : n < (↑m + 1) / 2) : n.bmod m = n |
| `Int.bmod_eq_of_le_mul_two` | Int.bmod_eq_of_le_mul_two {x : Int} {y : Nat} (hle : -↑y ≤ x * 2) (hlt : x * 2 < ↑y) : x.bmod y = x |
| `Int.bmod_eq_self_sub_bdiv_mul` | Int.bmod_eq_self_sub_bdiv_mul (x : Int) (m : Nat) : x.bmod m = x - x.bdiv m * ↑m |
| `Int.bmod_eq_self_sub_mul_bdiv` | Int.bmod_eq_self_sub_mul_bdiv (x : Int) (m : Nat) : x.bmod m = x - ↑m * x.bdiv m |
| `Int.bmod_eq_zero_of_dvd` | Int.bmod_eq_zero_of_dvd {a : Nat} {b : Int} (h : ↑a ∣ b) : b.bmod a = 0 |
| `Int.bmod_mul_bmod` | Int.bmod_mul_bmod {x : Int} {n : Nat} {y : Int} : (x.bmod n * y).bmod n = (x * y).bmod n |
| `Int.bmod_natAbs_add_one` | Int.bmod_natAbs_add_one (x : Int) (w : x ≠ -1) : x.bmod (x.natAbs + 1) = -x.sign |
| `Int.bmod_neg` | Int.bmod_neg (x : Int) (m : Nat) (p : x % ↑m ≥ (↑m + 1) / 2) : x.bmod m = x % ↑m - ↑m |
| `Int.bmod_neg_bmod` | Int.bmod_neg_bmod {x : Int} {n : Nat} : (-x.bmod n).bmod n = (-x).bmod n |
| `Int.bmod_one` | Int.bmod_one (x : Int) : x.bmod 1 = 0 |
| `Int.bmod_pos` | Int.bmod_pos (x : Int) (m : Nat) (p : x % ↑m < (↑m + 1) / 2) : x.bmod m = x % ↑m |
| `Int.bmod_self` | Int.bmod_self {a : Nat} : (↑a).bmod a = 0 |
| `Int.bmod_self_add_one` | Int.bmod_self_add_one {x : Nat} : (↑x).bmod (x + 1) = if x = 0 then 0 else -1 |
| `Int.bmod_sub_bmod` | Int.bmod_sub_bmod {x : Int} {n : Nat} {y : Int} : (x.bmod n - y).bmod n = (x - y).bmod n |
| `Int.bmod_zero` | Int.bmod_zero {m : Int} : m.bmod 0 = m |
| `Int.div_def` | Int.div_def (a b : Int) : a / b = a.ediv b |
| `Int.dvd_antisymm` | Int.dvd_antisymm {a b : Int} (H1 : 0 ≤ a) (H2 : 0 ≤ b) : a ∣ b → b ∣ a → a = b |
| `Int.dvd_def` | Int.dvd_def (a b : Int) : (a ∣ b) = ∃ c, b = a * c |
| `Int.dvd_eq_false_of_mod_ne_zero` | Int.dvd_eq_false_of_mod_ne_zero {a b : Int} (h : (b % a != 0) = true) : (a ∣ b) = False |
| `Int.dvd_eq_true_of_mod_eq_zero` | Int.dvd_eq_true_of_mod_eq_zero {a b : Int} (h : (b % a == 0) = true) : (a ∣ b) = True |
| `Int.ediv.eq_1` | Int.ediv.eq_1 (m n : Nat) : (Int.ofNat m).ediv (Int.ofNat n) = Int.ofNat (m / n) |
| `Int.ediv.eq_2` | Int.ediv.eq_2 (m n : Nat) : (Int.ofNat m).ediv (Int.negSucc n) = -Int.ofNat (m / n.succ) |
| `Int.ediv.eq_3` | Int.ediv.eq_3 (a : Nat) : (Int.negSucc a).ediv 0 = 0 |
| `Int.ediv.eq_4` | Int.ediv.eq_4 (m n : Nat) : (Int.negSucc m).ediv (Int.ofNat n.succ) = Int.negSucc (m / n.succ) |
| `Int.ediv.eq_5` | Int.ediv.eq_5 (m n : Nat) : (Int.negSucc m).ediv (Int.negSucc n) = Int.ofNat (m / n.succ).succ |
| `Int.ediv_ediv` | Int.ediv_ediv {x y z : Int} : x / y / z = x / (y * z) - if y < 0 ∧ ¬z ∣ x / y then z.sign else 0 |
| `Int.ediv_ediv_of_nonneg` | Int.ediv_ediv_of_nonneg {x y z : Int} (hy : 0 ≤ y) : x / y / z = x / (y * z) |
| `Int.ediv_eq_ediv_of_mul_eq_mul` | Int.ediv_eq_ediv_of_mul_eq_mul {a b c d : Int} (H2 : d ∣ c) (H3 : b ≠ 0) (H4 : d ≠ 0) (H5 : a * d = b * c) : a |
| `Int.ediv_eq_fdiv` | Int.ediv_eq_fdiv {a b : Int} : a / b = a.fdiv b + if 0 ≤ b ∨ b ∣ a then 0 else 1 |
| `Int.ediv_eq_neg_one_of_neg_of_le` | Int.ediv_eq_neg_one_of_neg_of_le {a b : Int} (H1 : a < 0) (H2 : -a ≤ b) : a / b = -1 |
| `Int.ediv_eq_of_eq_mul_left` | Int.ediv_eq_of_eq_mul_left {a b c : Int} (H1 : b ≠ 0) (H2 : a = c * b) : a / b = c |
| `Int.ediv_eq_of_eq_mul_right` | Int.ediv_eq_of_eq_mul_right {a b c : Int} (H1 : b ≠ 0) (H2 : a = b * c) : a / b = c |
| `Int.ediv_eq_one_of_neg_of_le` | Int.ediv_eq_one_of_neg_of_le {a b : Int} (H1 : a < 0) (H2 : b ≤ a) : a / b = 1 |
| `Int.ediv_eq_tdiv` | Int.ediv_eq_tdiv {a b : Int} : a / b = a.tdiv b - if 0 ≤ a ∨ b ∣ a then 0 else b.sign |
| `Int.ediv_eq_zero_of_lt` | Int.ediv_eq_zero_of_lt {a b : Int} (H1 : 0 ≤ a) (H2 : a < b) : a / b = 0 |
| `Int.ediv_minus_one` | Int.ediv_minus_one (a : Int) : a / -1 = -a |
| `Int.ediv_mul` | Int.ediv_mul {x y z : Int} : x / (y * z) = x / y / z + if y < 0 ∧ ¬z ∣ x / y then z.sign else 0 |
| `Int.ediv_mul_add_emod` | Int.ediv_mul_add_emod (a b : Int) : a / b * b + a % b = a |
| `Int.ediv_mul_cancel` | Int.ediv_mul_cancel {a b : Int} (H : b ∣ a) : a / b * b = a |
| `Int.ediv_mul_cancel_of_dvd` | Int.ediv_mul_cancel_of_dvd {a b : Int} (H : b ∣ a) : a / b * b = a |
| `Int.ediv_mul_cancel_of_emod_eq_zero` | Int.ediv_mul_cancel_of_emod_eq_zero {a b : Int} (H : a % b = 0) : a / b * b = a |
| `Int.ediv_mul_of_nonneg` | Int.ediv_mul_of_nonneg {x y z : Int} (hy : 0 ≤ y) : x / (y * z) = x / y / z |
| `Int.ediv_mul_self` | Int.ediv_mul_self (a b : Int) : a / b * b = a - a % b |
| `Int.ediv_neg` | Int.ediv_neg (a b : Int) : a / -b = -(a / b) |
| `Int.ediv_one` | Int.ediv_one (a : Int) : a / 1 = a |
| `Int.ediv_self` | Int.ediv_self {a : Int} (H : a ≠ 0) : a / a = 1 |
| `Int.ediv_sign` | Int.ediv_sign (a b : Int) : a / b.sign = a * b.sign |
| `Int.ediv_zero` | Int.ediv_zero (a : Int) : a / 0 = 0 |
| `Int.emod.eq_1` | Int.emod.eq_1 (x✝ : Int) (m : Nat) : (Int.ofNat m).emod x✝ = Int.ofNat (m % x✝.natAbs) |
| `Int.emod.eq_2` | Int.emod.eq_2 (x✝ : Int) (m : Nat) : (Int.negSucc m).emod x✝ = Int.subNatNat x✝.natAbs (m % x✝.natAbs).succ |
| `Int.emod_add_bmod` | Int.emod_add_bmod {y : Int} (x : Int) (n : Nat) : (x % ↑n + y).bmod n = (x + y).bmod n |
| `Int.emod_add_ediv_mul` | Int.emod_add_ediv_mul (a b : Int) : a % b + a / b * b = a |
| `Int.emod_add_emod` | Int.emod_add_emod (m n k : Int) : (m % n + k) % n = (m + k) % n |
| `Int.emod_add_mul_ediv` | Int.emod_add_mul_ediv (a b : Int) : a % b + b * (a / b) = a |
| `Int.emod_bmod` | Int.emod_bmod (x : Int) (n : Nat) : (x % ↑n).bmod n = x.bmod n |
| `Int.emod_def` | Int.emod_def (a b : Int) : a % b = a - b * (a / b) |
| `Int.emod_emod` | Int.emod_emod (a b : Int) : a % b % b = a % b |
| `Int.emod_emod_of_dvd` | Int.emod_emod_of_dvd (n : Int) {m k : Int} (h : m ∣ k) : n % k % m = n % m |
| `Int.emod_eq_add_self_emod` | Int.emod_eq_add_self_emod {a b : Int} : a % b = (a + b) % b |
| `Int.emod_eq_fmod` | Int.emod_eq_fmod {a b : Int} : a % b = a.fmod b - if 0 ≤ b ∨ b ∣ a then 0 else b |
| `Int.emod_eq_of_lt` | Int.emod_eq_of_lt {a b : Int} (H1 : 0 ≤ a) (H2 : a < b) : a % b = a |
| `Int.emod_eq_tmod` | Int.emod_eq_tmod {a b : Int} : a % b = a.tmod b + ↑(if 0 ≤ a ∨ b ∣ a then 0 else b.natAbs) |
| `Int.emod_eq_zero_of_dvd` | Int.emod_eq_zero_of_dvd {a b : Int} : a ∣ b → b % a = 0 |
| `Int.emod_minus_one` | Int.emod_minus_one (a : Int) : a % -1 = 0 |
| `Int.emod_mul_bmod` | Int.emod_mul_bmod {y : Int} (x : Int) (n : Nat) : (x % ↑n * y).bmod n = (x * y).bmod n |
| `Int.emod_natAbs_of_neg` | Int.emod_natAbs_of_neg {x : Int} (h : x < 0) {n : Nat} (w : n ≠ 0) : x.natAbs |
| `Int.emod_natAbs_of_nonneg` | Int.emod_natAbs_of_nonneg {x : Int} (h : 0 ≤ x) {n : Nat} : x.natAbs % n = (x % ↑n).toNat |
| `Int.emod_neg` | Int.emod_neg (a b : Int) : a % -b = a % b |
| `Int.emod_negSucc` | Int.emod_negSucc (m : Nat) (n : Int) : Int.negSucc m % n = Int.subNatNat n.natAbs (m % n.natAbs).succ |
| `Int.emod_one` | Int.emod_one (a : Int) : a % 1 = 0 |
| `Int.emod_self` | Int.emod_self {a : Int} : a % a = 0 |
| `Int.emod_self_add_one` | Int.emod_self_add_one {x : Int} (h : 0 ≤ x) : x % (x + 1) = x |
| `Int.emod_sub_bmod` | Int.emod_sub_bmod {y : Int} (x : Int) (n : Nat) : (x % ↑n - y).bmod n = (x - y).bmod n |
| `Int.emod_sub_emod` | Int.emod_sub_emod (m n k : Int) : (m % n - k) % n = (m - k) % n |
| `Int.emod_zero` | Int.emod_zero (a : Int) : a % 0 = a |
| `Int.fdiv.eq_1` | Int.fdiv.eq_1 (x✝ : Int) : Int.fdiv 0 x✝ = 0 |
| `Int.fdiv.eq_2` | Int.fdiv.eq_2 (m n : Nat) (x_2 : m = 0 → False) : (Int.ofNat m).fdiv (Int.ofNat n) = Int.ofNat (m / n) |
| `Int.fdiv.eq_3` | Int.fdiv.eq_3 (m n : Nat) : (Int.ofNat m.succ).fdiv (Int.negSucc n) = Int.negSucc (m / n.succ) |
| `Int.fdiv.eq_4` | Int.fdiv.eq_4 (a : Nat) : (Int.negSucc a).fdiv 0 = 0 |
| `Int.fdiv.eq_5` | Int.fdiv.eq_5 (m n : Nat) : (Int.negSucc m).fdiv (Int.ofNat n.succ) = Int.negSucc (m / n.succ) |
| `Int.fdiv.eq_6` | Int.fdiv.eq_6 (m n : Nat) : (Int.negSucc m).fdiv (Int.negSucc n) = Int.ofNat (m.succ / n.succ) |
| `Int.fdiv_eq_ediv` | Int.fdiv_eq_ediv {a b : Int} : a.fdiv b = a / b - if 0 ≤ b ∨ b ∣ a then 0 else 1 |
| `Int.fdiv_eq_ediv_of_dvd` | Int.fdiv_eq_ediv_of_dvd {a b : Int} (h : b ∣ a) : a.fdiv b = a / b |
| `Int.fdiv_eq_ediv_of_nonneg` | Int.fdiv_eq_ediv_of_nonneg (a : Int) {b : Int} : 0 ≤ b → a.fdiv b = a / b |
| `Int.fdiv_eq_of_eq_mul_left` | Int.fdiv_eq_of_eq_mul_left {a b c : Int} (H1 : b ≠ 0) (H2 : a = c * b) : a.fdiv b = c |
| `Int.fdiv_eq_of_eq_mul_right` | Int.fdiv_eq_of_eq_mul_right {a b c : Int} (H1 : b ≠ 0) (H2 : a = b * c) : a.fdiv b = c |
| `Int.fdiv_eq_tdiv` | Int.fdiv_eq_tdiv {a b : Int} : a.fdiv a.tdiv |
| `Int.fdiv_eq_tdiv_of_nonneg` | Int.fdiv_eq_tdiv_of_nonneg {a b : Int} (Ha : 0 ≤ a) (Hb : 0 ≤ b) : a.fdiv b = a.tdiv b |
| `Int.fdiv_eq_zero_of_lt` | Int.fdiv_eq_zero_of_lt {a b : Int} (H1 : 0 ≤ a) (H2 : a < b) : a.fdiv b = 0 |
| `Int.fdiv_mul_add_fmod` | Int.fdiv_mul_add_fmod (a b : Int) : a.fdiv b * b + a.fmod b = a |
| `Int.fdiv_mul_cancel` | Int.fdiv_mul_cancel {a b : Int} (H : b ∣ a) : a.fdiv b * b = a |
| `Int.fdiv_mul_cancel_of_dvd` | Int.fdiv_mul_cancel_of_dvd {a b : Int} (H : b ∣ a) : a.fdiv b * b = a |
| `Int.fdiv_mul_cancel_of_fmod_eq_zero` | Int.fdiv_mul_cancel_of_fmod_eq_zero {a b : Int} (H : a.fmod b = 0) : a.fdiv b * b = a |
| `Int.fdiv_mul_self` | Int.fdiv_mul_self (a b : Int) : a.fdiv b * b = a - a.fmod b |
| `Int.fdiv_neg` | Int.fdiv_neg {a b : Int} (h : b ≠ 0) : a.fdiv (-b) = if b ∣ a then -a.fdiv b else -a.fdiv b - 1 |
| `Int.fdiv_one` | Int.fdiv_one (a : Int) : a.fdiv 1 = a |
| `Int.fdiv_self` | Int.fdiv_self {a : Int} (H : a ≠ 0) : a.fdiv a = 1 |
| `Int.fdiv_sign` | Int.fdiv_sign {a b : Int} : a.fdiv b.sign = a * b.sign |
| `Int.fdiv_zero` | Int.fdiv_zero (a : Int) : a.fdiv 0 = 0 |
| `Int.gcd.eq_1` | Int.gcd.eq_1 (m n : Int) : m.gcd n = m.natAbs.gcd n.natAbs |
| `Int.gcd_add_left_left_of_dvd` | Int.gcd_add_left_left_of_dvd {m k : Int} (n : Int) : m ∣ k → (k + n).gcd m = n.gcd m |
| `Int.gcd_add_left_right_of_dvd` | Int.gcd_add_left_right_of_dvd {n k : Int} (m : Int) : n ∣ k → n.gcd (k + m) = n.gcd m |
| `Int.gcd_add_mul_left_left` | Int.gcd_add_mul_left_left (m n k : Int) : (n + m * k).gcd m = n.gcd m |
| `Int.gcd_add_mul_left_right` | Int.gcd_add_mul_left_right (m n k : Int) : m.gcd (n + m * k) = m.gcd n |
| `Int.gcd_add_mul_right_left` | Int.gcd_add_mul_right_left (m n k : Int) : (n + k * m).gcd m = n.gcd m |
| `Int.gcd_add_mul_right_right` | Int.gcd_add_mul_right_right (m n k : Int) : m.gcd (n + k * m) = m.gcd n |
| `Int.gcd_add_right_left_of_dvd` | Int.gcd_add_right_left_of_dvd {m k : Int} (n : Int) : m ∣ k → (n + k).gcd m = n.gcd m |
| `Int.gcd_add_right_right_of_dvd` | Int.gcd_add_right_right_of_dvd {n k : Int} (m : Int) : n ∣ k → n.gcd (m + k) = n.gcd m |
| `Int.gcd_add_self_left` | Int.gcd_add_self_left (m n : Int) : (n + m).gcd m = n.gcd m |
| `Int.gcd_add_self_right` | Int.gcd_add_self_right (m n : Int) : m.gcd (n + m) = m.gcd n |
| `Int.gcd_assoc` | Int.gcd_assoc (a b c : Int) : (↑(a.gcd b)).gcd c = a.gcd ↑(b.gcd c) |
| `Int.gcd_comm` | Int.gcd_comm (a b : Int) : a.gcd b = b.gcd a |
| `Int.gcd_ediv` | Int.gcd_ediv {a b c : Int} (ha : c ∣ a) (hb : c ∣ b) : (a / c).gcd (b / c) = a.gcd b / c.natAbs |
| `Int.gcd_ediv_gcd_ediv_gcd` | Int.gcd_ediv_gcd_ediv_gcd {i j : Int} (h : 0 < i.gcd j) : (i / ↑(i.gcd j)).gcd (j / ↑(i.gcd j)) = 1 |
| `Int.gcd_ediv_gcd_ediv_gcd_of_ne_zero_left` | Int.gcd_ediv_gcd_ediv_gcd_of_ne_zero_left {n m : Int} (h : n ≠ 0) : (n / ↑(n.gcd m)).gcd (m / ↑(n.gcd m)) = 1 |
| `Int.gcd_ediv_gcd_ediv_gcd_of_ne_zero_right` | Int.gcd_ediv_gcd_ediv_gcd_of_ne_zero_right {n m : Int} (h : m ≠ 0) : (n / ↑(n.gcd m)).gcd (m / ↑(n.gcd m)) = 1 |
| `Int.gcd_eq_left` | Int.gcd_eq_left {a b : Int} (ha : 0 ≤ a) (h : a ∣ b) : ↑(a.gcd b) = a |
| `Int.gcd_eq_natAbs_gcd_natAbs` | Int.gcd_eq_natAbs_gcd_natAbs (m n : Int) : m.gcd n = m.natAbs.gcd n.natAbs |
| `Int.gcd_eq_natAbs_left` | Int.gcd_eq_natAbs_left {a b : Int} (h : a ∣ b) : a.gcd b = a.natAbs |
| `Int.gcd_eq_natAbs_right` | Int.gcd_eq_natAbs_right {b a : Int} (h : b ∣ a) : a.gcd b = b.natAbs |
| `Int.gcd_eq_right` | Int.gcd_eq_right {b a : Int} (hb : 0 ≤ b) (h : b ∣ a) : ↑(a.gcd b) = b |
| `Int.gcd_gcd_self_left_left` | Int.gcd_gcd_self_left_left (m n : Int) : (↑(m.gcd n)).gcd m = m.gcd n |
| `Int.gcd_gcd_self_left_right` | Int.gcd_gcd_self_left_right (m n : Int) : (↑(n.gcd m)).gcd m = n.gcd m |
| `Int.gcd_gcd_self_right_left` | Int.gcd_gcd_self_right_left (m n : Int) : m.gcd ↑(m.gcd n) = m.gcd n |
| `Int.gcd_gcd_self_right_right` | Int.gcd_gcd_self_right_right (m n : Int) : m.gcd ↑(n.gcd m) = n.gcd m |
| `Int.gcd_left_comm` | Int.gcd_left_comm (a b c : Int) : a.gcd ↑(b.gcd c) = b.gcd ↑(a.gcd c) |
| `Int.gcd_mul_lcm` | Int.gcd_mul_lcm (m n : Int) : m.gcd n * m.lcm n = m.natAbs * n.natAbs |
| `Int.gcd_mul_left` | Int.gcd_mul_left (m n k : Int) : (m * n).gcd (m * k) = m.natAbs * n.gcd k |
| `Int.gcd_mul_left_add_left` | Int.gcd_mul_left_add_left (m n k : Int) : (m * k + n).gcd m = n.gcd m |
| `Int.gcd_mul_left_add_right` | Int.gcd_mul_left_add_right (m n k : Int) : m.gcd (m * k + n) = m.gcd n |
| `Int.gcd_mul_left_left` | Int.gcd_mul_left_left (a b : Int) : (a * b).gcd b = b.natAbs |
| `Int.gcd_mul_left_left_of_gcd_eq_one` | Int.gcd_mul_left_left_of_gcd_eq_one {n m k : Int} : n.gcd m = 1 → (k * n).gcd m = k.gcd m |
| `Int.gcd_mul_left_right` | Int.gcd_mul_left_right (a b : Int) : a.gcd (b * a) = a.natAbs |
| `Int.gcd_mul_left_right_of_gcd_eq_one` | Int.gcd_mul_left_right_of_gcd_eq_one {n m k : Int} : n.gcd m = 1 → n.gcd (k * m) = n.gcd k |
| `Int.gcd_mul_left_sub_left` | Int.gcd_mul_left_sub_left (m n k : Int) : (m * k - n).gcd m = n.gcd m |
| `Int.gcd_mul_left_sub_right` | Int.gcd_mul_left_sub_right (m n k : Int) : m.gcd (m * k - n) = m.gcd n |
| `Int.gcd_mul_right` | Int.gcd_mul_right (m n k : Int) : (m * n).gcd (k * n) = m.gcd k * n.natAbs |
| `Int.gcd_mul_right_add_left` | Int.gcd_mul_right_add_left (m n k : Int) : (k * m + n).gcd m = n.gcd m |
| `Int.gcd_mul_right_add_right` | Int.gcd_mul_right_add_right (m n k : Int) : m.gcd (k * m + n) = m.gcd n |
| `Int.gcd_mul_right_left` | Int.gcd_mul_right_left (a b : Int) : (b * a).gcd b = b.natAbs |
| `Int.gcd_mul_right_left_of_gcd_eq_one` | Int.gcd_mul_right_left_of_gcd_eq_one {n m k : Int} : n.gcd m = 1 → (n * k).gcd m = k.gcd m |
| `Int.gcd_mul_right_right` | Int.gcd_mul_right_right (a b : Int) : a.gcd (a * b) = a.natAbs |
| `Int.gcd_mul_right_right_of_gcd_eq_one` | Int.gcd_mul_right_right_of_gcd_eq_one {n m k : Int} : n.gcd m = 1 → n.gcd (m * k) = n.gcd k |
| `Int.gcd_mul_right_sub_left` | Int.gcd_mul_right_sub_left (m n k : Int) : (k * m - n).gcd m = n.gcd m |
| `Int.gcd_mul_right_sub_right` | Int.gcd_mul_right_sub_right (m n k : Int) : m.gcd (k * m - n) = m.gcd n |
| `Int.gcd_natCast_natCast` | Int.gcd_natCast_natCast (a b : Nat) : (↑a).gcd ↑b = a.gcd b |
| `Int.gcd_neg` | Int.gcd_neg {a b : Int} : a.gcd (-b) = a.gcd b |
| `Int.gcd_one` | Int.gcd_one {a : Int} : a.gcd 1 = 1 |
| `Int.gcd_one_left` | Int.gcd_one_left (a : Int) : Int.gcd 1 a = 1 |
| `Int.gcd_one_right` | Int.gcd_one_right (a : Int) : a.gcd 1 = 1 |
| `Int.gcd_pow_left_of_gcd_eq_one` | Int.gcd_pow_left_of_gcd_eq_one {n m : Int} {k : Nat} : n.gcd m = 1 → (n ^ k).gcd m = 1 |
| `Int.gcd_pow_right_of_gcd_eq_one` | Int.gcd_pow_right_of_gcd_eq_one {n m : Int} {k : Nat} (h : n.gcd m = 1) : n.gcd (m ^ k) = 1 |
| `Int.gcd_self` | Int.gcd_self {a : Int} : a.gcd a = a.natAbs |
| `Int.gcd_self_add_left` | Int.gcd_self_add_left (m n : Int) : (m + n).gcd m = n.gcd m |
| `Int.gcd_self_add_right` | Int.gcd_self_add_right (m n : Int) : m.gcd (m + n) = m.gcd n |
| `Int.gcd_self_sub_left` | Int.gcd_self_sub_left (m n : Int) : (m - n).gcd m = n.gcd m |
| `Int.gcd_self_sub_right` | Int.gcd_self_sub_right (m n : Int) : m.gcd (m - n) = m.gcd n |
| `Int.gcd_sub_left_left_of_dvd` | Int.gcd_sub_left_left_of_dvd {m k : Int} (n : Int) : m ∣ k → (k - n).gcd m = n.gcd m |
| `Int.gcd_sub_left_right_of_dvd` | Int.gcd_sub_left_right_of_dvd {n k : Int} (m : Int) : n ∣ k → n.gcd (k - m) = n.gcd m |
| `Int.gcd_sub_mul_left_left` | Int.gcd_sub_mul_left_left (m n k : Int) : (n - m * k).gcd m = n.gcd m |
| `Int.gcd_sub_mul_left_right` | Int.gcd_sub_mul_left_right (m n k : Int) : m.gcd (n - m * k) = m.gcd n |
| `Int.gcd_sub_mul_right_left` | Int.gcd_sub_mul_right_left (m n k : Int) : (n - k * m).gcd m = n.gcd m |
| `Int.gcd_sub_mul_right_right` | Int.gcd_sub_mul_right_right (m n k : Int) : m.gcd (n - k * m) = m.gcd n |
| `Int.gcd_sub_right_left_of_dvd` | Int.gcd_sub_right_left_of_dvd {m k : Int} (n : Int) : m ∣ k → (n - k).gcd m = n.gcd m |
| `Int.gcd_sub_right_right_of_dvd` | Int.gcd_sub_right_right_of_dvd {n k : Int} (m : Int) : n ∣ k → n.gcd (m - k) = n.gcd m |
| `Int.gcd_sub_self_left` | Int.gcd_sub_self_left (m n : Int) : (n - m).gcd m = n.gcd m |
| `Int.gcd_sub_self_right` | Int.gcd_sub_self_right (m n : Int) : m.gcd (n - m) = m.gcd n |
| `Int.gcd_zero` | Int.gcd_zero {a : Int} : a.gcd 0 = a.natAbs |
| `Int.gcd_zero_left` | Int.gcd_zero_left (a : Int) : Int.gcd 0 a = a.natAbs |
| `Int.gcd_zero_right` | Int.gcd_zero_right (a : Int) : a.gcd 0 = a.natAbs |
| `Int.lcm.eq_1` | Int.lcm.eq_1 (m n : Int) : m.lcm n = m.natAbs.lcm n.natAbs |
| `Int.lcm_assoc` | Int.lcm_assoc (a b c : Int) : (↑(a.lcm b)).lcm c = a.lcm ↑(b.lcm c) |
| `Int.lcm_comm` | Int.lcm_comm (a b : Int) : a.lcm b = b.lcm a |
| `Int.lcm_ediv` | Int.lcm_ediv {a b c : Int} (ha : c ∣ a) (hb : c ∣ b) : (a / c).lcm (b / c) = a.lcm b / c.natAbs |
| `Int.lcm_eq_left` | Int.lcm_eq_left {a b : Int} (ha : 0 ≤ a) (h : b ∣ a) : ↑(a.lcm b) = a |
| `Int.lcm_eq_mul_div` | Int.lcm_eq_mul_div (m n : Int) : m.lcm n = m.natAbs * n.natAbs / m.gcd n |
| `Int.lcm_eq_natAbs_lcm_natAbs` | Int.lcm_eq_natAbs_lcm_natAbs (m n : Int) : m.lcm n = m.natAbs.lcm n.natAbs |
| `Int.lcm_eq_natAbs_left` | Int.lcm_eq_natAbs_left {b a : Int} (h : b ∣ a) : a.lcm b = a.natAbs |
| `Int.lcm_eq_natAbs_right` | Int.lcm_eq_natAbs_right {a b : Int} (h : a ∣ b) : a.lcm b = b.natAbs |
| `Int.lcm_eq_right` | Int.lcm_eq_right {b a : Int} (hb : 0 ≤ b) (h : a ∣ b) : ↑(a.lcm b) = b |
| `Int.lcm_lcm_self_left_left` | Int.lcm_lcm_self_left_left (m n : Int) : (↑(m.lcm n)).lcm m = n.lcm m |
| `Int.lcm_lcm_self_left_right` | Int.lcm_lcm_self_left_right (m n : Int) : (↑(n.lcm m)).lcm m = n.lcm m |
| `Int.lcm_lcm_self_right_left` | Int.lcm_lcm_self_right_left (m n : Int) : m.lcm ↑(m.lcm n) = m.lcm n |
| `Int.lcm_lcm_self_right_right` | Int.lcm_lcm_self_right_right (m n : Int) : m.lcm ↑(n.lcm m) = m.lcm n |
| `Int.lcm_mul_gcd` | Int.lcm_mul_gcd (m n : Int) : m.lcm n * m.gcd n = m.natAbs * n.natAbs |
| `Int.lcm_mul_left` | Int.lcm_mul_left (m n k : Int) : (m * n).lcm (m * k) = m.natAbs * n.lcm k |
| `Int.lcm_mul_left_left` | Int.lcm_mul_left_left (a b : Int) : (a * b).lcm b = a.natAbs * b.natAbs |
| `Int.lcm_mul_left_left_eq_mul_of_lcm_eq_mul` | Int.lcm_mul_left_left_eq_mul_of_lcm_eq_mul {n m k : Int} (h : n.lcm m = n.natAbs * m.natAbs) : (k |
| `Int.lcm_mul_left_right` | Int.lcm_mul_left_right (a b : Int) : a.lcm (b * a) = b.natAbs * a.natAbs |
| `Int.lcm_mul_left_right_eq_mul_of_lcm_eq_mul` | Int.lcm_mul_left_right_eq_mul_of_lcm_eq_mul {n m k : Int} (h : n.lcm m = n.natAbs * m.natAbs) : n.lcm |
| `Int.lcm_mul_right` | Int.lcm_mul_right (m n k : Int) : (m * n).lcm (k * n) = m.lcm k * n.natAbs |
| `Int.lcm_mul_right_left` | Int.lcm_mul_right_left (a b : Int) : (b * a).lcm b = b.natAbs * a.natAbs |
| `Int.lcm_mul_right_left_eq_mul_of_lcm_eq_mul` | Int.lcm_mul_right_left_eq_mul_of_lcm_eq_mul {n m k : Int} (h : n.lcm m = n.natAbs * m.natAbs) : (n |
| `Int.lcm_mul_right_right` | Int.lcm_mul_right_right (a b : Int) : a.lcm (a * b) = a.natAbs * b.natAbs |
| `Int.lcm_mul_right_right_eq_mul_of_lcm_eq_mul` | Int.lcm_mul_right_right_eq_mul_of_lcm_eq_mul {n m k : Int} (h : n.lcm m = n.natAbs * m.natAbs) : n.lcm |
| `Int.lcm_natCast_natCast` | Int.lcm_natCast_natCast (a b : Nat) : (↑a).lcm ↑b = a.lcm b |
| `Int.lcm_neg` | Int.lcm_neg {a b : Int} : a.lcm (-b) = a.lcm b |
| `Int.lcm_one` | Int.lcm_one {a : Int} : a.lcm 1 = a.natAbs |
| `Int.lcm_one_left` | Int.lcm_one_left (a : Int) : Int.lcm 1 a = a.natAbs |
| `Int.lcm_one_right` | Int.lcm_one_right (a : Int) : a.lcm 1 = a.natAbs |
| `Int.lcm_self` | Int.lcm_self {a : Int} : a.lcm a = a.natAbs |
| `Int.lcm_zero` | Int.lcm_zero {a : Int} : a.lcm 0 = 0 |
| `Int.lcm_zero_left` | Int.lcm_zero_left (a : Int) : Int.lcm 0 a = 0 |
| `Int.lcm_zero_right` | Int.lcm_zero_right (a : Int) : a.lcm 0 = 0 |
| `Int.mod_bmod_mul_of_pos` | Int.mod_bmod_mul_of_pos {a : Nat} (b : Int) (c : Nat) (h : 0 < a) (hce : 2 ∣ c) : (↑a * b).bmod (a * c) = ↑a * b.bmod c |
| `Int.mod_def'` | Int.mod_def' (m n : Int) : m % n = m.emod n |

## Int Zero / one / numerals (130)

| Lemma | Statement |
|---|---|
| `Int.cast_eq` | Int.cast_eq (x : Int) : ↑x = x |
| `Int.cast_id` | Int.cast_id {n : Int} : ↑n = n |
| `Int.cast_ofNat_Int` | Int.cast_ofNat_Int {n : Nat} : ↑(OfNat.ofNat n) = OfNat.ofNat n |
| `Int.natAbs.eq_1` | Int.natAbs.eq_1 (n_1 : Nat) : (Int.ofNat n_1).natAbs = n_1 |
| `Int.natAbs.eq_2` | Int.natAbs.eq_2 (n_1 : Nat) : (Int.negSucc n_1).natAbs = n_1.succ |
| `Int.natAbs.eq_def` | Int.natAbs.eq_def (m : Int) : m.natAbs match \| \| |
| `Int.natAbs_add_of_nonneg` | Int.natAbs_add_of_nonneg {a b : Int} : 0 ≤ a → 0 ≤ b → (a + b).natAbs = a.natAbs + b.natAbs |
| `Int.natAbs_add_of_nonpos` | Int.natAbs_add_of_nonpos {a b : Int} (ha : a ≤ 0) (hb : b ≤ 0) : (a + b).natAbs = a.natAbs + b.natAbs |
| `Int.natAbs_cast` | Int.natAbs_cast (n : Nat) : (↑n).natAbs = n |
| `Int.natAbs_ediv` | Int.natAbs_ediv (a b : Int) : (a / b).natAbs = a.natAbs / b.natAbs + if 0 ≤ a ∨ b = 0 ∨ b ∣ a then 0 else 1 |
| `Int.natAbs_ediv_of_dvd` | Int.natAbs_ediv_of_dvd {a b : Int} (hab : b ∣ a) : (a / b).natAbs = a.natAbs / b.natAbs |
| `Int.natAbs_ediv_of_nonneg` | Int.natAbs_ediv_of_nonneg {a b : Int} (ha : 0 ≤ a) : (a / b).natAbs = a.natAbs / b.natAbs |
| `Int.natAbs_emod` | Int.natAbs_emod (a : Int) {b : Int} (hb : b ≠ 0) : (a |
| `Int.natAbs_emod_of_nonneg` | Int.natAbs_emod_of_nonneg {a : Int} (h : 0 ≤ a) (b : Int) : (a % b).natAbs = a.natAbs % b.natAbs |
| `Int.natAbs_emod_two` | Int.natAbs_emod_two (i : Int) : i.natAbs % 2 = (i % 2).natAbs |
| `Int.natAbs_eq_of_dvd_dvd` | Int.natAbs_eq_of_dvd_dvd {m n : Int} (hmn : m ∣ n) (hnm : n ∣ m) : m.natAbs = n.natAbs |
| `Int.natAbs_mul` | Int.natAbs_mul (a b : Int) : (a * b).natAbs = a.natAbs * b.natAbs |
| `Int.natAbs_mul_natAbs_eq` | Int.natAbs_mul_natAbs_eq {a b : Int} {c : Nat} (h : a * b = ↑c) : a.natAbs * b.natAbs = c |
| `Int.natAbs_mul_self` | Int.natAbs_mul_self {a : Int} : ↑(a.natAbs * a.natAbs) = a * a |
| `Int.natAbs_mul_self'` | Int.natAbs_mul_self' (a : Int) : ↑a.natAbs * ↑a.natAbs = a * a |
| `Int.natAbs_natCast` | Int.natAbs_natCast (n : Nat) : (↑n).natAbs = n |
| `Int.natAbs_neg` | Int.natAbs_neg (a : Int) : (-a).natAbs = a.natAbs |
| `Int.natAbs_negOfNat` | Int.natAbs_negOfNat (n : Nat) : (Int.negOfNat n).natAbs = n |
| `Int.natAbs_negSucc` | Int.natAbs_negSucc (n : Nat) : (Int.negSucc n).natAbs = n.succ |
| `Int.natAbs_ofNat'` | Int.natAbs_ofNat' (n : Nat) : (Int.ofNat n).natAbs = n |
| `Int.natAbs_of_nonneg` | Int.natAbs_of_nonneg {a : Int} (H : 0 ≤ a) : ↑a.natAbs = a |
| `Int.natAbs_one` | Int.natAbs_one : Int.natAbs 1 = 1 |
| `Int.natAbs_pow` | Int.natAbs_pow (n : Int) (k : Nat) : (n ^ k).natAbs = n.natAbs ^ k |
| `Int.natAbs_pow_two` | Int.natAbs_pow_two (a : Int) : ↑a.natAbs ^ 2 = a ^ 2 |
| `Int.natAbs_sign` | Int.natAbs_sign (z : Int) : z.sign.natAbs = if z = 0 then 0 else 1 |
| `Int.natAbs_sign_of_ne_zero` | Int.natAbs_sign_of_ne_zero {z : Int} (hz : z ≠ 0) : z.sign.natAbs = 1 |
| `Int.natAbs_sub_of_nonneg_of_le` | Int.natAbs_sub_of_nonneg_of_le {a b : Int} (h₁ : 0 ≤ b) (h₂ : b ≤ a) : (a - b).natAbs = a.natAbs - b.natAbs |
| `Int.natAbs_tdiv` | Int.natAbs_tdiv (a b : Int) : (a.tdiv b).natAbs = a.natAbs.div b.natAbs |
| `Int.natAbs_tmod` | Int.natAbs_tmod (a b : Int) : (a.tmod b).natAbs = a.natAbs % b.natAbs |
| `Int.natAbs_zero` | Int.natAbs_zero : Int.natAbs 0 = 0 |
| `Int.natCast_add` | Int.natCast_add (n m : Nat) : ↑(n + m) = ↑n + ↑m |
| `Int.natCast_add_one` | Int.natCast_add_one (n : Nat) : ↑(n + 1) = ↑n + 1 |
| `Int.natCast_ediv` | Int.natCast_ediv (m n : Nat) : ↑(m / n) = ↑m / ↑n |
| `Int.natCast_emod` | Int.natCast_emod (m n : Nat) : ↑(m % n) = ↑m % ↑n |
| `Int.natCast_mul` | Int.natCast_mul (n m : Nat) : ↑(n * m) = ↑n * ↑m |
| `Int.natCast_one` | Int.natCast_one : ↑1 = 1 |
| `Int.natCast_pow` | Int.natCast_pow (m n : Nat) : ↑(m ^ n) = ↑m ^ n |
| `Int.natCast_shiftLeft` | Int.natCast_shiftLeft (n s : Nat) : ↑(n <<< s) = ↑n <<< s |
| `Int.natCast_shiftRight` | Int.natCast_shiftRight (n s : Nat) : ↑(n >>> s) = ↑n >>> s |
| `Int.natCast_sub` | Int.natCast_sub {n m : Nat} : n ≤ m → ↑(m - n) = ↑m - ↑n |
| `Int.natCast_succ` | Int.natCast_succ (n : Nat) : ↑n.succ = ↑n + 1 |
| `Int.natCast_tdiv_eq_ediv` | Int.natCast_tdiv_eq_ediv {a : Nat} {b : Int} : (↑a).tdiv b = ↑a / b |
| `Int.natCast_zero` | Int.natCast_zero : ↑0 = 0 |
| `Int.ofNat.inj` | Int.ofNat.inj {a✝ a✝¹ : Nat} : Int.ofNat a✝ = Int.ofNat a✝¹ → a✝ = a✝¹ |
| `Int.ofNat.injEq` | Int.ofNat.injEq (a✝ a✝¹ : Nat) : (Int.ofNat a✝ = Int.ofNat a✝¹) = (a✝ = a✝¹) |
| `Int.ofNat.sizeOf_spec` | Int.ofNat.sizeOf_spec (a✝ : Nat) : sizeOf (Int.ofNat a✝) = 1 + sizeOf a✝ |
| `Int.ofNat_add_negSucc` | Int.ofNat_add_negSucc (m n : Nat) : ↑m + Int.negSucc n = Int.subNatNat m n.succ |
| `Int.ofNat_add_negSucc_of_lt` | Int.ofNat_add_negSucc_of_lt {m n : Nat} (h : m < n.succ) : Int.ofNat m + Int.negSucc n = Int.negSucc (n - m) |
| `Int.ofNat_add_ofNat` | Int.ofNat_add_ofNat (m n : Nat) : ↑m + ↑n = ↑(m + n) |
| `Int.ofNat_add_one_out` | Int.ofNat_add_one_out (n : Nat) : ↑n + 1 = ↑n.succ |
| `Int.ofNat_add_out` | Int.ofNat_add_out (m n : Nat) : ↑m + ↑n = ↑(m + n) |
| `Int.ofNat_ediv_negSucc` | Int.ofNat_ediv_negSucc {a b : Nat} : Int.ofNat a / Int.negSucc b = -↑(a / (b + 1)) |
| `Int.ofNat_ediv_ofNat` | Int.ofNat_ediv_ofNat {a b : Nat} : ↑a / ↑b = ↑(a / b) |
| `Int.ofNat_eq_coe` | Int.ofNat_eq_coe {n : Nat} : Int.ofNat n = ↑n |
| `Int.ofNat_eq_natCast` | Int.ofNat_eq_natCast (n : Nat) : Int.ofNat n = ↑n |
| `Int.ofNat_fdiv` | Int.ofNat_fdiv (m n : Nat) : ↑(m / n) = (↑m).fdiv ↑n |
| `Int.ofNat_fmod` | Int.ofNat_fmod (m n : Nat) : ↑(m % n) = (↑m).fmod ↑n |
| `Int.ofNat_max_zero` | Int.ofNat_max_zero (n : Nat) : max (↑n) 0 = ↑n |
| `Int.ofNat_mod_ofNat` | Int.ofNat_mod_ofNat (m n : Nat) : ↑m % ↑n = ↑(m % n) |
| `Int.ofNat_mul_negOfNat` | Int.ofNat_mul_negOfNat (m n : Nat) : ↑m * Int.negOfNat n = Int.negOfNat (m * n) |
| `Int.ofNat_mul_negSucc` | Int.ofNat_mul_negSucc (m n : Nat) : ↑m * Int.negSucc n = -↑(m * n.succ) |
| `Int.ofNat_mul_ofNat` | Int.ofNat_mul_ofNat (m n : Nat) : ↑m * ↑n = ↑(m * n) |
| `Int.ofNat_mul_out` | Int.ofNat_mul_out (m n : Nat) : ↑m * ↑n = ↑(m * n) |
| `Int.ofNat_mul_subNatNat` | Int.ofNat_mul_subNatNat (m n k : Nat) : ↑m * Int.subNatNat n k = Int.subNatNat (m * n) (m * k) |
| `Int.ofNat_natAbs_of_nonneg` | Int.ofNat_natAbs_of_nonneg {a : Int} (h : 0 ≤ a) : ↑a.natAbs = a |
| `Int.ofNat_natAbs_of_nonpos` | Int.ofNat_natAbs_of_nonpos {a : Int} (H : a ≤ 0) : ↑a.natAbs = -a |
| `Int.ofNat_one` | Int.ofNat_one : ↑1 = 1 |
| `Int.ofNat_sub` | Int.ofNat_sub {m n : Nat} (h : m ≤ n) : ↑(n - m) = ↑n - ↑m |
| `Int.ofNat_tdiv` | Int.ofNat_tdiv (m n : Nat) : ↑(m / n) = (↑m).tdiv ↑n |
| `Int.ofNat_tmod` | Int.ofNat_tmod (m n : Nat) : ↑(m % n) = (↑m).tmod ↑n |
| `Int.ofNat_toNat` | Int.ofNat_toNat (a : Int) : ↑a.toNat = max a 0 |
| `Int.ofNat_two` | Int.ofNat_two : ↑2 = 2 |
| `Int.ofNat_zero` | Int.ofNat_zero : ↑0 = 0 |
| `Int.one_bmod` | Int.one_bmod {b : Nat} (h : 3 ≤ b) : Int.bmod 1 b = 1 |
| `Int.one_bmod_two` | Int.one_bmod_two : Int.bmod 1 2 = -1 |
| `Int.one_ediv` | Int.one_ediv (b : Int) : 1 / b = if b.natAbs = 1 then b else 0 |
| `Int.one_emod` | Int.one_emod {b : Int} : 1 % b = if b.natAbs = 1 then 0 else 1 |
| `Int.one_gcd` | Int.one_gcd {a : Int} : Int.gcd 1 a = 1 |
| `Int.one_lcm` | Int.one_lcm {a : Int} : Int.lcm 1 a = a.natAbs |
| `Int.one_mul` | Int.one_mul (a : Int) : 1 * a = a |
| `Int.one_pow` | Int.one_pow {n : Nat} : 1 ^ n = 1 |
| `Int.sign.eq_1` | Int.sign.eq_1 (n : Nat) : (Int.ofNat n.succ).sign = 1 |
| `Int.sign.eq_2` | Int.sign.eq_2 : (Int.ofNat 0).sign = 0 |
| `Int.sign.eq_3` | Int.sign.eq_3 (a : Nat) : (Int.negSucc a).sign = -1 |
| `Int.sign_ediv` | Int.sign_ediv (a b : Int) : (a / b).sign = if 0 ≤ a ∧ a < ↑b.natAbs then 0 else a.sign * b.sign |
| `Int.sign_emod` | Int.sign_emod (a : Int) {b : Int} (h : b ≠ 0) : (a % b).sign = if b ∣ a then 0 else 1 |
| `Int.sign_eq_ediv_natAbs` | Int.sign_eq_ediv_natAbs (a : Int) : a.sign = a / ↑a.natAbs |
| `Int.sign_eq_fdiv_abs` | Int.sign_eq_fdiv_abs (a : Int) : a.sign = a.fdiv ↑a.natAbs |
| `Int.sign_eq_neg_one_of_neg` | Int.sign_eq_neg_one_of_neg {a : Int} (h : a < 0) : a.sign = -1 |
| `Int.sign_eq_one_of_pos` | Int.sign_eq_one_of_pos {a : Int} (h : 0 < a) : a.sign = 1 |
| `Int.sign_eq_tdiv_abs` | Int.sign_eq_tdiv_abs (a : Int) : a.sign = a.tdiv ↑a.natAbs |
| `Int.sign_mul` | Int.sign_mul (a b : Int) : (a * b).sign = a.sign * b.sign |
| `Int.sign_mul_natAbs` | Int.sign_mul_natAbs (a : Int) : a.sign * ↑a.natAbs = a |
| `Int.sign_mul_self` | Int.sign_mul_self (i : Int) : i.sign * i = ↑i.natAbs |
| `Int.sign_natCast_add_one` | Int.sign_natCast_add_one (n : Nat) : (↑n + 1).sign = 1 |
| `Int.sign_natCast_of_ne_zero` | Int.sign_natCast_of_ne_zero {n : Nat} (hn : n ≠ 0) : (↑n).sign = 1 |
| `Int.sign_neg` | Int.sign_neg (z : Int) : (-z).sign = -z.sign |
| `Int.sign_negSucc` | Int.sign_negSucc (x : Nat) : (Int.negSucc x).sign = -1 |
| `Int.sign_neg_one` | Int.sign_neg_one : (-1).sign = -1 |
| `Int.sign_of_add_one` | Int.sign_of_add_one (x : Nat) : (↑x + 1).sign = 1 |
| `Int.sign_one` | Int.sign_one : Int.sign 1 = 1 |
| `Int.sign_sign` | Int.sign_sign {x : Int} : x.sign.sign = x.sign |
| `Int.sign_tdiv` | Int.sign_tdiv (a b : Int) : (a.tdiv b).sign = if a.natAbs < b.natAbs then 0 else a.sign * b.sign |
| `Int.sign_tmod` | Int.sign_tmod (a b : Int) : (a.tmod b).sign = if b ∣ a then 0 else a.sign |
| `Int.sign_zero` | Int.sign_zero : Int.sign 0 = 0 |
| `Int.two_mul` | Int.two_mul (n : Int) : 2 * n = n + n |
| `Int.two_pow_pred_sub_two_pow` | Int.two_pow_pred_sub_two_pow {w : Nat} (h : 0 < w) : ↑(2 ^ (w - 1)) - ↑(2 ^ w) = -↑(2 ^ (w - 1)) |
| `Int.two_pow_pred_sub_two_pow'` | Int.two_pow_pred_sub_two_pow' {w : Nat} (h : 0 < w) : 2 ^ (w - 1) - 2 ^ w = -2 ^ (w - 1) |
| `Int.zero_add` | Int.zero_add (a : Int) : 0 + a = a |
| `Int.zero_bmod` | Int.zero_bmod {m : Nat} : Int.bmod 0 m = 0 |
| `Int.zero_ediv` | Int.zero_ediv (b : Int) : 0 / b = 0 |
| `Int.zero_emod` | Int.zero_emod (b : Int) : 0 % b = 0 |
| `Int.zero_fdiv` | Int.zero_fdiv (b : Int) : Int.fdiv 0 b = 0 |
| `Int.zero_fmod` | Int.zero_fmod (b : Int) : Int.fmod 0 b = 0 |
| `Int.zero_gcd` | Int.zero_gcd {a : Int} : Int.gcd 0 a = a.natAbs |
| `Int.zero_lcm` | Int.zero_lcm {a : Int} : Int.lcm 0 a = 0 |
| `Int.zero_max_negSucc` | Int.zero_max_negSucc (n : Nat) : max 0 (Int.negSucc n) = 0 |
| `Int.zero_max_ofNat` | Int.zero_max_ofNat (n : Nat) : max 0 ↑n = ↑n |
| `Int.zero_mul` | Int.zero_mul (a : Int) : 0 * a = 0 |
| `Int.zero_pow` | Int.zero_pow {n : Nat} (h : n ≠ 0) : 0 ^ n = 0 |
| `Int.zero_shiftLeft` | Int.zero_shiftLeft (n : Nat) : 0 <<< n = 0 |
| `Int.zero_shiftRight` | Int.zero_shiftRight (n : Nat) : 0 >>> n = 0 |
| `Int.zero_sub` | Int.zero_sub (a : Int) : 0 - a = -a |
| `Int.zero_tdiv` | Int.zero_tdiv (b : Int) : Int.tdiv 0 b = 0 |
| `Int.zero_tmod` | Int.zero_tmod (b : Int) : Int.tmod 0 b = 0 |

## Int Order / equality (110)

| Lemma | Statement |
|---|---|
| `Int.eq_ediv_of_mul_eq_left` | Int.eq_ediv_of_mul_eq_left {a b c : Int} (H1 : b ≠ 0) (H2 : a * b = c) : a = c / b |
| `Int.eq_ediv_of_mul_eq_right` | Int.eq_ediv_of_mul_eq_right {a b c : Int} (H1 : a ≠ 0) (H2 : a * b = c) : b = c / a |
| `Int.eq_fdiv_of_mul_eq_left` | Int.eq_fdiv_of_mul_eq_left {a b c : Int} (H1 : b ≠ 0) (H2 : a * b = c) : a = c.fdiv b |
| `Int.eq_fdiv_of_mul_eq_right` | Int.eq_fdiv_of_mul_eq_right {a b c : Int} (H1 : a ≠ 0) (H2 : a * b = c) : b = c.fdiv a |
| `Int.eq_mul_of_ediv_eq_left` | Int.eq_mul_of_ediv_eq_left {a b c : Int} (H1 : b ∣ a) (H2 : a / b = c) : a = c * b |
| `Int.eq_mul_of_ediv_eq_right` | Int.eq_mul_of_ediv_eq_right {a b c : Int} (H1 : b ∣ a) (H2 : a / b = c) : a = b * c |
| `Int.eq_mul_of_fdiv_eq_left` | Int.eq_mul_of_fdiv_eq_left {a b c : Int} (H1 : b ∣ a) (H2 : a.fdiv b = c) : a = c * b |
| `Int.eq_mul_of_fdiv_eq_right` | Int.eq_mul_of_fdiv_eq_right {a b c : Int} (H1 : b ∣ a) (H2 : a.fdiv b = c) : a = b * c |
| `Int.eq_mul_of_tdiv_eq_left` | Int.eq_mul_of_tdiv_eq_left {a b c : Int} (H1 : b ∣ a) (H2 : a.tdiv b = c) : a = c * b |
| `Int.eq_mul_of_tdiv_eq_right` | Int.eq_mul_of_tdiv_eq_right {a b c : Int} (H1 : b ∣ a) (H2 : a.tdiv b = c) : a = b * c |
| `Int.eq_natAbs_of_nonneg` | Int.eq_natAbs_of_nonneg {a : Int} (h : 0 ≤ a) : a = ↑a.natAbs |
| `Int.eq_neg_natAbs_of_nonpos` | Int.eq_neg_natAbs_of_nonpos {a : Int} (h : a ≤ 0) : a = -↑a.natAbs |
| `Int.eq_neg_of_eq_neg` | Int.eq_neg_of_eq_neg {a b : Int} (h : a = -b) : b = -a |
| `Int.eq_of_mul_eq_mul_left` | Int.eq_of_mul_eq_mul_left {a b c : Int} (ha : a ≠ 0) (h : a * b = a * c) : b = c |
| `Int.eq_of_mul_eq_mul_right` | Int.eq_of_mul_eq_mul_right {a b c : Int} (ha : a ≠ 0) (h : b * a = c * a) : b = c |
| `Int.eq_of_sub_eq_zero` | Int.eq_of_sub_eq_zero {a b : Int} (h : a - b = 0) : a = b |
| `Int.eq_one_of_dvd_one` | Int.eq_one_of_dvd_one {a : Int} (H : 0 ≤ a) (H' : a ∣ 1) : a = 1 |
| `Int.eq_one_of_mul_eq_one_left` | Int.eq_one_of_mul_eq_one_left {a b : Int} (H : 0 ≤ b) (H' : a * b = 1) : b = 1 |
| `Int.eq_one_of_mul_eq_one_right` | Int.eq_one_of_mul_eq_one_right {a b : Int} (H : 0 ≤ a) (H' : a * b = 1) : a = 1 |
| `Int.eq_one_of_mul_eq_self_left` | Int.eq_one_of_mul_eq_self_left {a b : Int} (Hpos : a ≠ 0) (H : b * a = a) : b = 1 |
| `Int.eq_one_of_mul_eq_self_right` | Int.eq_one_of_mul_eq_self_right {a b : Int} (Hpos : b ≠ 0) (H : b * a = b) : a = 1 |
| `Int.eq_tdiv_of_mul_eq_left` | Int.eq_tdiv_of_mul_eq_left {a b c : Int} (H1 : b ≠ 0) (H2 : a * b = c) : a = c.tdiv b |
| `Int.eq_tdiv_of_mul_eq_right` | Int.eq_tdiv_of_mul_eq_right {a b c : Int} (H1 : a ≠ 0) (H2 : a * b = c) : b = c.tdiv a |
| `Int.eq_zero_of_dvd_of_natAbs_lt_natAbs` | Int.eq_zero_of_dvd_of_natAbs_lt_natAbs {d n : Int} (h : d ∣ n) (h₁ : n.natAbs < d.natAbs) : n = 0 |
| `Int.eq_zero_of_ediv_eq_zero` | Int.eq_zero_of_ediv_eq_zero {d n : Int} (h : d ∣ n) (H : n / d = 0) : n = 0 |
| `Int.eq_zero_of_fdiv_eq_zero` | Int.eq_zero_of_fdiv_eq_zero {d n : Int} (h : d ∣ n) (H : n.fdiv d = 0) : n = 0 |
| `Int.eq_zero_of_gcd_eq_zero_left` | Int.eq_zero_of_gcd_eq_zero_left {a b : Int} (h : a.gcd b = 0) : a = 0 |
| `Int.eq_zero_of_gcd_eq_zero_right` | Int.eq_zero_of_gcd_eq_zero_right {a b : Int} (h : a.gcd b = 0) : b = 0 |
| `Int.eq_zero_of_sign_eq_zero` | Int.eq_zero_of_sign_eq_zero {a : Int} : a.sign = 0 → a = 0 |
| `Int.eq_zero_of_tdiv_eq_zero` | Int.eq_zero_of_tdiv_eq_zero {d n : Int} (h : d ∣ n) (H : n.tdiv d = 0) : n = 0 |
| `Int.le_antisymm` | Int.le_antisymm {a b : Int} (h₁ : a ≤ b) (h₂ : b ≤ a) : a = b |
| `Int.lt.eq_1` | Int.lt.eq_1 (a b : Int) : a.lt b = (a + 1 ≤ b) |
| `Int.max_add_left` | Int.max_add_left (a b c : Int) : max (a + b) (a + c) = a + max b c |
| `Int.max_add_right` | Int.max_add_right (a b c : Int) : max (a + c) (b + c) = max a b + c |
| `Int.max_assoc` | Int.max_assoc (a b c : Int) : max (max a b) c = max a (max b c) |
| `Int.max_comm` | Int.max_comm (a b : Int) : max a b = max b a |
| `Int.max_def` | Int.max_def (n m : Int) : max n m = if n ≤ m then m else n |
| `Int.max_eq_left` | Int.max_eq_left {a b : Int} (h : b ≤ a) : max a b = a |
| `Int.max_eq_right` | Int.max_eq_right {a b : Int} (h : a ≤ b) : max a b = b |
| `Int.max_min_distrib_left` | Int.max_min_distrib_left (a b c : Int) : max a (min b c) = min (max a b) (max a c) |
| `Int.max_min_distrib_right` | Int.max_min_distrib_right (a b c : Int) : max (min a b) c = min (max a c) (max b c) |
| `Int.max_self` | Int.max_self (a : Int) : max a a = a |
| `Int.max_self_assoc` | Int.max_self_assoc {m n : Int} : max m (max m n) = max m n |
| `Int.max_self_assoc'` | Int.max_self_assoc' {m n : Int} : max n (max m n) = max n m |
| `Int.min_add_left` | Int.min_add_left (a b c : Int) : min (a + b) (a + c) = a + min b c |
| `Int.min_add_right` | Int.min_add_right (a b c : Int) : min (a + c) (b + c) = min a b + c |
| `Int.min_assoc` | Int.min_assoc (a b c : Int) : min (min a b) c = min a (min b c) |
| `Int.min_comm` | Int.min_comm (a b : Int) : min a b = min b a |
| `Int.min_def` | Int.min_def (n m : Int) : min n m = if n ≤ m then n else m |
| `Int.min_eq_left` | Int.min_eq_left {a b : Int} (h : a ≤ b) : min a b = a |
| `Int.min_eq_right` | Int.min_eq_right {a b : Int} (h : b ≤ a) : min a b = b |
| `Int.min_max_distrib_left` | Int.min_max_distrib_left (a b c : Int) : min a (max b c) = max (min a b) (min a c) |
| `Int.min_max_distrib_right` | Int.min_max_distrib_right (a b c : Int) : min (max a b) c = max (min a c) (min b c) |
| `Int.min_self` | Int.min_self (a : Int) : min a a = a |
| `Int.min_self_assoc` | Int.min_self_assoc {m n : Int} : min m (min m n) = min m n |
| `Int.min_self_assoc'` | Int.min_self_assoc' {m n : Int} : min n (min m n) = min n m |
| `Int.neg_add` | Int.neg_add {a b : Int} : -(a + b) = -a + -b |
| `Int.neg_add_bmod_self` | Int.neg_add_bmod_self (a : Nat) (b : Int) : (-↑a + b).bmod a = b.bmod a |
| `Int.neg_add_cancel_left` | Int.neg_add_cancel_left (a b : Int) : -a + (a + b) = b |
| `Int.neg_add_cancel_right` | Int.neg_add_cancel_right (a b : Int) : a + -b + b = a |
| `Int.neg_add_emod_self` | Int.neg_add_emod_self (a b : Int) : (-a + b) % a = b % a |
| `Int.neg_add_fmod_self` | Int.neg_add_fmod_self (a b : Int) : (-a + b).fmod a = b.fmod a |
| `Int.neg_bmod` | Int.neg_bmod {a : Int} {b : Nat} : (-a).bmod b = if ↑b ∣ 2 * a then a.bmod b else -a.bmod b |
| `Int.neg_bmod_self` | Int.neg_bmod_self {a : Nat} : (-↑a).bmod a = 0 |
| `Int.neg_ediv` | Int.neg_ediv {a b : Int} : -a / b = -(a / b) - if b ∣ a then 0 else b.sign |
| `Int.neg_ediv_of_dvd` | Int.neg_ediv_of_dvd {a b : Int} : b ∣ a → -a / b = -(a / b) |
| `Int.neg_ediv_self` | Int.neg_ediv_self (a : Int) (h : a ≠ 0) : -a / a = -1 |
| `Int.neg_emod` | Int.neg_emod {a b : Int} : -a % b = if b ∣ a then 0 else ↑b.natAbs - a % b |
| `Int.neg_emod_eq_sub_emod` | Int.neg_emod_eq_sub_emod {a b : Int} : -a % b = (b - a) % b |
| `Int.neg_emod_self` | Int.neg_emod_self (a : Int) : -a % a = 0 |
| `Int.neg_emod_two` | Int.neg_emod_two (i : Int) : -i % 2 = i % 2 |
| `Int.neg_eq_neg_one_mul` | Int.neg_eq_neg_one_mul (a : Int) : -a = -1 * a |
| `Int.neg_eq_of_add_eq_zero` | Int.neg_eq_of_add_eq_zero {a b : Int} (h : a + b = 0) : -a = b |
| `Int.neg_fdiv` | Int.neg_fdiv {a b : Int} : (-a).fdiv b = -a.fdiv b - if b = 0 ∨ b ∣ a then 0 else 1 |
| `Int.neg_fdiv_neg` | Int.neg_fdiv_neg (a b : Int) : (-a).fdiv (-b) = a.fdiv b |
| `Int.neg_fdiv_of_dvd` | Int.neg_fdiv_of_dvd {a b : Int} : b ∣ a → (-a).fdiv b = -a.fdiv b |
| `Int.neg_fmod_neg` | Int.neg_fmod_neg (a b : Int) : (-a).fmod (-b) = -a.fmod b |
| `Int.neg_fmod_self` | Int.neg_fmod_self (a : Int) : (-a).fmod a = 0 |
| `Int.neg_gcd` | Int.neg_gcd {a b : Int} : (-a).gcd b = a.gcd b |
| `Int.neg_lcm` | Int.neg_lcm {a b : Int} : (-a).lcm b = a.lcm b |
| `Int.neg_max_neg` | Int.neg_max_neg (a b : Int) : max (-a) (-b) = -min a b |
| `Int.neg_min_neg` | Int.neg_min_neg (a b : Int) : min (-a) (-b) = -max a b |
| `Int.neg_mul` | Int.neg_mul (a b : Int) : -a * b = -(a * b) |
| `Int.neg_mul_bmod_left` | Int.neg_mul_bmod_left (a : Int) (b : Nat) : (-(a * ↑b)).bmod b = 0 |
| `Int.neg_mul_bmod_right` | Int.neg_mul_bmod_right (a : Nat) (b : Int) : (-(↑a * b)).bmod a = 0 |
| `Int.neg_mul_comm` | Int.neg_mul_comm (a b : Int) : -a * b = a * -b |
| `Int.neg_mul_emod_left` | Int.neg_mul_emod_left (a b : Int) : -(a * b) % b = 0 |
| `Int.neg_mul_emod_right` | Int.neg_mul_emod_right (a b : Int) : -(a * b) % a = 0 |
| `Int.neg_mul_eq_mul_neg` | Int.neg_mul_eq_mul_neg (a b : Int) : -(a * b) = a * -b |
| `Int.neg_mul_eq_neg_mul` | Int.neg_mul_eq_neg_mul (a b : Int) : -(a * b) = -a * b |
| `Int.neg_mul_fmod_left` | Int.neg_mul_fmod_left (a b : Int) : (-(a * b)).fmod b = 0 |
| `Int.neg_mul_fmod_right` | Int.neg_mul_fmod_right (a b : Int) : (-(a * b)).fmod a = 0 |
| `Int.neg_mul_neg` | Int.neg_mul_neg (a b : Int) : -a * -b = a * b |
| `Int.neg_mul_tmod_left` | Int.neg_mul_tmod_left (a b : Int) : (-(a * b)).tmod b = 0 |
| `Int.neg_mul_tmod_right` | Int.neg_mul_tmod_right (a b : Int) : (-(a * b)).tmod a = 0 |
| `Int.neg_neg` | Int.neg_neg (a : Int) : - -a = a |
| `Int.neg_negSucc` | Int.neg_negSucc (n : Nat) : -Int.negSucc n = ↑(n + 1) |
| `Int.neg_ofNat_succ` | Int.neg_ofNat_succ (n : Nat) : -↑n.succ = Int.negSucc n |
| `Int.neg_ofNat_zero` | Int.neg_ofNat_zero : -↑0 = 0 |
| `Int.neg_one_ediv` | Int.neg_one_ediv (b : Int) : -1 / b = -b.sign |
| `Int.neg_one_mul` | Int.neg_one_mul (a : Int) : -1 * a = -a |
| `Int.neg_pow` | Int.neg_pow {m : Int} {n : Nat} : (-m) ^ n = (-1) ^ (n % 2) * m ^ n |
| `Int.neg_shiftLeft` | Int.neg_shiftLeft (a : Int) (n : Nat) : (-a) <<< n = -a <<< n |
| `Int.neg_sub` | Int.neg_sub (a b : Int) : -(a - b) = b - a |
| `Int.neg_tdiv` | Int.neg_tdiv (a b : Int) : (-a).tdiv b = -a.tdiv b |
| `Int.neg_tdiv_neg` | Int.neg_tdiv_neg (a b : Int) : (-a).tdiv (-b) = a.tdiv b |
| `Int.neg_tdiv_of_dvd` | Int.neg_tdiv_of_dvd {a b : Int} : b ∣ a → (-a).tdiv b = -a.tdiv b |
| `Int.neg_tmod` | Int.neg_tmod (a b : Int) : (-a).tmod b = -a.tmod b |
| `Int.neg_tmod_self` | Int.neg_tmod_self (a : Int) : (-a).tmod a = 0 |
| `Int.neg_zero` | Int.neg_zero : -0 = 0 |

## Int Multiplication / exponentiation (97)

| Lemma | Statement |
|---|---|
| `Int.mul.eq_1` | Int.mul.eq_1 (m_2 n_2 : Nat) : (Int.ofNat m_2).mul (Int.ofNat n_2) = Int.ofNat (m_2 * n_2) |
| `Int.mul.eq_2` | Int.mul.eq_2 (m_2 n_2 : Nat) : (Int.ofNat m_2).mul (Int.negSucc n_2) = Int.negOfNat (m_2 * n_2.succ) |
| `Int.mul.eq_3` | Int.mul.eq_3 (m_2 n_2 : Nat) : (Int.negSucc m_2).mul (Int.ofNat n_2) = Int.negOfNat (m_2.succ * n_2) |
| `Int.mul.eq_4` | Int.mul.eq_4 (m_2 n_2 : Nat) : (Int.negSucc m_2).mul (Int.negSucc n_2) = Int.ofNat (m_2.succ * n_2.succ) |
| `Int.mul_add` | Int.mul_add (a b c : Int) : a * (b + c) = a * b + a * c |
| `Int.mul_add_bmod_self_left` | Int.mul_add_bmod_self_left (a : Nat) (b c : Int) : (↑a * b + c).bmod a = c.bmod a |
| `Int.mul_add_bmod_self_right` | Int.mul_add_bmod_self_right (a : Int) (b : Nat) (c : Int) : (a * ↑b + c).bmod b = c.bmod b |
| `Int.mul_add_ediv_left` | Int.mul_add_ediv_left (b : Int) {a : Int} (c : Int) (H : a ≠ 0) : (a * b + c) / a = b + c / a |
| `Int.mul_add_ediv_right` | Int.mul_add_ediv_right (a c : Int) {b : Int} (H : b ≠ 0) : (a * b + c) / b = a + c / b |
| `Int.mul_add_emod_self_left` | Int.mul_add_emod_self_left (a b c : Int) : (a * b + c) % a = c % a |
| `Int.mul_add_emod_self_right` | Int.mul_add_emod_self_right (a b c : Int) : (a * b + c) % b = c % b |
| `Int.mul_add_fdiv_left` | Int.mul_add_fdiv_left (b : Int) {a : Int} (c : Int) (H : a ≠ 0) : (a * b + c).fdiv a = c.fdiv a + b |
| `Int.mul_add_fdiv_right` | Int.mul_add_fdiv_right (a c : Int) {b : Int} (H : b ≠ 0) : (a * b + c).fdiv b = c.fdiv b + a |
| `Int.mul_add_fmod_self_left` | Int.mul_add_fmod_self_left (a b c : Int) : (a * b + c).fmod a = c.fmod a |
| `Int.mul_add_fmod_self_right` | Int.mul_add_fmod_self_right (a b c : Int) : (a * b + c).fmod b = c.fmod b |
| `Int.mul_assoc` | Int.mul_assoc (a b c : Int) : a * b * c = a * (b * c) |
| `Int.mul_bmod` | Int.mul_bmod (a b : Int) (n : Nat) : (a * b).bmod n = (a.bmod n * b.bmod n).bmod n |
| `Int.mul_bmod_bmod` | Int.mul_bmod_bmod {x y : Int} {n : Nat} : (x * y.bmod n).bmod n = (x * y).bmod n |
| `Int.mul_bmod_left` | Int.mul_bmod_left (a : Int) (b : Nat) : (a * ↑b).bmod b = 0 |
| `Int.mul_bmod_right` | Int.mul_bmod_right (a : Nat) (b : Int) : (↑a * b).bmod a = 0 |
| `Int.mul_comm` | Int.mul_comm (a b : Int) : a * b = b * a |
| `Int.mul_def` | Int.mul_def {a b : Int} : a.mul b = a * b |
| `Int.mul_ediv_add_emod` | Int.mul_ediv_add_emod (a b : Int) : b * (a / b) + a % b = a |
| `Int.mul_ediv_assoc` | Int.mul_ediv_assoc (a : Int) {b c : Int} : c ∣ b → a * b / c = a * (b / c) |
| `Int.mul_ediv_assoc'` | Int.mul_ediv_assoc' (b : Int) {a c : Int} (h : c ∣ a) : a * b / c = a / c * b |
| `Int.mul_ediv_cancel` | Int.mul_ediv_cancel (a : Int) {b : Int} (H : b ≠ 0) : a * b / b = a |
| `Int.mul_ediv_cancel'` | Int.mul_ediv_cancel' {a b : Int} (H : a ∣ b) : a * (b / a) = b |
| `Int.mul_ediv_cancel_left` | Int.mul_ediv_cancel_left {a : Int} (b : Int) (H : a ≠ 0) : a * b / a = b |
| `Int.mul_ediv_cancel_of_dvd` | Int.mul_ediv_cancel_of_dvd {a b : Int} (H : b ∣ a) : b * (a / b) = a |
| `Int.mul_ediv_cancel_of_emod_eq_zero` | Int.mul_ediv_cancel_of_emod_eq_zero {a b : Int} (H : a % b = 0) : b * (a / b) = a |
| `Int.mul_ediv_mul_of_pos` | Int.mul_ediv_mul_of_pos {a : Int} (b c : Int) (H : 0 < a) : a * b / (a * c) = b / c |
| `Int.mul_ediv_mul_of_pos_left` | Int.mul_ediv_mul_of_pos_left (a : Int) {b : Int} (c : Int) (H : 0 < b) : a * b / (c * b) = a / c |
| `Int.mul_ediv_self` | Int.mul_ediv_self (a b : Int) : b * (a / b) = a - a % b |
| `Int.mul_emod` | Int.mul_emod (a b n : Int) : a * b % n = a % n * (b % n) % n |
| `Int.mul_emod_bmod` | Int.mul_emod_bmod {y : Int} (x : Int) (n : Nat) : (y * (x % ↑n)).bmod n = (y * x).bmod n |
| `Int.mul_emod_left` | Int.mul_emod_left (a b : Int) : a * b % b = 0 |
| `Int.mul_emod_mul_of_pos` | Int.mul_emod_mul_of_pos {a : Int} (b c : Int) (H : 0 < a) : a * b % (a * c) = a * (b % c) |
| `Int.mul_emod_right` | Int.mul_emod_right (a b : Int) : a * b % a = 0 |
| `Int.mul_fdiv_add_fmod` | Int.mul_fdiv_add_fmod (a b : Int) : b * a.fdiv b + a.fmod b = a |
| `Int.mul_fdiv_assoc` | Int.mul_fdiv_assoc (a : Int) {b c : Int} : c ∣ b → (a * b).fdiv c = a * b.fdiv c |
| `Int.mul_fdiv_assoc'` | Int.mul_fdiv_assoc' (b : Int) {a c : Int} (h : c ∣ a) : (a * b).fdiv c = a.fdiv c * b |
| `Int.mul_fdiv_cancel` | Int.mul_fdiv_cancel (a : Int) {b : Int} (H : b ≠ 0) : (a * b).fdiv b = a |
| `Int.mul_fdiv_cancel'` | Int.mul_fdiv_cancel' {a b : Int} (H : a ∣ b) : a * b.fdiv a = b |
| `Int.mul_fdiv_cancel_left` | Int.mul_fdiv_cancel_left {a : Int} (b : Int) (H : a ≠ 0) : (a * b).fdiv a = b |
| `Int.mul_fdiv_cancel_of_dvd` | Int.mul_fdiv_cancel_of_dvd {a b : Int} (H : b ∣ a) : b * a.fdiv b = a |
| `Int.mul_fdiv_cancel_of_fmod_eq_zero` | Int.mul_fdiv_cancel_of_fmod_eq_zero {a b : Int} (H : a.fmod b = 0) : b * a.fdiv b = a |
| `Int.mul_fdiv_mul_of_pos` | Int.mul_fdiv_mul_of_pos {a : Int} (b c : Int) (H : 0 < a) : (a * b).fdiv (a * c) = b.fdiv c |
| `Int.mul_fdiv_mul_of_pos_left` | Int.mul_fdiv_mul_of_pos_left (a : Int) {b : Int} (c : Int) (H : 0 < b) : (a * b).fdiv (c * b) = a.fdiv c |
| `Int.mul_fdiv_self` | Int.mul_fdiv_self (a b : Int) : b * a.fdiv b = a - a.fmod b |
| `Int.mul_fmod` | Int.mul_fmod (a b n : Int) : (a * b).fmod n = (a.fmod n * b.fmod n).fmod n |
| `Int.mul_fmod_left` | Int.mul_fmod_left (a b : Int) : (a * b).fmod b = 0 |
| `Int.mul_fmod_mul_of_pos` | Int.mul_fmod_mul_of_pos {a : Int} (b c : Int) (H : 0 < a) : (a * b).fmod (a * c) = a * b.fmod c |
| `Int.mul_fmod_right` | Int.mul_fmod_right (a b : Int) : (a * b).fmod a = 0 |
| `Int.mul_left_comm` | Int.mul_left_comm (a b c : Int) : a * (b * c) = b * (a * c) |
| `Int.mul_neg` | Int.mul_neg (a b : Int) : a * -b = -(a * b) |
| `Int.mul_neg_one` | Int.mul_neg_one (a : Int) : a * -1 = -a |
| `Int.mul_one` | Int.mul_one (a : Int) : a * 1 = a |
| `Int.mul_pow` | Int.mul_pow {a b : Int} {n : Nat} : (a * b) ^ n = a ^ n * b ^ n |
| `Int.mul_right_comm` | Int.mul_right_comm (a b c : Int) : a * b * c = a * c * b |
| `Int.mul_shiftLeft` | Int.mul_shiftLeft (a b : Int) (n : Nat) : a * b <<< n = (a * b) <<< n |
| `Int.mul_sign_self` | Int.mul_sign_self (i : Int) : i * i.sign = ↑i.natAbs |
| `Int.mul_sub` | Int.mul_sub (a b c : Int) : a * (b - c) = a * b - a * c |
| `Int.mul_sub_bmod_self_left` | Int.mul_sub_bmod_self_left (a : Nat) (b c : Int) : (↑a * b - c).bmod a = (-c).bmod a |
| `Int.mul_sub_bmod_self_right` | Int.mul_sub_bmod_self_right (a : Int) (b : Nat) (c : Int) : (a * ↑b - c).bmod b = (-c).bmod b |
| `Int.mul_sub_ediv_left` | Int.mul_sub_ediv_left (b : Int) {a : Int} (c : Int) (H : a ≠ 0) : (a * b - c) / a = b + -c / a |
| `Int.mul_sub_ediv_right` | Int.mul_sub_ediv_right (a c : Int) {b : Int} (H : b ≠ 0) : (a * b - c) / b = a + -c / b |
| `Int.mul_sub_emod_self_left` | Int.mul_sub_emod_self_left (a b c : Int) : (a * b - c) % a = -c % a |
| `Int.mul_sub_emod_self_right` | Int.mul_sub_emod_self_right (a b c : Int) : (a * b - c) % b = -c % b |
| `Int.mul_sub_fdiv_left` | Int.mul_sub_fdiv_left (b : Int) {a : Int} (c : Int) (H : a ≠ 0) : (a * b - c).fdiv a = b + (-c).fdiv a |
| `Int.mul_sub_fdiv_right` | Int.mul_sub_fdiv_right (a c : Int) {b : Int} (H : b ≠ 0) : (a * b - c).fdiv b = a + (-c).fdiv b |
| `Int.mul_sub_fmod_self_left` | Int.mul_sub_fmod_self_left (a b c : Int) : (a * b - c).fmod a = (-c).fmod a |
| `Int.mul_sub_fmod_self_right` | Int.mul_sub_fmod_self_right (a b c : Int) : (a * b - c).fmod b = (-c).fmod b |
| `Int.mul_tdiv_add_tmod` | Int.mul_tdiv_add_tmod (a b : Int) : b * a.tdiv b + a.tmod b = a |
| `Int.mul_tdiv_assoc` | Int.mul_tdiv_assoc (a : Int) {b c : Int} : c ∣ b → (a * b).tdiv c = a * b.tdiv c |
| `Int.mul_tdiv_assoc'` | Int.mul_tdiv_assoc' (b : Int) {a c : Int} (h : c ∣ a) : (a * b).tdiv c = a.tdiv c * b |
| `Int.mul_tdiv_cancel` | Int.mul_tdiv_cancel (a : Int) {b : Int} (H : b ≠ 0) : (a * b).tdiv b = a |
| `Int.mul_tdiv_cancel'` | Int.mul_tdiv_cancel' {a b : Int} (H : a ∣ b) : a * b.tdiv a = b |
| `Int.mul_tdiv_cancel_left` | Int.mul_tdiv_cancel_left {a : Int} (b : Int) (H : a ≠ 0) : (a * b).tdiv a = b |
| `Int.mul_tdiv_cancel_of_dvd` | Int.mul_tdiv_cancel_of_dvd {a b : Int} (H : b ∣ a) : b * a.tdiv b = a |
| `Int.mul_tdiv_cancel_of_tmod_eq_zero` | Int.mul_tdiv_cancel_of_tmod_eq_zero {a b : Int} (H : a.tmod b = 0) : b * a.tdiv b = a |
| `Int.mul_tdiv_mul_of_pos` | Int.mul_tdiv_mul_of_pos {a : Int} (b c : Int) (H : 0 < a) : (a * b).tdiv (a * c) = b.tdiv c |
| `Int.mul_tdiv_mul_of_pos_left` | Int.mul_tdiv_mul_of_pos_left (a : Int) {b : Int} (c : Int) (H : 0 < b) : (a * b).tdiv (c * b) = a.tdiv c |
| `Int.mul_tdiv_self` | Int.mul_tdiv_self (a b : Int) : b * a.tdiv b = a - a.tmod b |
| `Int.mul_tmod` | Int.mul_tmod (a b n : Int) : (a * b).tmod n = (a.tmod n * b.tmod n).tmod n |
| `Int.mul_tmod_left` | Int.mul_tmod_left (a b : Int) : (a * b).tmod b = 0 |
| `Int.mul_tmod_mul_of_pos` | Int.mul_tmod_mul_of_pos {a : Int} (b c : Int) (H : 0 < a) : (a * b).tmod (a * c) = a * b.tmod c |
| `Int.mul_tmod_right` | Int.mul_tmod_right (a b : Int) : (a * b).tmod a = 0 |
| `Int.mul_zero` | Int.mul_zero (a : Int) : a * 0 = 0 |
| `Int.pow_add` | Int.pow_add (a : Int) (m n : Nat) : a ^ (m + n) = a ^ m * a ^ n |
| `Int.pow_gcd_pow` | Int.pow_gcd_pow {n m : Int} {k : Nat} : (n ^ k).gcd (m ^ k) = n.gcd m ^ k |
| `Int.pow_gcd_pow_of_gcd_eq_one` | Int.pow_gcd_pow_of_gcd_eq_one {n m : Int} {k l : Nat} (h : n.gcd m = 1) : (n ^ k).gcd (m ^ l) = 1 |
| `Int.pow_lcm_pow` | Int.pow_lcm_pow {n m : Int} {k : Nat} : (n ^ k).lcm (m ^ k) = n.lcm m ^ k |
| `Int.pow_mul` | Int.pow_mul {a : Int} {n m : Nat} : a ^ (n * m) = (a ^ n) ^ m |
| `Int.pow_one` | Int.pow_one (a : Int) : a ^ 1 = a |
| `Int.pow_succ` | Int.pow_succ (m : Int) (n : Nat) : m ^ n.succ = m ^ n * m |
| `Int.pow_succ'` | Int.pow_succ' (b : Int) (e : Nat) : b ^ (e + 1) = b * b ^ e |
| `Int.pow_zero` | Int.pow_zero (m : Int) : m ^ 0 = 1 |

## Nat other (701)

| Lemma | Statement |
|---|---|
| `Nat.Coprime.eq_1` | Nat.Coprime.eq_1 (m n : Nat) : m.Coprime n = (m.gcd n = 1) |
| `Nat.Coprime.eq_one_of_dvd` | Nat.Coprime.eq_one_of_dvd {k m : Nat} (H : k.Coprime m) (d : k ∣ m) : k = 1 |
| `Nat.Coprime.gcd_eq_one` | Nat.Coprime.gcd_eq_one {m n : Nat} : m.Coprime n → m.gcd n = 1 |
| `Nat.Coprime.gcd_mul` | Nat.Coprime.gcd_mul {m n : Nat} (k : Nat) (h : m.Coprime n) : k.gcd (m * n) = k.gcd m * k.gcd n |
| `Nat.Coprime.gcd_mul_left_cancel` | Nat.Coprime.gcd_mul_left_cancel {k n : Nat} (m : Nat) (H : k.Coprime n) : (k * m).gcd n = m.gcd n |
| `Nat.Coprime.gcd_mul_left_cancel_right` | Nat.Coprime.gcd_mul_left_cancel_right {k m : Nat} (n : Nat) (H : k.Coprime m) : m.gcd (k * n) = m.gcd n |
| `Nat.Coprime.gcd_mul_right_cancel` | Nat.Coprime.gcd_mul_right_cancel {k n : Nat} (m : Nat) (H : k.Coprime n) : (m * k).gcd n = m.gcd n |
| `Nat.Coprime.gcd_mul_right_cancel_right` | Nat.Coprime.gcd_mul_right_cancel_right {k m : Nat} (n : Nat) (H : k.Coprime m) : m.gcd (n * k) = m.gcd n |
| `Nat.Coprime.mul_gcd` | Nat.Coprime.mul_gcd {m n : Nat} (h : m.Coprime n) (k : Nat) : (m * n).gcd k = m.gcd k * n.gcd k |
| `Nat.Internal.Linear.Expr.add.injEq` | Nat.Internal.Linear.Expr.add.injEq (a b a✝ b✝ : Nat.Internal.Linear.Expr) : (a.add b = a✝.add b✝) = (a = a✝ ∧ b = b✝) |
| `Nat.Internal.Linear.Expr.add.sizeOf_spec` | Nat.Internal.Linear.Expr.add.sizeOf_spec (a b : Nat.Internal.Linear.Expr) : sizeOf (a.add b) = 1 + sizeOf a + sizeOf b |
| `Nat.Internal.Linear.Expr.brecOn.eq.{u}` | Nat.Internal.Linear.Expr.brecOn.eq.{u} {motive : Nat.Internal.Linear.Expr → Sort u} (t : Nat.Internal.Linear.Expr) (F_1 Nat.Internal.Linear.Expr.brecOn |
| `Nat.Internal.Linear.Expr.denote_toPoly` | Nat.Internal.Linear.Expr.denote_toPoly (ctx : Nat.Internal.Linear.Context) (e : Nat.Internal.Linear.Expr) : Nat.Internal.Linear.Poly.denote |
| `Nat.Internal.Linear.Expr.denote_toPoly_go` | Nat.Internal.Linear.Expr.denote_toPoly_go {k : Nat} {p : Nat.Internal.Linear.Poly} (ctx : Nat.Internal.Linear.Context) (e Nat.Internal.Linear.Poly.denote k |
| `Nat.Internal.Linear.Expr.eq_of_toNormPoly` | Nat.Internal.Linear.Expr.eq_of_toNormPoly (ctx : Nat.Internal.Linear.Context) (a b : Nat.Internal.Linear.Expr) (h |
| `Nat.Internal.Linear.Expr.eq_of_toNormPoly_eq` | Nat.Internal.Linear.Expr.eq_of_toNormPoly_eq (ctx : Nat.Internal.Linear.Context) (e e' : Nat.Internal.Linear.Expr) (h Nat.Internal.Linear.Expr.denote |
| `Nat.Internal.Linear.Expr.mulL.injEq` | Nat.Internal.Linear.Expr.mulL.injEq (k : Nat) (a : Nat.Internal.Linear.Expr) (k✝ : Nat) (a✝ (Nat.Internal.Linear.Expr.mulL |
| `Nat.Internal.Linear.Expr.mulL.sizeOf_spec` | Nat.Internal.Linear.Expr.mulL.sizeOf_spec (k : Nat) (a : Nat.Internal.Linear.Expr) : sizeOf |
| `Nat.Internal.Linear.Expr.mulR.injEq` | Nat.Internal.Linear.Expr.mulR.injEq (a : Nat.Internal.Linear.Expr) (k : Nat) (a✝ : Nat.Internal.Linear.Expr) (k✝ |
| `Nat.Internal.Linear.Expr.mulR.sizeOf_spec` | Nat.Internal.Linear.Expr.mulR.sizeOf_spec (a : Nat.Internal.Linear.Expr) (k : Nat) : sizeOf |
| `Nat.Internal.Linear.Expr.num.inj` | Nat.Internal.Linear.Expr.num.inj {v v✝ : Nat} : Nat.Internal.Linear.Expr.num |
| `Nat.Internal.Linear.Expr.num.injEq` | Nat.Internal.Linear.Expr.num.injEq (v v✝ : Nat) : (Nat.Internal.Linear.Expr.num |
| `Nat.Internal.Linear.Expr.num.sizeOf_spec` | Nat.Internal.Linear.Expr.num.sizeOf_spec (v : Nat) : sizeOf (Nat.Internal.Linear.Expr.num v) = 1 + sizeOf v |
| `Nat.Internal.Linear.Expr.of_cancel_eq` | Nat.Internal.Linear.Expr.of_cancel_eq (ctx : Nat.Internal.Linear.Context) (a b c d : Nat.Internal.Linear.Expr) (h (Nat.Internal.Linear.Expr.denote (Nat.Internal.Linear.Expr.denote |
| `Nat.Internal.Linear.Expr.of_cancel_le` | Nat.Internal.Linear.Expr.of_cancel_le (ctx : Nat.Internal.Linear.Context) (a b c d : Nat.Internal.Linear.Expr) (h (Nat.Internal.Linear.Expr.denote (Nat.Internal.Linear.Expr.denote |
| `Nat.Internal.Linear.Expr.of_cancel_lt` | Nat.Internal.Linear.Expr.of_cancel_lt (ctx : Nat.Internal.Linear.Context) (a b c d : Nat.Internal.Linear.Expr) (h (Nat.Internal.Linear.Expr.denote (Nat.Internal.Linear.Expr.denote |
| `Nat.Internal.Linear.Expr.toNormPoly.eq_1` | Nat.Internal.Linear.Expr.toNormPoly.eq_1 (e : Nat.Internal.Linear.Expr) : e.toNormPoly = e.toPoly.norm |
| `Nat.Internal.Linear.Expr.toPoly.eq_1` | Nat.Internal.Linear.Expr.toPoly.eq_1 (e : Nat.Internal.Linear.Expr) : e.toPoly |
| `Nat.Internal.Linear.Expr.toPoly.go.eq_1` | Nat.Internal.Linear.Expr.toPoly.go.eq_1 (coeff k : Nat) : Nat.Internal.Linear.Expr.toPoly.go bif |
| `Nat.Internal.Linear.Expr.toPoly.go.eq_2` | Nat.Internal.Linear.Expr.toPoly.go.eq_2 (coeff : Nat) (i : Nat.Internal.Linear.Var) : Nat.Internal.Linear.Expr.toPoly.go |
| `Nat.Internal.Linear.Expr.toPoly.go.eq_3` | Nat.Internal.Linear.Expr.toPoly.go.eq_3 (coeff : Nat) (a b : Nat.Internal.Linear.Expr) : Nat.Internal.Linear.Expr.toPoly.go Nat.Internal.Linear.Expr.toPoly.go |
| `Nat.Internal.Linear.Expr.toPoly.go.eq_4` | Nat.Internal.Linear.Expr.toPoly.go.eq_4 (coeff k : Nat) (a : Nat.Internal.Linear.Expr) : Nat.Internal.Linear.Expr.toPoly.go bif |
| `Nat.Internal.Linear.Expr.toPoly.go.eq_5` | Nat.Internal.Linear.Expr.toPoly.go.eq_5 (coeff : Nat) (a : Nat.Internal.Linear.Expr) (k : Nat) : Nat.Internal.Linear.Expr.toPoly.go bif |
| `Nat.Internal.Linear.Expr.toPoly.go.eq_def` | Nat.Internal.Linear.Expr.toPoly.go.eq_def (coeff : Nat) (a✝ : Nat.Internal.Linear.Expr) : Nat.Internal.Linear.Expr.toPoly.go match \| \| \| \| \| |
| `Nat.Internal.Linear.Expr.var.inj` | Nat.Internal.Linear.Expr.var.inj {i i✝ : Nat.Internal.Linear.Var} : Nat.Internal.Linear.Expr.var |
| `Nat.Internal.Linear.Expr.var.injEq` | Nat.Internal.Linear.Expr.var.injEq (i i✝ : Nat.Internal.Linear.Var) : (Nat.Internal.Linear.Expr.var |
| `Nat.Internal.Linear.Expr.var.sizeOf_spec` | Nat.Internal.Linear.Expr.var.sizeOf_spec (i : Nat.Internal.Linear.Var) : sizeOf |
| `Nat.Internal.Linear.ExprCnstr.denote_toNormPoly` | Nat.Internal.Linear.ExprCnstr.denote_toNormPoly (ctx : Nat.Internal.Linear.Context) (c Nat.Internal.Linear.PolyCnstr.denote |
| `Nat.Internal.Linear.ExprCnstr.denote_toPoly` | Nat.Internal.Linear.ExprCnstr.denote_toPoly (ctx : Nat.Internal.Linear.Context) (c : Nat.Internal.Linear.ExprCnstr) : Nat.Internal.Linear.PolyCnstr.denote |
| `Nat.Internal.Linear.ExprCnstr.eq_false_of_isUnsat` | Nat.Internal.Linear.ExprCnstr.eq_false_of_isUnsat (ctx : Nat.Internal.Linear.Context) (c Nat.Internal.Linear.ExprCnstr.denote |
| `Nat.Internal.Linear.ExprCnstr.eq_of_toNormPoly_eq` | Nat.Internal.Linear.ExprCnstr.eq_of_toNormPoly_eq (ctx : Nat.Internal.Linear.Context) (c Nat.Internal.Linear.ExprCnstr.denote |
| `Nat.Internal.Linear.ExprCnstr.eq_true_of_isValid` | Nat.Internal.Linear.ExprCnstr.eq_true_of_isValid (ctx : Nat.Internal.Linear.Context) (c : Nat.Internal.Linear.ExprCnstr) (h |
| `Nat.Internal.Linear.ExprCnstr.mk.injEq` | Nat.Internal.Linear.ExprCnstr.mk.injEq (eq : Bool) (lhs rhs : Nat.Internal.Linear.Expr) (eq✝ : Bool) (lhs✝ ({ (eq |
| `Nat.Internal.Linear.ExprCnstr.mk.sizeOf_spec` | Nat.Internal.Linear.ExprCnstr.mk.sizeOf_spec (eq : Bool) (lhs rhs : Nat.Internal.Linear.Expr) : sizeOf |
| `Nat.Internal.Linear.ExprCnstr.toNormPoly.eq_1` | Nat.Internal.Linear.ExprCnstr.toNormPoly.eq_1 (c : Nat.Internal.Linear.ExprCnstr) : c.toNormPoly match \| |
| `Nat.Internal.Linear.ExprCnstr.toPoly.eq_1` | Nat.Internal.Linear.ExprCnstr.toPoly.eq_1 (c : Nat.Internal.Linear.ExprCnstr) : c.toPoly |
| `Nat.Internal.Linear.ExprCnstr.toPoly_norm_eq` | Nat.Internal.Linear.ExprCnstr.toPoly_norm_eq (c : Nat.Internal.Linear.ExprCnstr) : c.toPoly.norm = c.toNormPoly |
| `Nat.Internal.Linear.Poly.cancelAux.eq_1` | Nat.Internal.Linear.Poly.cancelAux.eq_1 (m₁ m₂ r₁ r₂ : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.cancelAux |
| `Nat.Internal.Linear.Poly.cancelAux.eq_2` | Nat.Internal.Linear.Poly.cancelAux.eq_2 (m₁ r₁ r₂ : Nat.Internal.Linear.Poly) (fuel_2 : Nat) : Nat.Internal.Linear.Poly.cancelAux |
| `Nat.Internal.Linear.Poly.cancelAux.eq_3` | Nat.Internal.Linear.Poly.cancelAux.eq_3 (m₂ r₁ r₂ : Nat.Internal.Linear.Poly) (fuel_2 : Nat) (x : m₂ = [] → False) : Nat.Internal.Linear.Poly.cancelAux |
| `Nat.Internal.Linear.Poly.cancelAux.eq_4` | Nat.Internal.Linear.Poly.cancelAux.eq_4 (r₁ r₂ : Nat.Internal.Linear.Poly) (fuel_2 k₁ : Nat) (v₁ (m₂_2 Nat.Internal.Linear.Poly.cancelAux bif else bif else bif else bif else |
| `Nat.Internal.Linear.Poly.cancelAux.eq_def` | Nat.Internal.Linear.Poly.cancelAux.eq_def (fuel : Nat) (m₁ m₂ r₁ r₂ : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.cancelAux match \| \| match \| \| \| bif else bif else bif else bif else |
| `Nat.Internal.Linear.Poly.denote_append` | Nat.Internal.Linear.Poly.denote_append (ctx : Nat.Internal.Linear.Context) (p q : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.denote Nat.Internal.Linear.Poly.denote |
| `Nat.Internal.Linear.Poly.denote_cons` | Nat.Internal.Linear.Poly.denote_cons (ctx : Nat.Internal.Linear.Context) (k : Nat) (v : Nat.Internal.Linear.Var) (p Nat.Internal.Linear.Poly.denote k |
| `Nat.Internal.Linear.Poly.denote_eq.eq_1` | Nat.Internal.Linear.Poly.denote_eq.eq_1 (ctx : Nat.Internal.Linear.Context) (mp Nat.Internal.Linear.Poly.denote_eq (Nat.Internal.Linear.Poly.denote |
| `Nat.Internal.Linear.Poly.denote_eq_cancel_eq` | Nat.Internal.Linear.Poly.denote_eq_cancel_eq (ctx : Nat.Internal.Linear.Context) (m₁ m₂ : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.denote_eq |
| `Nat.Internal.Linear.Poly.denote_insert` | Nat.Internal.Linear.Poly.denote_insert (ctx : Nat.Internal.Linear.Context) (k : Nat) (v : Nat.Internal.Linear.Var) (p Nat.Internal.Linear.Poly.denote Nat.Internal.Linear.Poly.denote |
| `Nat.Internal.Linear.Poly.denote_le.eq_1` | Nat.Internal.Linear.Poly.denote_le.eq_1 (ctx : Nat.Internal.Linear.Context) (mp Nat.Internal.Linear.Poly.denote_le (Nat.Internal.Linear.Poly.denote |
| `Nat.Internal.Linear.Poly.denote_le_cancel_eq` | Nat.Internal.Linear.Poly.denote_le_cancel_eq (ctx : Nat.Internal.Linear.Context) (m₁ m₂ : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.denote_le |
| `Nat.Internal.Linear.Poly.denote_norm_go` | Nat.Internal.Linear.Poly.denote_norm_go (ctx : Nat.Internal.Linear.Context) (p r : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.denote Nat.Internal.Linear.Poly.denote |
| `Nat.Internal.Linear.Poly.denote_reverse` | Nat.Internal.Linear.Poly.denote_reverse (ctx : Nat.Internal.Linear.Context) (p : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.denote |
| `Nat.Internal.Linear.Poly.denote_sort` | Nat.Internal.Linear.Poly.denote_sort (ctx : Nat.Internal.Linear.Context) (m : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.denote |
| `Nat.Internal.Linear.Poly.insert.eq_1` | Nat.Internal.Linear.Poly.insert.eq_1 (k : Nat) (v : Nat.Internal.Linear.Var) : Nat.Internal.Linear.Poly.insert |
| `Nat.Internal.Linear.Poly.insert.eq_2` | Nat.Internal.Linear.Poly.insert.eq_2 (k : Nat) (v : Nat.Internal.Linear.Var) (k_1 : Nat) (v_1 : Nat.Internal.Linear.Var) (p_2 Nat.Internal.Linear.Poly.insert bif else |
| `Nat.Internal.Linear.Poly.insert.eq_def` | Nat.Internal.Linear.Poly.insert.eq_def (k : Nat) (v : Nat.Internal.Linear.Var) (p : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.insert match \| \| bif else |
| `Nat.Internal.Linear.Poly.isNonZero.eq_1` | Nat.Internal.Linear.Poly.isNonZero.eq_1 : Nat.Internal.Linear.Poly.isNonZero [] = false |
| `Nat.Internal.Linear.Poly.isNonZero.eq_2` | Nat.Internal.Linear.Poly.isNonZero.eq_2 (k : Nat) (v : Nat.Internal.Linear.Var) (p_2 Nat.Internal.Linear.Poly.isNonZero bif |
| `Nat.Internal.Linear.Poly.isNonZero.eq_def` | Nat.Internal.Linear.Poly.isNonZero.eq_def (p : Nat.Internal.Linear.Poly) : p.isNonZero match \| \| |
| `Nat.Internal.Linear.Poly.isZero.eq_1` | Nat.Internal.Linear.Poly.isZero.eq_1 : Nat.Internal.Linear.Poly.isZero [] = true |
| `Nat.Internal.Linear.Poly.isZero.eq_2` | Nat.Internal.Linear.Poly.isZero.eq_2 (p : Nat.Internal.Linear.Poly) (x_1 : p = [] → False) : p.isZero = false |
| `Nat.Internal.Linear.Poly.norm.eq_1` | Nat.Internal.Linear.Poly.norm.eq_1 (p : Nat.Internal.Linear.Poly) : p.norm = Nat.Internal.Linear.Poly.norm.go p [] |
| `Nat.Internal.Linear.Poly.norm.go.eq_1` | Nat.Internal.Linear.Poly.norm.go.eq_1 (r : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.norm.go [] r = r |
| `Nat.Internal.Linear.Poly.norm.go.eq_2` | Nat.Internal.Linear.Poly.norm.go.eq_2 (r : Nat.Internal.Linear.Poly) (k : Nat) (v : Nat.Internal.Linear.Var) (p_2 Nat.Internal.Linear.Poly.norm.go Nat.Internal.Linear.Poly.norm.go |
| `Nat.Internal.Linear.Poly.norm.go.eq_def` | Nat.Internal.Linear.Poly.norm.go.eq_def (p r : Nat.Internal.Linear.Poly) : Nat.Internal.Linear.Poly.norm.go match \| \| |
| `Nat.Internal.Linear.Poly.of_isZero` | Nat.Internal.Linear.Poly.of_isZero (ctx : Nat.Internal.Linear.Context) {p : Nat.Internal.Linear.Poly} (h |
| `Nat.Internal.Linear.PolyCnstr.eq_false_of_isUnsat` | Nat.Internal.Linear.PolyCnstr.eq_false_of_isUnsat (ctx : Nat.Internal.Linear.Context) {c |
| `Nat.Internal.Linear.PolyCnstr.eq_true_of_isValid` | Nat.Internal.Linear.PolyCnstr.eq_true_of_isValid (ctx : Nat.Internal.Linear.Context) {c |
| `Nat.Internal.Linear.PolyCnstr.isUnsat.eq_1` | Nat.Internal.Linear.PolyCnstr.isUnsat.eq_1 (c : Nat.Internal.Linear.PolyCnstr) : c.isUnsat bif else |
| `Nat.Internal.Linear.PolyCnstr.isValid.eq_1` | Nat.Internal.Linear.PolyCnstr.isValid.eq_1 (c : Nat.Internal.Linear.PolyCnstr) : c.isValid |
| `Nat.Internal.Linear.PolyCnstr.mk.injEq` | Nat.Internal.Linear.PolyCnstr.mk.injEq (eq : Bool) (lhs rhs : Nat.Internal.Linear.Poly) (eq✝ : Bool) (lhs✝ ({ (eq |
| `Nat.Internal.Linear.PolyCnstr.mk.sizeOf_spec` | Nat.Internal.Linear.PolyCnstr.mk.sizeOf_spec (eq : Bool) (lhs rhs : Nat.Internal.Linear.Poly) : sizeOf |
| `Nat.Internal.Linear.instBEqPolyCnstr.beq.eq_1` | Nat.Internal.Linear.instBEqPolyCnstr.beq.eq_1 (a : Bool) (a_1 a_2 : Nat.Internal.Linear.Poly) (b : Bool) (b_1 Nat.Internal.Linear.instBEqPolyCnstr.beq (a |
| `Nat.Internal.Linear.instBEqPolyCnstr.beq.eq_2` | Nat.Internal.Linear.instBEqPolyCnstr.beq.eq_2 (x✝ x✝¹ : Nat.Internal.Linear.PolyCnstr) (x_4 ∀ x✝ Nat.Internal.Linear.instBEqPolyCnstr.beq |
| `Nat.Internal.Linear.instBEqPolyCnstr.beq.eq_def` | Nat.Internal.Linear.instBEqPolyCnstr.beq.eq_def (x✝ x✝¹ : Nat.Internal.Linear.PolyCnstr) : Nat.Internal.Linear.instBEqPolyCnstr.beq match \| \| |
| `Nat.Internal.Linear.instBEqPolyCnstr.beq_spec` | Nat.Internal.Linear.instBEqPolyCnstr.beq_spec (x✝ x✝¹ : Nat.Internal.Linear.PolyCnstr) : (x✝ |
| `Nat.Internal.Linear.instBEqPolyCnstr.beq_spec_1` | Nat.Internal.Linear.instBEqPolyCnstr.beq_spec_1 (a : Bool) (a_1 a_2 : Nat.Internal.Linear.Poly) (b : Bool) (b_1 ({ |
| `Nat.Internal.Linear.instBEqPolyCnstr.beq_spec_2` | Nat.Internal.Linear.instBEqPolyCnstr.beq_spec_2 (x✝ x✝¹ : Nat.Internal.Linear.PolyCnstr) (x_4 ∀ x✝ (x✝ |
| `Nat.Internal.SOM.Expr.add.injEq` | Nat.Internal.SOM.Expr.add.injEq (a b a✝ b✝ : Nat.Internal.SOM.Expr) : (a.add b = a✝.add b✝) = (a = a✝ ∧ b = b✝) |
| `Nat.Internal.SOM.Expr.add.sizeOf_spec` | Nat.Internal.SOM.Expr.add.sizeOf_spec (a b : Nat.Internal.SOM.Expr) : sizeOf (a.add b) = 1 + sizeOf a + sizeOf b |
| `Nat.Internal.SOM.Expr.brecOn.eq.{u}` | Nat.Internal.SOM.Expr.brecOn.eq.{u} {motive : Nat.Internal.SOM.Expr → Sort u} (t : Nat.Internal.SOM.Expr) (F_1 Nat.Internal.SOM.Expr.brecOn |
| `Nat.Internal.SOM.Expr.eq_of_toPoly_eq` | Nat.Internal.SOM.Expr.eq_of_toPoly_eq (ctx : Nat.Internal.Linear.Context) (a b : Nat.Internal.SOM.Expr) (h |
| `Nat.Internal.SOM.Expr.mul.injEq` | Nat.Internal.SOM.Expr.mul.injEq (a b a✝ b✝ : Nat.Internal.SOM.Expr) : (a.mul b = a✝.mul b✝) = (a = a✝ ∧ b = b✝) |
| `Nat.Internal.SOM.Expr.mul.sizeOf_spec` | Nat.Internal.SOM.Expr.mul.sizeOf_spec (a b : Nat.Internal.SOM.Expr) : sizeOf (a.mul b) = 1 + sizeOf a + sizeOf b |
| `Nat.Internal.SOM.Expr.num.inj` | Nat.Internal.SOM.Expr.num.inj {i i✝ : Nat} : Nat.Internal.SOM.Expr.num i = Nat.Internal.SOM.Expr.num i✝ → i = i✝ |
| `Nat.Internal.SOM.Expr.num.injEq` | Nat.Internal.SOM.Expr.num.injEq (i i✝ : Nat) : (Nat.Internal.SOM.Expr.num i = Nat.Internal.SOM.Expr.num i✝) = (i = i✝) |
| `Nat.Internal.SOM.Expr.num.sizeOf_spec` | Nat.Internal.SOM.Expr.num.sizeOf_spec (i : Nat) : sizeOf (Nat.Internal.SOM.Expr.num i) = 1 + sizeOf i |
| `Nat.Internal.SOM.Expr.toPoly_denote` | Nat.Internal.SOM.Expr.toPoly_denote (ctx : Nat.Internal.Linear.Context) (e : Nat.Internal.SOM.Expr) : Nat.Internal.SOM.Poly.denote |
| `Nat.Internal.SOM.Expr.var.inj` | Nat.Internal.SOM.Expr.var.inj {v v✝ : Nat.Internal.Linear.Var} : Nat.Internal.SOM.Expr.var |
| `Nat.Internal.SOM.Expr.var.injEq` | Nat.Internal.SOM.Expr.var.injEq (v v✝ : Nat.Internal.Linear.Var) : (Nat.Internal.SOM.Expr.var |
| `Nat.Internal.SOM.Expr.var.sizeOf_spec` | Nat.Internal.SOM.Expr.var.sizeOf_spec (v : Nat.Internal.Linear.Var) : sizeOf |
| `Nat.Internal.SOM.Mon.append_denote` | Nat.Internal.SOM.Mon.append_denote (ctx : Nat.Internal.Linear.Context) (m₁ m₂ : Nat.Internal.SOM.Mon) : Nat.Internal.SOM.Mon.denote |
| `Nat.Internal.SOM.Mon.mul_denote` | Nat.Internal.SOM.Mon.mul_denote (ctx : Nat.Internal.Linear.Context) (m₁ m₂ : Nat.Internal.SOM.Mon) : Nat.Internal.SOM.Mon.denote |
| `Nat.Internal.SOM.Poly.add_denote` | Nat.Internal.SOM.Poly.add_denote (ctx : Nat.Internal.Linear.Context) (p₁ p₂ : Nat.Internal.SOM.Poly) : Nat.Internal.SOM.Poly.denote Nat.Internal.SOM.Poly.denote |
| `Nat.Internal.SOM.Poly.append_denote` | Nat.Internal.SOM.Poly.append_denote (ctx : Nat.Internal.Linear.Context) (p₁ p₂ : Nat.Internal.SOM.Poly) : Nat.Internal.SOM.Poly.denote Nat.Internal.SOM.Poly.denote |
| `Nat.Internal.SOM.Poly.denote_insertSorted` | Nat.Internal.SOM.Poly.denote_insertSorted (ctx : Nat.Internal.Linear.Context) (k : Nat) (m : Nat.Internal.SOM.Mon) (p Nat.Internal.SOM.Poly.denote Nat.Internal.SOM.Poly.denote |
| `Nat.Internal.SOM.Poly.mulMon_denote` | Nat.Internal.SOM.Poly.mulMon_denote (ctx : Nat.Internal.Linear.Context) (p : Nat.Internal.SOM.Poly) (k : Nat) (m Nat.Internal.SOM.Poly.denote Nat.Internal.SOM.Poly.denote |
| `Nat.Internal.SOM.Poly.mul_denote` | Nat.Internal.SOM.Poly.mul_denote (ctx : Nat.Internal.Linear.Context) (p₁ p₂ : Nat.Internal.SOM.Poly) : Nat.Internal.SOM.Poly.denote Nat.Internal.SOM.Poly.denote |
| `Nat.Simproc.add_eq_add_ge` | Nat.Simproc.add_eq_add_ge (a c : Nat) {b d : Nat} (h : b ≥ d) : (a + b = c + d) = (a + (b - d) = c) |
| `Nat.Simproc.add_eq_add_le` | Nat.Simproc.add_eq_add_le (a c : Nat) {b d : Nat} (h : b ≤ d) : (a + b = c + d) = (a = c + (d - b)) |
| `Nat.Simproc.add_eq_gt` | Nat.Simproc.add_eq_gt (a : Nat) {b c : Nat} (h : b > c) : (a + b = c) = False |
| `Nat.Simproc.add_eq_le` | Nat.Simproc.add_eq_le (a : Nat) {b c : Nat} (h : b ≤ c) : (a + b = c) = (a = c - b) |
| `Nat.Simproc.add_le_add_ge` | Nat.Simproc.add_le_add_ge (a c : Nat) {b d : Nat} (h : b ≥ d) : (a + b ≤ c + d) = (a + (b - d) ≤ c) |
| `Nat.Simproc.add_le_add_le` | Nat.Simproc.add_le_add_le (a c : Nat) {b d : Nat} (h : b ≤ d) : (a + b ≤ c + d) = (a ≤ c + (d - b)) |
| `Nat.Simproc.add_le_gt` | Nat.Simproc.add_le_gt (a : Nat) {b c : Nat} (h : b > c) : (a + b ≤ c) = False |
| `Nat.Simproc.add_le_le` | Nat.Simproc.add_le_le (a : Nat) {b c : Nat} (h : b ≤ c) : (a + b ≤ c) = (a ≤ c - b) |
| `Nat.Simproc.add_sub_add_ge` | Nat.Simproc.add_sub_add_ge (a c : Nat) {b d : Nat} (h : b ≥ d) : a + b - (c + d) = a + (b - d) - c |
| `Nat.Simproc.add_sub_add_le` | Nat.Simproc.add_sub_add_le (a c : Nat) {b d : Nat} (h : b ≤ d) : a + b - (c + d) = a - (c + (d - b)) |
| `Nat.Simproc.add_sub_le` | Nat.Simproc.add_sub_le (a : Nat) {b c : Nat} (h : b ≤ c) : a + b - c = a - (c - b) |
| `Nat.Simproc.beqEqOfEqEq` | Nat.Simproc.beqEqOfEqEq {a b c d : Nat} (p : (a = b) = (c = d)) : (a == b) = (c == d) |
| `Nat.Simproc.beqFalseOfEqFalse` | Nat.Simproc.beqFalseOfEqFalse {a b : Nat} (p : (a = b) = False) : (a == b) = false |
| `Nat.Simproc.bneEqOfEqEq` | Nat.Simproc.bneEqOfEqEq {a b c d : Nat} (p : (a = b) = (c = d)) : (a != b) = (c != d) |
| `Nat.Simproc.bneTrueOfEqFalse` | Nat.Simproc.bneTrueOfEqFalse {a b : Nat} (p : (a = b) = False) : (a != b) = true |
| `Nat.Simproc.eq_add_gt` | Nat.Simproc.eq_add_gt (a : Nat) {b c : Nat} (h : c > a) : (a = b + c) = False |
| `Nat.Simproc.eq_add_le` | Nat.Simproc.eq_add_le {a : Nat} (b : Nat) {c : Nat} (h : c ≤ a) : (a = b + c) = (b = a - c) |
| `Nat.Simproc.le_add_ge` | Nat.Simproc.le_add_ge (a : Nat) {b c : Nat} (h : a ≥ c) : (a ≤ b + c) = (a - c ≤ b) |
| `Nat.Simproc.le_add_le` | Nat.Simproc.le_add_le (a : Nat) {b c : Nat} (h : a ≤ c) : (a ≤ b + c) = True |
| `Nat.Simproc.sub_add_eq_comm` | Nat.Simproc.sub_add_eq_comm (a b c : Nat) : a - (b + c) = a - c - b |
| `Nat.ToInt.add_congr` | Nat.ToInt.add_congr {a b : Nat} {a' b' : Int} (h₁ : ↑a = a') (h₂ : ↑b = b') : ↑(a + b) = a' + b' |
| `Nat.ToInt.div_congr` | Nat.ToInt.div_congr {a b : Nat} {a' b' : Int} (h₁ : ↑a = a') (h₂ : ↑b = b') : ↑(a / b) = a' / b' |
| `Nat.ToInt.eq_eq` | Nat.ToInt.eq_eq {a b : Nat} {a' b' : Int} (h₁ : ↑a = a') (h₂ : ↑b = b') : (a = b) = (a' = b') |
| `Nat.ToInt.finVal` | Nat.ToInt.finVal {n : Nat} {a : Fin n} {a' : Int} (h₁ : ↑a = a') : ↑↑a = a' |
| `Nat.ToInt.le_eq` | Nat.ToInt.le_eq {a b : Nat} {a' b' : Int} (h₁ : ↑a = a') (h₂ : ↑b = b') : (a ≤ b) = (a' ≤ b') |
| `Nat.ToInt.lt_eq` | Nat.ToInt.lt_eq {a b : Nat} {a' b' : Int} (h₁ : ↑a = a') (h₂ : ↑b = b') : (a < b) = (a' < b') |
| `Nat.ToInt.mod_congr` | Nat.ToInt.mod_congr {a b : Nat} {a' b' : Int} (h₁ : ↑a = a') (h₂ : ↑b = b') : ↑(a % b) = a' % b' |
| `Nat.ToInt.mul_congr` | Nat.ToInt.mul_congr {a b : Nat} {a' b' : Int} (h₁ : ↑a = a') (h₂ : ↑b = b') : ↑(a * b) = a' * b' |
| `Nat.ToInt.natCast_ofNat` | Nat.ToInt.natCast_ofNat (n : Nat) : ↑(OfNat.ofNat n) = OfNat.ofNat n |
| `Nat.ToInt.ofNat_toNat` | Nat.ToInt.ofNat_toNat (a : Int) : ↑a.toNat = if a ≤ 0 then 0 else a |
| `Nat.ToInt.of_eq` | Nat.ToInt.of_eq {a b : Nat} {a' b' : Int} (h₁ : ↑a = a') (h₂ : ↑b = b') : a = b → a' = b' |
| `Nat.ToInt.pow_congr` | Nat.ToInt.pow_congr {a : Nat} (k : Nat) (a' : Int) (h₁ : ↑a = a') : ↑(a ^ k) = a' ^ k |
| `Nat.ToInt.sub_congr` | Nat.ToInt.sub_congr {a b : Nat} {a' b' : Int} (h₁ : ↑a = a') (h₂ : ↑b = b') : ↑(a |
| `Nat.all_congr` | Nat.all_congr {n m : Nat} (w : n = m) (f : (i : Nat) → i < n → Bool) : n.all f = m.all fun i h => f i ⋯ |
| `Nat.all_eq_allTR` | Nat.all_eq_allTR : Nat.all = Nat.allTR |
| `Nat.all_eq_finRange_all` | Nat.all_eq_finRange_all {n : Nat} (f : (i : Nat) → i < n → Bool) : n.all (List.finRange match \| |
| `Nat.all_succ` | Nat.all_succ {n : Nat} (f : (i : Nat) → i < n + 1 → Bool) : (n + 1).all f = ((n.all fun i h => f i ⋯) && f n ⋯) |
| `Nat.all_zero` | Nat.all_zero {f : (i : Nat) → i < 0 → Bool} : Nat.all 0 f = true |
| `Nat.and_assoc` | Nat.and_assoc (x y z : Nat) : x &&& y &&& z = x &&& (y &&& z) |
| `Nat.and_comm` | Nat.and_comm (x y : Nat) : x &&& y = y &&& x |
| `Nat.and_div_two` | Nat.and_div_two {a b : Nat} : (a &&& b) / 2 = a / 2 &&& b / 2 |
| `Nat.and_div_two_pow` | Nat.and_div_two_pow {a b n : Nat} : (a &&& b) / 2 ^ n = a / 2 ^ n &&& b / 2 ^ n |
| `Nat.and_mod_two_pow` | Nat.and_mod_two_pow {a b n : Nat} : (a &&& b) % 2 ^ n = a % 2 ^ n &&& b % 2 ^ n |
| `Nat.and_one_is_mod` | Nat.and_one_is_mod (x : Nat) : x &&& 1 = x % 2 |
| `Nat.and_or_distrib_left` | Nat.and_or_distrib_left (x y z : Nat) : x &&& (y \|\|\| z) = x &&& y \|\|\| x &&& z |
| `Nat.and_or_distrib_right` | Nat.and_or_distrib_right (x y z : Nat) : (x \|\|\| y) &&& z = x &&& z \|\|\| y &&& z |
| `Nat.and_self` | Nat.and_self (x : Nat) : x &&& x = x |
| `Nat.and_sub_one_testBit_log2` | Nat.and_sub_one_testBit_log2 {n : Nat} (h : n ≠ 0) (hpow2 : ¬n.isPowerOfTwo) : (n &&& n - 1).testBit n.log2 = true |
| `Nat.and_two_pow_sub_one_eq_mod` | Nat.and_two_pow_sub_one_eq_mod (x n : Nat) : x &&& 2 ^ n - 1 = x % 2 ^ n |
| `Nat.and_two_pow_sub_one_of_lt_two_pow` | Nat.and_two_pow_sub_one_of_lt_two_pow {n x : Nat} (lt : x < 2 ^ n) : x &&& 2 ^ n - 1 = x |
| `Nat.and_xor_distrib_left` | Nat.and_xor_distrib_left {a b c : Nat} : a &&& (b ^^^ c) = a &&& b ^^^ a &&& c |
| `Nat.and_xor_distrib_right` | Nat.and_xor_distrib_right {a b c : Nat} : (a ^^^ b) &&& c = a &&& c ^^^ b &&& c |
| `Nat.and_zero` | Nat.and_zero (x : Nat) : x &&& 0 = 0 |
| `Nat.any_congr` | Nat.any_congr {n m : Nat} (w : n = m) (f : (i : Nat) → i < n → Bool) : n.any f = m.any fun i h => f i ⋯ |
| `Nat.any_eq_anyTR` | Nat.any_eq_anyTR : Nat.any = Nat.anyTR |
| `Nat.any_eq_finRange_any` | Nat.any_eq_finRange_any {n : Nat} (f : (i : Nat) → i < n → Bool) : n.any (List.finRange match \| |
| `Nat.any_succ` | Nat.any_succ {n : Nat} (f : (i : Nat) → i < n + 1 → Bool) : (n + 1).any f = ((n.any fun i h => f i ⋯) \|\| f n ⋯) |
| `Nat.any_zero` | Nat.any_zero {f : (i : Nat) → i < 0 → Bool} : Nat.any 0 f = false |
| `Nat.beq.eq_1` | Nat.beq.eq_1 : Nat.zero.beq Nat.zero = true |
| `Nat.beq.eq_2` | Nat.beq.eq_2 (n : Nat) : Nat.zero.beq n.succ = false |
| `Nat.beq.eq_3` | Nat.beq.eq_3 (n : Nat) : n.succ.beq Nat.zero = false |
| `Nat.beq.eq_4` | Nat.beq.eq_4 (n m : Nat) : n.succ.beq m.succ = n.beq m |
| `Nat.beq.eq_def` | Nat.beq.eq_def (x✝ x✝¹ : Nat) : x✝.beq match \| \| \| \| |
| `Nat.beq_eq` | Nat.beq_eq {x y : Nat} : (x.beq y = true) = (x = y) |
| `Nat.beq_eq_true_eq` | Nat.beq_eq_true_eq (a b : Nat) : ((a == b) = true) = (a = b) |
| `Nat.beq_refl` | Nat.beq_refl (a : Nat) : a.beq a = true |
| `Nat.bitwise_div_two_pow` | Nat.bitwise_div_two_pow {f : Bool → Bool → Bool} {x y n : Nat} (of_false_false : f false false = false := by rfl) : Nat.bitwise |
| `Nat.bitwise_mod_two_pow` | Nat.bitwise_mod_two_pow {f : Bool → Bool → Bool} {x y n : Nat} (of_false_false : f false false = false := by rfl) : Nat.bitwise |
| `Nat.bitwise_mul_two_pow` | Nat.bitwise_mul_two_pow {f : Bool → Bool → Bool} {x y n : Nat} (of_false_false : f false false = false := by rfl) : Nat.bitwise |
| `Nat.ble_eq` | Nat.ble_eq {x y : Nat} : (x.ble y = true) = (x ≤ y) |
| `Nat.ble_eq_true_of_le` | Nat.ble_eq_true_of_le {n m : Nat} (h : n ≤ m) : n.ble m = true |
| `Nat.ble_self_eq_true` | Nat.ble_self_eq_true (n : Nat) : n.ble n = true |
| `Nat.ble_succ_eq_true` | Nat.ble_succ_eq_true {n m : Nat} : n.ble m = true → n.ble m.succ = true |
| `Nat.blt_eq` | Nat.blt_eq {x y : Nat} : (x.blt y = true) = (x < y) |
| `Nat.brecOn.eq.{u}` | Nat.brecOn.eq.{u} {motive : Nat → Sort u} (t : Nat) (F_1 : (t : Nat) → Nat.below t → motive t) : Nat.brecOn |
| `Nat.compare_eq_ite_le` | Nat.compare_eq_ite_le (a b : Nat) : compare |
| `Nat.compare_eq_ite_lt` | Nat.compare_eq_ite_lt (a b : Nat) : compare |
| `Nat.compare_swap` | Nat.compare_swap (a b : Nat) : (compare a b).swap = compare b a |
| `Nat.coprime_one_left_eq_true` | Nat.coprime_one_left_eq_true (n : Nat) : Nat.Coprime 1 n = True |
| `Nat.coprime_one_right_eq_true` | Nat.coprime_one_right_eq_true (n : Nat) : n.Coprime 1 = True |
| `Nat.ctorIdx_succ` | Nat.ctorIdx_succ {n : Nat} : n.succ.ctorIdx = 1 |
| `Nat.ctorIdx_zero` | Nat.ctorIdx_zero : Nat.ctorIdx 0 = 0 |
| `Nat.ctor_eq_zero` | Nat.ctor_eq_zero : Nat.zero = 0 |
| `Nat.decidableBallLT_eq_decidableBallLTTR` | Nat.decidableBallLT_eq_decidableBallLTTR : Nat.decidableBallLT = Nat.decidableBallLTTR |
| `Nat.decidableExistsLT'_eq_decidableExistsLT'TR` | Nat.decidableExistsLT'_eq_decidableExistsLT'TR : @Nat.decidableExistsLT' = @Nat.decidableExistsLT'TR |
| `Nat.decidableExistsLT_eq_decidableExistsLTTR` | Nat.decidableExistsLT_eq_decidableExistsLTTR : @Nat.decidableExistsLT = @Nat.decidableExistsLTTR |
| `Nat.decide_shiftRight_mod_two_eq_one` | Nat.decide_shiftRight_mod_two_eq_one {x i : Nat} : decide (x >>> i % 2 = 1) = x.testBit i |
| `Nat.default_eq_zero` | Nat.default_eq_zero : default = 0 |
| `Nat.dfoldRev_add.{u}` | Nat.dfoldRev_add.{u} {n m : Nat} {α : (i : Nat) → autoParam (i ≤ n + m) Nat.dfoldRev_add._auto_5 → Type u} (f (n |
| `Nat.dfoldRev_congr.{u}` | Nat.dfoldRev_congr.{u} {n m : Nat} (w : n = m) {α : (i : Nat) → autoParam (i ≤ n) Nat.dfoldRev_congr._auto_1 → Type u} (f n.dfoldRev |
| `Nat.dfoldRev_succ.{u}` | Nat.dfoldRev_succ.{u} {n : Nat} {α : (i : Nat) → autoParam (i ≤ n + 1) Nat.dfoldRev_succ._auto_3 → Type u} (f (n |
| `Nat.dfoldRev_zero.{u}` | Nat.dfoldRev_zero.{u} {α : (i : Nat) → autoParam (i ≤ 0) Nat.dfoldRev_zero._auto_1 → Type u} (f Nat.dfoldRev |
| `Nat.dfold_add.{u}` | Nat.dfold_add.{u} {n m : Nat} {α : (i : Nat) → autoParam (i ≤ n + m) Nat.dfold_add._auto_5 → Type u} (f (n |
| `Nat.dfold_congr.{u}` | Nat.dfold_congr.{u} {n m : Nat} (w : n = m) {α : (i : Nat) → autoParam (i ≤ n) Nat.dfold_congr._auto_1 → Type u} (f n.dfold |
| `Nat.dfold_succ.{u}` | Nat.dfold_succ.{u} {n : Nat} {α : (i : Nat) → autoParam (i ≤ n + 1) Nat.dfold_succ._auto_3 → Type u} (f (n |
| `Nat.dfold_zero.{u}` | Nat.dfold_zero.{u} {α : (i : Nat) → autoParam (i ≤ 0) Nat.dfold_zero._auto_1 → Type u} (f |
| `Nat.divExact.congr_simp` | Nat.divExact.congr_simp (x x✝ : Nat) (e_x : x = x✝) (y y✝ : Nat) (e_y : y = y✝) (h : y ∣ x) : x.divExact |
| `Nat.divExact_eq_div` | Nat.divExact_eq_div {x y : Nat} (h : y ∣ x) : x.divExact y h = x / y |
| `Nat.ext_div_mod` | Nat.ext_div_mod {n a b : Nat} (h0 : a / n = b / n) (h1 : a % n = b % n) : a = b |
| `Nat.foldRev_add.{u_1}` | Nat.foldRev_add.{u_1} {α : Type u_1} {n m : Nat} (f : (i : Nat) → i < n + m → α → α) (init : α) : (n |
| `Nat.foldRev_congr.{u}` | Nat.foldRev_congr.{u} {α : Type u} {n m : Nat} (w : n = m) (f : (i : Nat) → i < n → α → α) (init : α) : n.foldRev |
| `Nat.foldRev_eq_finRange_foldr.{u}` | Nat.foldRev_eq_finRange_foldr.{u} {α : Type u} (n : Nat) (f : (i : Nat) → i < n → α → α) (init : α) : n.foldRev List.foldr (fun match \| init |
| `Nat.foldRev_succ.{u}` | Nat.foldRev_succ.{u} {α : Type u} (n : Nat) (f : (i : Nat) → i < n + 1 → α → α) (init : α) : (n |
| `Nat.foldRev_zero.{u}` | Nat.foldRev_zero.{u} {α : Type u} (f : (i : Nat) → i < 0 → α → α) (init : α) : Nat.foldRev 0 f init = init |
| `Nat.fold_add.{u_1}` | Nat.fold_add.{u_1} {α : Type u_1} {n m : Nat} (f : (i : Nat) → i < n + m → α → α) (init : α) : (n |
| `Nat.fold_congr.{u}` | Nat.fold_congr.{u} {α : Type u} {n m : Nat} (w : n = m) (f : (i : Nat) → i < n → α → α) (init : α) : n.fold |
| `Nat.fold_eq_finRange_foldl.{u}` | Nat.fold_eq_finRange_foldl.{u} {α : Type u} (n : Nat) (f : (i : Nat) → i < n → α → α) (init : α) : n.fold List.foldl (fun match \| init |
| `Nat.fold_eq_foldTR.{u_1}` | Nat.fold_eq_foldTR.{u_1} : @Nat.fold = @Nat.foldTR |
| `Nat.fold_succ.{u}` | Nat.fold_succ.{u} {α : Type u} (n : Nat) (f : (i : Nat) → i < n + 1 → α → α) (init : α) : (n |
| `Nat.fold_zero.{u}` | Nat.fold_zero.{u} {α : Type u} (f : (i : Nat) → i < 0 → α → α) (init : α) : Nat.fold 0 f init = init |
| `Nat.getD_toArray_rcc` | Nat.getD_toArray_rcc {m n i fallback : Nat} : (m...=n).toArray.getD |
| `Nat.getD_toArray_rcc_eq_add` | Nat.getD_toArray_rcc_eq_add {m n i fallback : Nat} (h : i < n + 1 - m) : (m...=n).toArray.getD i fallback = m + i |
| `Nat.getD_toArray_rcc_eq_fallback` | Nat.getD_toArray_rcc_eq_fallback {m n i fallback : Nat} (h : n + 1 ≤ i + m) : (m...=n).toArray.getD |
| `Nat.getD_toArray_rco` | Nat.getD_toArray_rco {m n i fallback : Nat} : (m...n).toArray.getD i fallback = if i < n - m then m + i else fallback |
| `Nat.getD_toArray_rco_eq_add` | Nat.getD_toArray_rco_eq_add {m n i fallback : Nat} (h : i < n - m) : (m...n).toArray.getD i fallback = m + i |
| `Nat.getD_toArray_rco_eq_fallback` | Nat.getD_toArray_rco_eq_fallback {m n i fallback : Nat} (h : n ≤ i + m) : (m...n).toArray.getD i fallback = fallback |
| `Nat.getD_toArray_ric` | Nat.getD_toArray_ric {n i fallback : Nat} : (*...=n).toArray.getD i fallback = if i ≤ n then i else fallback |
| `Nat.getD_toArray_ric_eq_fallback` | Nat.getD_toArray_ric_eq_fallback {n i fallback : Nat} (h : n < i) : (*...=n).toArray.getD i fallback = fallback |
| `Nat.getD_toArray_ric_eq_self` | Nat.getD_toArray_ric_eq_self {n i fallback : Nat} (h : i ≤ n) : (*...=n).toArray.getD i fallback = i |
| `Nat.getD_toArray_rio` | Nat.getD_toArray_rio {n i fallback : Nat} : (*...n).toArray.getD i fallback = if i < n then i else fallback |
| `Nat.getD_toArray_rio_eq_fallback` | Nat.getD_toArray_rio_eq_fallback {n i fallback : Nat} (h : n ≤ i) : (*...n).toArray.getD i fallback = fallback |
| `Nat.getD_toArray_rio_eq_self` | Nat.getD_toArray_rio_eq_self {n i fallback : Nat} (h : i < n) : (*...n).toArray.getD i fallback = i |
| `Nat.getD_toArray_roc` | Nat.getD_toArray_roc {m n i fallback : Nat} : (m<...=n).toArray.getD |
| `Nat.getD_toArray_roc_eq_add` | Nat.getD_toArray_roc_eq_add {m n i fallback : Nat} (h : i < n - m) : (m<...=n).toArray.getD i fallback = m + 1 + i |
| `Nat.getD_toArray_roc_eq_fallback` | Nat.getD_toArray_roc_eq_fallback {m n i fallback : Nat} (h : n ≤ i + m) : (m<...=n).toArray.getD i fallback = fallback |
| `Nat.getD_toArray_roo` | Nat.getD_toArray_roo {m n i fallback : Nat} : (m<...n).toArray.getD |
| `Nat.getD_toArray_roo_eq_add` | Nat.getD_toArray_roo_eq_add {m n i fallback : Nat} (h : i < n - (m + 1)) : (m<...n).toArray.getD i fallback = m + 1 + i |
| `Nat.getD_toArray_roo_eq_fallback` | Nat.getD_toArray_roo_eq_fallback {m n i fallback : Nat} (h : n ≤ i + (m + 1)) : (m<...n).toArray.getD |
| `Nat.getD_toList_rcc` | Nat.getD_toList_rcc {m n i fallback : Nat} : (m...=n).toList.getD i fallback = if i < n + 1 - m then m + i else fallback |
| `Nat.getD_toList_rcc_eq_add` | Nat.getD_toList_rcc_eq_add {m n i fallback : Nat} (h : i < n + 1 - m) : (m...=n).toList.getD i fallback = m + i |
| `Nat.getD_toList_rcc_eq_fallback` | Nat.getD_toList_rcc_eq_fallback {m n i fallback : Nat} (h : n + 1 ≤ i + m) : (m...=n).toList.getD i fallback = fallback |
| `Nat.getD_toList_rco` | Nat.getD_toList_rco {m n i fallback : Nat} : (m...n).toList.getD i fallback = if i < n - m then m + i else fallback |
| `Nat.getD_toList_rco_eq_add` | Nat.getD_toList_rco_eq_add {m n i fallback : Nat} (h : i < n - m) : (m...n).toList.getD i fallback = m + i |
| `Nat.getD_toList_rco_eq_fallback` | Nat.getD_toList_rco_eq_fallback {m n i fallback : Nat} (h : n ≤ i + m) : (m...n).toList.getD i fallback = fallback |
| `Nat.getD_toList_ric` | Nat.getD_toList_ric {n i fallback : Nat} : (*...=n).toList.getD i fallback = if i ≤ n then i else fallback |
| `Nat.getD_toList_ric_eq_fallback` | Nat.getD_toList_ric_eq_fallback {n i fallback : Nat} (h : n < i) : (*...=n).toList.getD i fallback = fallback |
| `Nat.getD_toList_ric_eq_self` | Nat.getD_toList_ric_eq_self {n i fallback : Nat} (h : i ≤ n) : (*...=n).toList.getD i fallback = i |
| `Nat.getD_toList_rio` | Nat.getD_toList_rio {n i fallback : Nat} : (*...n).toList.getD i fallback = if i < n then i else fallback |
| `Nat.getD_toList_rio_eq_fallback` | Nat.getD_toList_rio_eq_fallback {n i fallback : Nat} (h : n ≤ i) : (*...n).toList.getD i fallback = fallback |
| `Nat.getD_toList_rio_eq_self` | Nat.getD_toList_rio_eq_self {n i fallback : Nat} (h : i < n) : (*...n).toList.getD i fallback = i |
| `Nat.getD_toList_roc` | Nat.getD_toList_roc {m n i fallback : Nat} : (m<...=n).toList.getD |
| `Nat.getD_toList_roc_eq_add` | Nat.getD_toList_roc_eq_add {m n i fallback : Nat} (h : i < n - m) : (m<...=n).toList.getD i fallback = m + 1 + i |
| `Nat.getD_toList_roc_eq_fallback` | Nat.getD_toList_roc_eq_fallback {m n i fallback : Nat} (h : n ≤ i + m) : (m<...=n).toList.getD i fallback = fallback |
| `Nat.getD_toList_roo` | Nat.getD_toList_roo {m n i fallback : Nat} : (m<...n).toList.getD |
| `Nat.getD_toList_roo_eq_add` | Nat.getD_toList_roo_eq_add {m n i fallback : Nat} (h : i < n - (m + 1)) : (m<...n).toList.getD i fallback = m + 1 + i |
| `Nat.getD_toList_roo_eq_fallback` | Nat.getD_toList_roo_eq_fallback {m n i fallback : Nat} (h : n ≤ i + (m + 1)) : (m<...n).toList.getD |
| `Nat.getElem!_toArray_rcc` | Nat.getElem!_toArray_rcc {m n i : Nat} : (m...=n).toArray[i]! = if i < n + 1 - m then m + i else 0 |
| `Nat.getElem!_toArray_rcc_eq_add` | Nat.getElem!_toArray_rcc_eq_add {m n i : Nat} (h : i < n + 1 - m) : (m...=n).toArray[i]! = m + i |
| `Nat.getElem!_toArray_rcc_eq_zero` | Nat.getElem!_toArray_rcc_eq_zero {m n i : Nat} (h : n + 1 ≤ i + m) : (m...=n).toArray[i]! = 0 |
| `Nat.getElem!_toArray_rco` | Nat.getElem!_toArray_rco {m n i : Nat} : (m...n).toArray[i]! = if i < n - m then m + i else 0 |
| `Nat.getElem!_toArray_rco_eq_add` | Nat.getElem!_toArray_rco_eq_add {m n i : Nat} (h : i < n - m) : (m...n).toArray[i]! = m + i |
| `Nat.getElem!_toArray_rco_eq_zero` | Nat.getElem!_toArray_rco_eq_zero {m n i : Nat} (h : n ≤ i + m) : (m...n).toArray[i]! = 0 |
| `Nat.getElem!_toArray_ric` | Nat.getElem!_toArray_ric {n i : Nat} : (*...=n).toArray[i]! = if i ≤ n then i else 0 |
| `Nat.getElem!_toArray_ric_eq_self` | Nat.getElem!_toArray_ric_eq_self {n i : Nat} (h : i ≤ n) : (*...=n).toArray[i]! = i |
| `Nat.getElem!_toArray_ric_eq_zero` | Nat.getElem!_toArray_ric_eq_zero {n i : Nat} (h : n < i) : (*...=n).toArray[i]! = 0 |
| `Nat.getElem!_toArray_rio` | Nat.getElem!_toArray_rio {n i : Nat} : (*...n).toArray[i]! = if i < n then i else 0 |
| `Nat.getElem!_toArray_rio_eq_self` | Nat.getElem!_toArray_rio_eq_self {n i : Nat} (h : i < n) : (*...n).toArray[i]! = i |
| `Nat.getElem!_toArray_rio_eq_zero` | Nat.getElem!_toArray_rio_eq_zero {n i : Nat} (h : n ≤ i) : (*...n).toArray[i]! = 0 |
| `Nat.getElem!_toArray_roc` | Nat.getElem!_toArray_roc {m n i : Nat} : (m<...=n).toArray[i]! = if i < n - m then m + 1 + i else 0 |
| `Nat.getElem!_toArray_roc_eq_add` | Nat.getElem!_toArray_roc_eq_add {m n i : Nat} (h : i < n - m) : (m<...=n).toArray[i]! = m + 1 + i |
| `Nat.getElem!_toArray_roc_eq_zero` | Nat.getElem!_toArray_roc_eq_zero {m n i : Nat} (h : n ≤ i + m) : (m<...=n).toArray[i]! = 0 |
| `Nat.getElem!_toArray_roo` | Nat.getElem!_toArray_roo {m n i : Nat} : (m<...n).toArray[i]! = if i < n - (m + 1) then m + 1 + i else 0 |
| `Nat.getElem!_toArray_roo_eq_add` | Nat.getElem!_toArray_roo_eq_add {m n i : Nat} (h : i < n - (m + 1)) : (m<...n).toArray[i]! = m + 1 + i |
| `Nat.getElem!_toArray_roo_eq_zero` | Nat.getElem!_toArray_roo_eq_zero {m n i : Nat} (h : n ≤ i + (m + 1)) : (m<...n).toArray[i]! = 0 |
| `Nat.getElem!_toList_rcc` | Nat.getElem!_toList_rcc {m n i : Nat} : (m...=n).toList[i]! = if i < n + 1 - m then m + i else 0 |
| `Nat.getElem!_toList_rcc_eq_add` | Nat.getElem!_toList_rcc_eq_add {m n i : Nat} (h : i < n + 1 - m) : (m...=n).toList[i]! = m + i |
| `Nat.getElem!_toList_rcc_eq_zero` | Nat.getElem!_toList_rcc_eq_zero {m n i : Nat} (h : n + 1 ≤ i + m) : (m...=n).toList[i]! = 0 |
| `Nat.getElem!_toList_rco` | Nat.getElem!_toList_rco {m n i : Nat} : (m...n).toList[i]! = if i < n - m then m + i else 0 |
| `Nat.getElem!_toList_rco_eq_add` | Nat.getElem!_toList_rco_eq_add {m n i : Nat} (h : i < n - m) : (m...n).toList[i]! = m + i |
| `Nat.getElem!_toList_rco_eq_zero` | Nat.getElem!_toList_rco_eq_zero {m n i : Nat} (h : n ≤ i + m) : (m...n).toList[i]! = 0 |
| `Nat.getElem!_toList_ric` | Nat.getElem!_toList_ric {n i : Nat} : (*...=n).toList[i]! = if i ≤ n then i else 0 |
| `Nat.getElem!_toList_ric_eq_self` | Nat.getElem!_toList_ric_eq_self {n i : Nat} (h : i ≤ n) : (*...=n).toList[i]! = i |
| `Nat.getElem!_toList_ric_eq_zero` | Nat.getElem!_toList_ric_eq_zero {n i : Nat} (h : n < i) : (*...=n).toList[i]! = 0 |
| `Nat.getElem!_toList_rio` | Nat.getElem!_toList_rio {n i : Nat} : (*...n).toList[i]! = if i < n then i else 0 |
| `Nat.getElem!_toList_rio_eq_self` | Nat.getElem!_toList_rio_eq_self {n i : Nat} (h : i < n) : (*...n).toList[i]! = i |
| `Nat.getElem!_toList_rio_eq_zero` | Nat.getElem!_toList_rio_eq_zero {n i : Nat} (h : n ≤ i) : (*...n).toList[i]! = 0 |
| `Nat.getElem!_toList_roc` | Nat.getElem!_toList_roc {m n i : Nat} : (m<...=n).toList[i]! = if i < n - m then m + 1 + i else 0 |
| `Nat.getElem!_toList_roc_eq_add` | Nat.getElem!_toList_roc_eq_add {m n i : Nat} (h : i < n - m) : (m<...=n).toList[i]! = m + 1 + i |
| `Nat.getElem!_toList_roc_eq_zero` | Nat.getElem!_toList_roc_eq_zero {m n i : Nat} (h : n ≤ i + m) : (m<...=n).toList[i]! = 0 |
| `Nat.getElem!_toList_roo` | Nat.getElem!_toList_roo {m n i : Nat} : (m<...n).toList[i]! = if i < n - (m + 1) then m + 1 + i else 0 |
| `Nat.getElem!_toList_roo_eq_add` | Nat.getElem!_toList_roo_eq_add {m n i : Nat} (h : i < n - (m + 1)) : (m<...n).toList[i]! = m + 1 + i |
| `Nat.getElem!_toList_roo_eq_zero` | Nat.getElem!_toList_roo_eq_zero {m n i : Nat} (h : n ≤ i + (m + 1)) : (m<...n).toList[i]! = 0 |
| `Nat.getElem?_toArray_rcc` | Nat.getElem?_toArray_rcc {m n i : Nat} : (m...=n).toArray[i]? = if i < n + 1 - m then some (m + i) else none |
| `Nat.getElem?_toArray_rcc_eq_none` | Nat.getElem?_toArray_rcc_eq_none {m n i : Nat} (h : n + 1 ≤ i + m) : (m...=n).toArray[i]? = none |
| `Nat.getElem?_toArray_rcc_eq_some` | Nat.getElem?_toArray_rcc_eq_some {m n i : Nat} (h : i < n + 1 - m) : (m...=n).toArray[i]? = some (m + i) |
| `Nat.getElem?_toArray_rco` | Nat.getElem?_toArray_rco {m n i : Nat} : (m...n).toArray[i]? = if i < n - m then some (m + i) else none |
| `Nat.getElem?_toArray_rco_eq_none` | Nat.getElem?_toArray_rco_eq_none {m n i : Nat} (h : n ≤ i + m) : (m...n).toArray[i]? = none |
| `Nat.getElem?_toArray_rco_eq_some` | Nat.getElem?_toArray_rco_eq_some {m n i : Nat} (h : i < n - m) : (m...n).toArray[i]? = some (m + i) |
| `Nat.getElem?_toArray_ric` | Nat.getElem?_toArray_ric {n i : Nat} : (*...=n).toArray[i]? = if i ≤ n then some i else none |
| `Nat.getElem?_toArray_ric_eq_none` | Nat.getElem?_toArray_ric_eq_none {n i : Nat} (h : n < i) : (*...=n).toArray[i]? = none |
| `Nat.getElem?_toArray_ric_eq_some` | Nat.getElem?_toArray_ric_eq_some {n i : Nat} (h : i ≤ n) : (*...=n).toArray[i]? = some i |
| `Nat.getElem?_toArray_rio` | Nat.getElem?_toArray_rio {n i : Nat} : (*...n).toArray[i]? = if i < n then some i else none |
| `Nat.getElem?_toArray_rio_eq_none` | Nat.getElem?_toArray_rio_eq_none {n i : Nat} (h : n ≤ i) : (*...n).toArray[i]? = none |
| `Nat.getElem?_toArray_rio_eq_some` | Nat.getElem?_toArray_rio_eq_some {n i : Nat} (h : i < n) : (*...n).toArray[i]? = some i |
| `Nat.getElem?_toArray_roc` | Nat.getElem?_toArray_roc {m n i : Nat} : (m<...=n).toArray[i]? = if i < n - m then some (m + 1 + i) else none |
| `Nat.getElem?_toArray_roc_eq_none` | Nat.getElem?_toArray_roc_eq_none {m n i : Nat} (h : n ≤ i + m) : (m<...=n).toArray[i]? = none |
| `Nat.getElem?_toArray_roc_eq_some` | Nat.getElem?_toArray_roc_eq_some {m n i : Nat} (h : i < n - m) : (m<...=n).toArray[i]? = some (m + 1 + i) |
| `Nat.getElem?_toArray_roo` | Nat.getElem?_toArray_roo {m n i : Nat} : (m<...n).toArray[i]? = if i < n - (m + 1) then some (m + 1 + i) else none |
| `Nat.getElem?_toArray_roo_eq_none` | Nat.getElem?_toArray_roo_eq_none {m n i : Nat} (h : n ≤ i + (m + 1)) : (m<...n).toArray[i]? = none |
| `Nat.getElem?_toArray_roo_eq_some` | Nat.getElem?_toArray_roo_eq_some {m n i : Nat} (h : i < n - (m + 1)) : (m<...n).toArray[i]? = some (m + 1 + i) |
| `Nat.getElem?_toList_rcc` | Nat.getElem?_toList_rcc {m n i : Nat} : (m...=n).toList[i]? = if i < n + 1 - m then some (m + i) else none |
| `Nat.getElem?_toList_rcc_eq_none` | Nat.getElem?_toList_rcc_eq_none {m n i : Nat} (h : n + 1 ≤ i + m) : (m...=n).toList[i]? = none |
| `Nat.getElem?_toList_rcc_eq_some` | Nat.getElem?_toList_rcc_eq_some {m n i : Nat} (h : i < n + 1 - m) : (m...=n).toList[i]? = some (m + i) |
| `Nat.getElem?_toList_rco` | Nat.getElem?_toList_rco {m n i : Nat} : (m...n).toList[i]? = if i < n - m then some (m + i) else none |
| `Nat.getElem?_toList_rco_eq_none` | Nat.getElem?_toList_rco_eq_none {m n i : Nat} (h : n ≤ i + m) : (m...n).toList[i]? = none |
| `Nat.getElem?_toList_rco_eq_some` | Nat.getElem?_toList_rco_eq_some {m n i : Nat} (h : i < n - m) : (m...n).toList[i]? = some (m + i) |
| `Nat.getElem?_toList_ric` | Nat.getElem?_toList_ric {n i : Nat} : (*...=n).toList[i]? = if i ≤ n then some i else none |
| `Nat.getElem?_toList_ric_eq_none` | Nat.getElem?_toList_ric_eq_none {n i : Nat} (h : n < i) : (*...=n).toList[i]? = none |
| `Nat.getElem?_toList_ric_eq_some` | Nat.getElem?_toList_ric_eq_some {n i : Nat} (h : i ≤ n) : (*...=n).toList[i]? = some i |
| `Nat.getElem?_toList_rio` | Nat.getElem?_toList_rio {n i : Nat} : (*...n).toList[i]? = if i < n then some i else none |
| `Nat.getElem?_toList_rio_eq_none` | Nat.getElem?_toList_rio_eq_none {n i : Nat} (h : n ≤ i) : (*...n).toList[i]? = none |
| `Nat.getElem?_toList_rio_eq_some` | Nat.getElem?_toList_rio_eq_some {n i : Nat} (h : i < n) : (*...n).toList[i]? = some i |
| `Nat.getElem?_toList_roc` | Nat.getElem?_toList_roc {m n i : Nat} : (m<...=n).toList[i]? = if i < n - m then some (m + 1 + i) else none |
| `Nat.getElem?_toList_roc_eq_none` | Nat.getElem?_toList_roc_eq_none {m n i : Nat} (h : n ≤ i + m) : (m<...=n).toList[i]? = none |
| `Nat.getElem?_toList_roc_eq_some` | Nat.getElem?_toList_roc_eq_some {m n i : Nat} (h : i < n - m) : (m<...=n).toList[i]? = some (m + 1 + i) |
| `Nat.getElem?_toList_roo` | Nat.getElem?_toList_roo {m n i : Nat} : (m<...n).toList[i]? = if i < n - (m + 1) then some (m + 1 + i) else none |
| `Nat.getElem?_toList_roo_eq_none` | Nat.getElem?_toList_roo_eq_none {m n i : Nat} (h : n ≤ i + (m + 1)) : (m<...n).toList[i]? = none |
| `Nat.getElem?_toList_roo_eq_some` | Nat.getElem?_toList_roo_eq_some {m n i : Nat} (h : i < n - (m + 1)) : (m<...n).toList[i]? = some (m + 1 + i) |
| `Nat.getElem_toArray_rcc` | Nat.getElem_toArray_rcc {m n i : Nat} (_h : i < (m...=n).toArray.size) : (m...=n).toArray[i] = m + i |
| `Nat.getElem_toArray_rco` | Nat.getElem_toArray_rco {m n i : Nat} (_h : i < (m...n).toArray.size) : (m...n).toArray[i] = m + i |
| `Nat.getElem_toArray_ric` | Nat.getElem_toArray_ric {n i : Nat} (_h : i < (*...=n).toArray.size) : (*...=n).toArray[i] = i |
| `Nat.getElem_toArray_rio` | Nat.getElem_toArray_rio {n i : Nat} (_h : i < (*...n).toArray.size) : (*...n).toArray[i] = i |
| `Nat.getElem_toArray_roc` | Nat.getElem_toArray_roc {m n i : Nat} (_h : i < (m<...=n).toArray.size) : (m<...=n).toArray[i] = m + 1 + i |
| `Nat.getElem_toArray_roo` | Nat.getElem_toArray_roo {m n i : Nat} (_h : i < (m<...n).toArray.size) : (m<...n).toArray[i] = m + 1 + i |
| `Nat.getElem_toList_rcc` | Nat.getElem_toList_rcc {m n i : Nat} (_h : i < (m...=n).toList.length) : (m...=n).toList[i] = m + i |
| `Nat.getElem_toList_rco` | Nat.getElem_toList_rco {m n i : Nat} (_h : i < (m...n).toList.length) : (m...n).toList[i] = m + i |
| `Nat.getElem_toList_ric` | Nat.getElem_toList_ric {n i : Nat} (_h : i < (*...=n).toList.length) : (*...=n).toList[i] = i |
| `Nat.getElem_toList_rio` | Nat.getElem_toList_rio {n i : Nat} (_h : i < (*...n).toList.length) : (*...n).toList[i] = i |
| `Nat.getElem_toList_roc` | Nat.getElem_toList_roc {m n i : Nat} (_h : i < (m<...=n).toList.length) : (m<...=n).toList[i] = m + 1 + i |
| `Nat.getElem_toList_roo` | Nat.getElem_toList_roo {m n i : Nat} (_h : i < (m<...n).toList.length) : (m<...n).toList[i] = m + 1 + i |
| `Nat.hasNotBit_eq` | Nat.hasNotBit_eq (m n : Nat) : m.hasNotBit n = (1 &&& m >>> n ≠ 1) |
| `Nat.isDigit_digitChar` | Nat.isDigit_digitChar {n : Nat} : n.digitChar.isDigit = decide (n < 10) |
| `Nat.isDigit_of_mem_toDigits` | Nat.isDigit_of_mem_toDigits {b n : Nat} {c : Char} (hb₁ : 0 < b) (hb₂ : b ≤ 10) (hc : c ∈ b.toDigits n) : c.isDigit |
| `Nat.isNone_getElem?_toArray_rcc_eq` | Nat.isNone_getElem?_toArray_rcc_eq {m n i : Nat} : ((m...=n).toArray[i]?.isNone = true) = (n + 1 ≤ i + m) |
| `Nat.isNone_getElem?_toArray_rco_eq` | Nat.isNone_getElem?_toArray_rco_eq {m n i : Nat} : ((m...n).toArray[i]?.isNone = true) = (n ≤ i + m) |
| `Nat.isNone_getElem?_toArray_ric_eq` | Nat.isNone_getElem?_toArray_ric_eq {n i : Nat} : ((*...=n).toArray[i]?.isNone = true) = (n < i) |
| `Nat.isNone_getElem?_toArray_rio_eq` | Nat.isNone_getElem?_toArray_rio_eq {n i : Nat} : ((*...n).toArray[i]?.isNone = true) = (n ≤ i) |
| `Nat.isNone_getElem?_toArray_roc_eq` | Nat.isNone_getElem?_toArray_roc_eq {m n i : Nat} : ((m<...=n).toArray[i]?.isNone = true) = (n ≤ i + m) |
| `Nat.isNone_getElem?_toArray_roo_eq` | Nat.isNone_getElem?_toArray_roo_eq {m n i : Nat} : ((m<...n).toArray[i]?.isNone = true) = (n ≤ i + (m + 1)) |
| `Nat.isNone_getElem?_toList_rcc_eq` | Nat.isNone_getElem?_toList_rcc_eq {m n i : Nat} : ((m...=n).toList[i]?.isNone = true) = (n + 1 ≤ i + m) |
| `Nat.isNone_getElem?_toList_rco_eq` | Nat.isNone_getElem?_toList_rco_eq {m n i : Nat} : ((m...n).toList[i]?.isNone = true) = (n ≤ i + m) |
| `Nat.isNone_getElem?_toList_ric_eq` | Nat.isNone_getElem?_toList_ric_eq {n i : Nat} : ((*...=n).toList[i]?.isNone = true) = (n < i) |
| `Nat.isNone_getElem?_toList_rio_eq` | Nat.isNone_getElem?_toList_rio_eq {n i : Nat} : ((*...n).toList[i]?.isNone = true) = (n ≤ i) |
| `Nat.isNone_getElem?_toList_roc_eq` | Nat.isNone_getElem?_toList_roc_eq {m n i : Nat} : ((m<...=n).toList[i]?.isNone = true) = (n ≤ i + m) |
| `Nat.isNone_getElem?_toList_roo_eq` | Nat.isNone_getElem?_toList_roo_eq {m n i : Nat} : ((m<...n).toList[i]?.isNone = true) = (n ≤ i + (m + 1)) |
| `Nat.isSome_getElem?_toArray_rcc_eq` | Nat.isSome_getElem?_toArray_rcc_eq {m n i : Nat} : ((m...=n).toArray[i]?.isSome = true) = (i < n + 1 - m) |
| `Nat.isSome_getElem?_toArray_rco_eq` | Nat.isSome_getElem?_toArray_rco_eq {m n i : Nat} : ((m...n).toArray[i]?.isSome = true) = (i < n - m) |
| `Nat.isSome_getElem?_toArray_ric_eq` | Nat.isSome_getElem?_toArray_ric_eq {n i : Nat} : ((*...=n).toArray[i]?.isSome = true) = (i ≤ n) |
| `Nat.isSome_getElem?_toArray_rio_eq` | Nat.isSome_getElem?_toArray_rio_eq {n i : Nat} : ((*...n).toArray[i]?.isSome = true) = (i < n) |
| `Nat.isSome_getElem?_toArray_roc_eq` | Nat.isSome_getElem?_toArray_roc_eq {m n i : Nat} : ((m<...=n).toArray[i]?.isSome = true) = (i < n - m) |
| `Nat.isSome_getElem?_toArray_roo_eq` | Nat.isSome_getElem?_toArray_roo_eq {m n i : Nat} : ((m<...n).toArray[i]?.isSome = true) = (i < n - (m + 1)) |
| `Nat.isSome_getElem?_toList_rcc_eq` | Nat.isSome_getElem?_toList_rcc_eq {m n i : Nat} : ((m...=n).toList[i]?.isSome = true) = (i < n + 1 - m) |
| `Nat.isSome_getElem?_toList_rco_eq` | Nat.isSome_getElem?_toList_rco_eq {m n i : Nat} : ((m...n).toList[i]?.isSome = true) = (i < n - m) |
| `Nat.isSome_getElem?_toList_ric_eq` | Nat.isSome_getElem?_toList_ric_eq {n i : Nat} : ((*...=n).toList[i]?.isSome = true) = (i ≤ n) |
| `Nat.isSome_getElem?_toList_rio_eq` | Nat.isSome_getElem?_toList_rio_eq {n i : Nat} : ((*...n).toList[i]?.isSome = true) = (i < n) |
| `Nat.isSome_getElem?_toList_roc_eq` | Nat.isSome_getElem?_toList_roc_eq {m n i : Nat} : ((m<...=n).toList[i]?.isSome = true) = (i < n - m) |
| `Nat.isSome_getElem?_toList_roo_eq` | Nat.isSome_getElem?_toList_roo_eq {m n i : Nat} : ((m<...n).toList[i]?.isSome = true) = (i < n - (m + 1)) |
| `Nat.land_eq` | Nat.land_eq {m n : Nat} : m.land n = m &&& n |
| `Nat.left_distrib` | Nat.left_distrib (n m k : Nat) : n * (m + k) = n * m + n * k |
| `Nat.length_toList_rcc` | Nat.length_toList_rcc {a b : Nat} : (a...=b).toList.length = b + 1 - a |
| `Nat.length_toList_rco` | Nat.length_toList_rco {a b : Nat} : (a...b).toList.length = b - a |
| `Nat.length_toList_ric` | Nat.length_toList_ric {b : Nat} : (*...=b).toList.length = b + 1 |
| `Nat.length_toList_rio` | Nat.length_toList_rio {b : Nat} : (*...b).toList.length = b |
| `Nat.length_toList_roc` | Nat.length_toList_roc {a b : Nat} : (a<...=b).toList.length = b - a |
| `Nat.length_toList_roo` | Nat.length_toList_roo {a b : Nat} : (a<...b).toList.length = b - a - 1 |
| `Nat.log2.eq_1` | Nat.log2.eq_1 (n : Nat) : n.log2 Nat.rec |
| `Nat.log2_def` | Nat.log2_def (n : Nat) : n.log2 = if 2 ≤ n then (n / 2).log2 + 1 else 0 |
| `Nat.log2_two_mul` | Nat.log2_two_mul {n : Nat} (h : n ≠ 0) : (2 * n).log2 = n.log2 + 1 |
| `Nat.log2_two_pow` | Nat.log2_two_pow {n : Nat} : (2 ^ n).log2 = n |
| `Nat.log2_zero` | Nat.log2_zero : Nat.log2 0 = 0 |
| `Nat.lor_eq` | Nat.lor_eq {m n : Nat} : m.lor n = m \|\|\| n |
| `Nat.map_add_toArray_rcc` | Nat.map_add_toArray_rcc {m n k : Nat} : Array.map (fun x => x + k) (m...=n).toArray = ((m + k)...=n + k).toArray |
| `Nat.map_add_toArray_rcc'` | Nat.map_add_toArray_rcc' {m n k : Nat} : Array.map (fun x => k + x) (m...=n).toArray = ((k + m)...=k + n).toArray |
| `Nat.map_add_toArray_rco` | Nat.map_add_toArray_rco {m n k : Nat} : Array.map (fun x => x + k) (m...n).toArray = ((m + k)...n + k).toArray |
| `Nat.map_add_toArray_rco'` | Nat.map_add_toArray_rco' {m n k : Nat} : Array.map (fun x => k + x) (m...n).toArray = ((k + m)...k + n).toArray |
| `Nat.map_add_toArray_ric` | Nat.map_add_toArray_ric {n k : Nat} : Array.map (fun x => x + k) (*...=n).toArray = (k...=n + k).toArray |
| `Nat.map_add_toArray_ric'` | Nat.map_add_toArray_ric' {n k : Nat} : Array.map (fun x => k + x) (*...=n).toArray = (k...=k + n).toArray |
| `Nat.map_add_toArray_rio` | Nat.map_add_toArray_rio {n k : Nat} : Array.map (fun x => x + k) (*...n).toArray = (k...n + k).toArray |
| `Nat.map_add_toArray_rio'` | Nat.map_add_toArray_rio' {n k : Nat} : Array.map (fun x => k + x) (*...n).toArray = (k...k + n).toArray |
| `Nat.map_add_toArray_roc` | Nat.map_add_toArray_roc {m n k : Nat} : Array.map (fun x => x + k) (m<...=n).toArray = ((m + k)<...=n + k).toArray |
| `Nat.map_add_toArray_roc'` | Nat.map_add_toArray_roc' {m n k : Nat} : Array.map (fun x => k + x) (m<...=n).toArray = ((k + m)<...=k + n).toArray |
| `Nat.map_add_toArray_roo` | Nat.map_add_toArray_roo {m n k : Nat} : Array.map (fun x => x + k) (m<...n).toArray = ((m + k)<...n + k).toArray |
| `Nat.map_add_toArray_roo'` | Nat.map_add_toArray_roo' {m n k : Nat} : Array.map (fun x => k + x) (m<...n).toArray = ((k + m)<...k + n).toArray |
| `Nat.map_add_toList_rcc` | Nat.map_add_toList_rcc {m n k : Nat} : List.map (fun x => x + k) (m...=n).toList = ((m + k)...=n + k).toList |
| `Nat.map_add_toList_rcc'` | Nat.map_add_toList_rcc' {m n k : Nat} : List.map (fun x => k + x) (m...=n).toList = ((k + m)...=k + n).toList |
| `Nat.map_add_toList_rco` | Nat.map_add_toList_rco {m n k : Nat} : List.map (fun x => x + k) (m...n).toList = ((m + k)...n + k).toList |
| `Nat.map_add_toList_rco'` | Nat.map_add_toList_rco' {m n k : Nat} : List.map (fun x => k + x) (m...n).toList = ((k + m)...k + n).toList |
| `Nat.map_add_toList_ric` | Nat.map_add_toList_ric {n k : Nat} : List.map (fun x => x + k) (*...=n).toList = (k...=n + k).toList |
| `Nat.map_add_toList_ric'` | Nat.map_add_toList_ric' {n k : Nat} : List.map (fun x => k + x) (*...=n).toList = (k...=k + n).toList |
| `Nat.map_add_toList_rio` | Nat.map_add_toList_rio {n k : Nat} : List.map (fun x => x + k) (*...n).toList = (k...n + k).toList |
| `Nat.map_add_toList_rio'` | Nat.map_add_toList_rio' {n k : Nat} : List.map (fun x => k + x) (*...n).toList = (k...k + n).toList |
| `Nat.map_add_toList_roc` | Nat.map_add_toList_roc {m n k : Nat} : List.map (fun x => x + k) (m<...=n).toList = ((m + k)<...=n + k).toList |
| `Nat.map_add_toList_roc'` | Nat.map_add_toList_roc' {m n k : Nat} : List.map (fun x => k + x) (m<...=n).toList = ((k + m)<...=k + n).toList |
| `Nat.map_add_toList_roo` | Nat.map_add_toList_roo {m n k : Nat} : List.map (fun x => x + k) (m<...n).toList = ((m + k)<...n + k).toList |
| `Nat.map_add_toList_roo'` | Nat.map_add_toList_roo' {m n k : Nat} : List.map (fun x => k + x) (m<...n).toList = ((k + m)<...k + n).toList |
| `Nat.modCore.go.congr_simp` | Nat.modCore.go.congr_simp (y y✝ : Nat) (e_y : y = y✝) (hy : 0 < y) (fuel fuel✝ : Nat) (e_fuel : fuel = fuel✝) (x |
| `Nat.modCore.go.eq_1` | Nat.modCore.go.eq_1 (y : Nat) (hy : 0 < y) (x fuel_2 : Nat) (hfuel_2 : x < fuel_2.succ) : Nat.modCore.go |
| `Nat.modCore.go.eq_def` | Nat.modCore.go.eq_def (y : Nat) (hy : 0 < y) (fuel x : Nat) (hfuel : x < fuel) : Nat.modCore.go match \| |
| `Nat.modCore_eq` | Nat.modCore_eq (x y : Nat) : x.modCore y = if 0 < y ∧ y ≤ x then (x - y).modCore y else x |
| `Nat.modCore_eq_mod` | Nat.modCore_eq_mod (n m : Nat) : n.modCore m = n % m |
| `Nat.not_beq_eq_true_eq` | Nat.not_beq_eq_true_eq (a b : Nat) : ((!a == b) = true) = ¬a = b |
| `Nat.not_decide_mod_two_eq_one` | Nat.not_decide_mod_two_eq_one (x : Nat) : (!decide (x % 2 = 1)) = decide (x % 2 = 0) |
| `Nat.not_ge_eq` | Nat.not_ge_eq (a b : Nat) : (¬a ≥ b) = (a + 1 ≤ b) |
| `Nat.not_gt_eq` | Nat.not_gt_eq (a b : Nat) : (¬a > b) = (a ≤ b) |
| `Nat.not_le_eq` | Nat.not_le_eq (a b : Nat) : (¬a ≤ b) = (b + 1 ≤ a) |
| `Nat.not_lt_eq` | Nat.not_lt_eq (a b : Nat) : (¬a < b) = (b ≤ a) |
| `Nat.ofDigitChars_append` | Nat.ofDigitChars_append {b : Nat} {l m : List Char} (init : Nat) : b.ofDigitChars |
| `Nat.ofDigitChars_cons` | Nat.ofDigitChars_cons {b : Nat} {c : Char} {cs : List Char} {init : Nat} : b.ofDigitChars |
| `Nat.ofDigitChars_cons_digitChar_of_lt_ten` | Nat.ofDigitChars_cons_digitChar_of_lt_ten {b n : Nat} (hn : n < 10) {cs : List Char} {init : Nat} : b.ofDigitChars |
| `Nat.ofDigitChars_eq_foldl` | Nat.ofDigitChars_eq_foldl {b : Nat} {l : List Char} {init : Nat} : b.ofDigitChars |
| `Nat.ofDigitChars_eq_ofDigitChars_zero` | Nat.ofDigitChars_eq_ofDigitChars_zero {l : List Char} {init : Nat} : Nat.ofDigitChars |
| `Nat.ofDigitChars_nil` | Nat.ofDigitChars_nil {b init : Nat} : b.ofDigitChars [] init = init |
| `Nat.ofDigitChars_replicate_zero` | Nat.ofDigitChars_replicate_zero {b init n : Nat} : b.ofDigitChars (List.replicate n '0') init = b ^ n * init |
| `Nat.ofDigitChars_ten_toDigits` | Nat.ofDigitChars_ten_toDigits {n : Nat} : Nat.ofDigitChars 10 (Nat.toDigits 10 n) 0 = n |
| `Nat.ofDigitChars_toDigits` | Nat.ofDigitChars_toDigits {b n : Nat} (hb' : 1 < b) (hb : b ≤ 10) : b.ofDigitChars (b.toDigits n) 0 = n |
| `Nat.or_and_distrib_left` | Nat.or_and_distrib_left (x y z : Nat) : x \|\|\| y &&& z = (x \|\|\| y) &&& (x \|\|\| z) |
| `Nat.or_and_distrib_right` | Nat.or_and_distrib_right (x y z : Nat) : x &&& y \|\|\| z = (x \|\|\| z) &&& (y \|\|\| z) |
| `Nat.or_assoc` | Nat.or_assoc (x y z : Nat) : x \|\|\| y \|\|\| z = x \|\|\| (y \|\|\| z) |
| `Nat.or_comm` | Nat.or_comm (x y : Nat) : x \|\|\| y = y \|\|\| x |
| `Nat.or_div_two` | Nat.or_div_two {a b : Nat} : (a \|\|\| b) / 2 = a / 2 \|\|\| b / 2 |
| `Nat.or_div_two_pow` | Nat.or_div_two_pow {a b n : Nat} : (a \|\|\| b) / 2 ^ n = a / 2 ^ n \|\|\| b / 2 ^ n |
| `Nat.or_mod_two_pow` | Nat.or_mod_two_pow {a b n : Nat} : (a \|\|\| b) % 2 ^ n = a % 2 ^ n \|\|\| b % 2 ^ n |
| `Nat.or_self` | Nat.or_self (x : Nat) : x \|\|\| x = x |
| `Nat.or_two_pow_eq_add_of_lt` | Nat.or_two_pow_eq_add_of_lt {a n : Nat} (h : a < 2 ^ n) : a \|\|\| 2 ^ n = a + 2 ^ n |
| `Nat.or_zero` | Nat.or_zero (x : Nat) : x \|\|\| 0 = x |
| `Nat.rec_eq_recCompiled.{u_1}` | Nat.rec_eq_recCompiled.{u_1} : @Nat.rec = @Nat.recCompiled |
| `Nat.repeat.eq_1.{u}` | Nat.repeat.eq_1.{u} {α : Type u} (f : α → α) (x✝ : α) : Nat.repeat f 0 x✝ = x✝ |
| `Nat.repeat.eq_2.{u}` | Nat.repeat.eq_2.{u} {α : Type u} (f : α → α) (x✝ : α) (n : Nat) : Nat.repeat f n.succ x✝ = f (Nat.repeat f n x✝) |
| `Nat.repeat.eq_def.{u}` | Nat.repeat.eq_def.{u} {α : Type u} (f : α → α) (x✝ : Nat) (x✝¹ : α) : Nat.repeat match \| \| |
| `Nat.repeat_eq_repeatTR.{u_1}` | Nat.repeat_eq_repeatTR.{u_1} : @Nat.repeat = @Nat.repeatTR |
| `Nat.reprPrec_eq_repr` | Nat.reprPrec_eq_repr {n i : Nat} : reprPrec n i = Std.Format.text n.repr |
| `Nat.repr_eq_ofList_toDigits` | Nat.repr_eq_ofList_toDigits {n : Nat} : n.repr = String.ofList (Nat.toDigits 10 n) |
| `Nat.repr_eq_repr` | Nat.repr_eq_repr {n : Nat} : repr n = Std.Format.text n.repr |
| `Nat.repr_eq_repr_append_repr` | Nat.repr_eq_repr_append_repr {n : Nat} (h : 10 ≤ n) : n.repr = (n / 10).repr ++ (n % 10).repr |
| `Nat.repr_of_ge` | Nat.repr_of_ge {n : Nat} (h : 10 ≤ n) : n.repr = (n / 10).repr ++ String.singleton (n % 10).digitChar |
| `Nat.repr_of_lt` | Nat.repr_of_lt {n : Nat} (h : n < 10) : n.repr = String.singleton n.digitChar |
| `Nat.right_distrib` | Nat.right_distrib (n m k : Nat) : (n + m) * k = n * k + m * k |
| `Nat.self_add_pred` | Nat.self_add_pred (n : Nat) : n + n.pred = (2 * n).pred |
| `Nat.self_add_sub_one` | Nat.self_add_sub_one (n : Nat) : n + (n - 1) = 2 * n - 1 |
| `Nat.self_sub_mod` | Nat.self_sub_mod (n k : Nat) [NeZero k] : (n - k) % n = n - k |
| `Nat.shiftLeft_add` | Nat.shiftLeft_add (m n k : Nat) : m <<< (n + k) = m <<< n <<< k |
| `Nat.shiftLeft_add_eq_or_of_lt` | Nat.shiftLeft_add_eq_or_of_lt {i b : Nat} (b_lt : b < 2 ^ i) (a : Nat) : a <<< i + b = a <<< i \|\|\| b |
| `Nat.shiftLeft_and_distrib` | Nat.shiftLeft_and_distrib {i a b : Nat} : (a &&& b) <<< i = a <<< i &&& b <<< i |
| `Nat.shiftLeft_bitwise_distrib` | Nat.shiftLeft_bitwise_distrib {f : Bool → Bool → Bool} {i a b : Nat} (of_false_false |
| `Nat.shiftLeft_eq` | Nat.shiftLeft_eq (a b : Nat) : a <<< b = a * 2 ^ b |
| `Nat.shiftLeft_eq'` | Nat.shiftLeft_eq' {m n : Nat} : m.shiftLeft n = m <<< n |
| `Nat.shiftLeft_or_distrib` | Nat.shiftLeft_or_distrib {i a b : Nat} : (a \|\|\| b) <<< i = a <<< i \|\|\| b <<< i |
| `Nat.shiftLeft_shiftRight` | Nat.shiftLeft_shiftRight (x n : Nat) : x <<< n >>> n = x |
| `Nat.shiftLeft_succ` | Nat.shiftLeft_succ (m n : Nat) : m <<< (n + 1) = 2 * m <<< n |
| `Nat.shiftLeft_succ_inside` | Nat.shiftLeft_succ_inside (m n : Nat) : m <<< (n + 1) = (2 * m) <<< n |
| `Nat.shiftLeft_xor_distrib` | Nat.shiftLeft_xor_distrib {i a b : Nat} : (a ^^^ b) <<< i = a <<< i ^^^ b <<< i |
| `Nat.shiftLeft_zero` | Nat.shiftLeft_zero {n : Nat} : n <<< 0 = n |
| `Nat.shiftRight_add` | Nat.shiftRight_add (m n k : Nat) : m >>> (n + k) = m >>> n >>> k |
| `Nat.shiftRight_and_distrib` | Nat.shiftRight_and_distrib {i a b : Nat} : (a &&& b) >>> i = a >>> i &&& b >>> i |
| `Nat.shiftRight_bitwise_distrib` | Nat.shiftRight_bitwise_distrib {f : Bool → Bool → Bool} {i a b : Nat} (of_false_false |
| `Nat.shiftRight_eq'` | Nat.shiftRight_eq' {m n : Nat} : m.shiftRight n = m >>> n |
| `Nat.shiftRight_eq_div_pow` | Nat.shiftRight_eq_div_pow (m n : Nat) : m >>> n = m / 2 ^ n |
| `Nat.shiftRight_eq_zero` | Nat.shiftRight_eq_zero (m n : Nat) (hn : m < 2 ^ n) : m >>> n = 0 |
| `Nat.shiftRight_or_distrib` | Nat.shiftRight_or_distrib {i a b : Nat} : (a \|\|\| b) >>> i = a >>> i \|\|\| b >>> i |
| `Nat.shiftRight_succ` | Nat.shiftRight_succ (m n : Nat) : m >>> (n + 1) = m >>> n / 2 |
| `Nat.shiftRight_succ_inside` | Nat.shiftRight_succ_inside (m n : Nat) : m >>> (n + 1) = (m / 2) >>> n |
| `Nat.shiftRight_xor_distrib` | Nat.shiftRight_xor_distrib {i a b : Nat} : (a ^^^ b) >>> i = a >>> i ^^^ b >>> i |
| `Nat.shiftRight_zero` | Nat.shiftRight_zero {n : Nat} : n >>> 0 = n |
| `Nat.size_rcc` | Nat.size_rcc {a b : Nat} : (a...=b).size = b + 1 - a |
| `Nat.size_rco` | Nat.size_rco {a b : Nat} : (a...b).size = b - a |
| `Nat.size_ric` | Nat.size_ric {b : Nat} : (*...=b).size = b + 1 |
| `Nat.size_rio` | Nat.size_rio {b : Nat} : (*...b).size = b |
| `Nat.size_roc` | Nat.size_roc {a b : Nat} : (a<...=b).size = b - a |
| `Nat.size_roo` | Nat.size_roo {a b : Nat} : (a<...b).size = b - a - 1 |
| `Nat.size_toArray_rcc` | Nat.size_toArray_rcc {a b : Nat} : (a...=b).toArray.size = b + 1 - a |
| `Nat.size_toArray_rco` | Nat.size_toArray_rco {a b : Nat} : (a...b).toArray.size = b - a |
| `Nat.size_toArray_ric` | Nat.size_toArray_ric {b : Nat} : (*...=b).toArray.size = b + 1 |
| `Nat.size_toArray_rio` | Nat.size_toArray_rio {b : Nat} : (*...b).toArray.size = b |
| `Nat.size_toArray_roc` | Nat.size_toArray_roc {a b : Nat} : (a<...=b).toArray.size = b - a |
| `Nat.size_toArray_roo` | Nat.size_toArray_roo {a b : Nat} : (a<...b).toArray.size = b - a - 1 |
| `Nat.sqrt.eq_1` | Nat.sqrt.eq_1 (n : Nat) : n.sqrt = if n ≤ 1 then n else Nat.sqrt.iter n (1 <<< (n.log2 / 2 + 1)) |
| `Nat.sqrt.iter.eq_def` | Nat.sqrt.iter.eq_def (n guess : Nat) : Nat.sqrt.iter have if |
| `Nat.testBit.eq_1` | Nat.testBit.eq_1 (m n : Nat) : m.testBit n = (1 &&& m >>> n != 0) |
| `Nat.testBit_add` | Nat.testBit_add (x i n : Nat) : x.testBit (i + n) = (x / 2 ^ n).testBit i |
| `Nat.testBit_add_one` | Nat.testBit_add_one (x i : Nat) : x.testBit (i + 1) = (x / 2).testBit i |
| `Nat.testBit_and` | Nat.testBit_and (x y i : Nat) : (x &&& y).testBit i = (x.testBit i && y.testBit i) |
| `Nat.testBit_bitwise` | Nat.testBit_bitwise {f : Bool → Bool → Bool} (of_false_false : f false false = false) (x y i : Nat) : (Nat.bitwise |
| `Nat.testBit_bool_toNat` | Nat.testBit_bool_toNat (b : Bool) (i : Nat) : b.toNat.testBit i = (decide (i = 0) && b) |
| `Nat.testBit_div_two` | Nat.testBit_div_two (x i : Nat) : (x / 2).testBit i = x.testBit (i + 1) |
| `Nat.testBit_div_two_pow` | Nat.testBit_div_two_pow {n : Nat} (x i : Nat) : (x / 2 ^ n).testBit i = x.testBit (i + n) |
| `Nat.testBit_eq_decide_div_mod_eq` | Nat.testBit_eq_decide_div_mod_eq {i x : Nat} : x.testBit i = decide (x / 2 ^ i % 2 = 1) |
| `Nat.testBit_log2` | Nat.testBit_log2 {n : Nat} (h : n ≠ 0) : n.testBit n.log2 = true |
| `Nat.testBit_lt_two_pow` | Nat.testBit_lt_two_pow {x i : Nat} (lt : x < 2 ^ i) : x.testBit i = false |
| `Nat.testBit_mod_two_pow` | Nat.testBit_mod_two_pow (x j i : Nat) : (x % 2 ^ j).testBit i = (decide (i < j) && x.testBit i) |
| `Nat.testBit_mul_two_pow` | Nat.testBit_mul_two_pow (x j i : Nat) : (x * 2 ^ i).testBit j = (decide (i ≤ j) && x.testBit (j - i)) |
| `Nat.testBit_mul_two_pow_add_eq` | Nat.testBit_mul_two_pow_add_eq (a b i : Nat) : (2 ^ i * a + b).testBit i = (decide (a % 2 = 1) ^^ b.testBit i) |
| `Nat.testBit_of_two_pow_le_and_two_pow_add_one_gt` | Nat.testBit_of_two_pow_le_and_two_pow_add_one_gt {n i : Nat} (hle : 2 ^ i ≤ n) (hgt : n < 2 ^ (i + 1)) : n.testBit |
| `Nat.testBit_one_zero` | Nat.testBit_one_zero : Nat.testBit 1 0 = true |
| `Nat.testBit_or` | Nat.testBit_or (x y i : Nat) : (x \|\|\| y).testBit i = (x.testBit i \|\| y.testBit i) |
| `Nat.testBit_shiftLeft` | Nat.testBit_shiftLeft {i j : Nat} (x : Nat) : (x <<< i).testBit j = (decide (j ≥ i) && x.testBit (j - i)) |
| `Nat.testBit_shiftRight` | Nat.testBit_shiftRight {i j : Nat} (x : Nat) : (x >>> i).testBit j = x.testBit (i + j) |
| `Nat.testBit_succ` | Nat.testBit_succ (x i : Nat) : x.testBit i.succ = (x / 2).testBit i |
| `Nat.testBit_two_pow` | Nat.testBit_two_pow {n m : Nat} : (2 ^ n).testBit m = decide (n = m) |
| `Nat.testBit_two_pow_add_eq` | Nat.testBit_two_pow_add_eq (x i : Nat) : (2 ^ i + x).testBit i = !x.testBit i |
| `Nat.testBit_two_pow_add_gt` | Nat.testBit_two_pow_add_gt {i j : Nat} (j_lt_i : j < i) (x : Nat) : (2 ^ i + x).testBit j = x.testBit j |
| `Nat.testBit_two_pow_mul` | Nat.testBit_two_pow_mul {i a j : Nat} : (2 ^ i * a).testBit j = (decide (j ≥ i) && a.testBit (j - i)) |
| `Nat.testBit_two_pow_mul_add` | Nat.testBit_two_pow_mul_add (a : Nat) {b i : Nat} (b_lt : b < 2 ^ i) (j : Nat) : (2 |
| `Nat.testBit_two_pow_of_ne` | Nat.testBit_two_pow_of_ne {n m : Nat} (hm : n ≠ m) : (2 ^ n).testBit m = false |
| `Nat.testBit_two_pow_self` | Nat.testBit_two_pow_self {n : Nat} : (2 ^ n).testBit n = true |
| `Nat.testBit_two_pow_sub_one` | Nat.testBit_two_pow_sub_one (n i : Nat) : (2 ^ n - 1).testBit i = decide (i < n) |
| `Nat.testBit_two_pow_sub_succ` | Nat.testBit_two_pow_sub_succ {x n : Nat} (h₂ : x < 2 ^ n) (i : Nat) : (2 |
| `Nat.testBit_xor` | Nat.testBit_xor (x y i : Nat) : (x ^^^ y).testBit i = (x.testBit i ^^ y.testBit i) |
| `Nat.testBit_zero` | Nat.testBit_zero (x : Nat) : x.testBit 0 = decide (x % 2 = 1) |
| `Nat.toArray_rcc_add_right_eq_map` | Nat.toArray_rcc_add_right_eq_map {m n : Nat} : (m...=m + n).toArray = Array.map (fun x => x + m) (0...=n).toArray |
| `Nat.toArray_rcc_add_succ_right_eq_push` | Nat.toArray_rcc_add_succ_right_eq_push {m n : Nat} : (m...=m + n + 1).toArray = (m...=m + n).toArray.push (m + n + 1) |
| `Nat.toArray_rcc_add_succ_right_eq_push'` | Nat.toArray_rcc_add_succ_right_eq_push' {m n : Nat} : (m...=m + (n + 1)).toArray = (m...=m + n).toArray.push (m + n + 1) |
| `Nat.toArray_rcc_eq_empty` | Nat.toArray_rcc_eq_empty {m n : Nat} (h : n < m) : (m...=n).toArray = #[] |
| `Nat.toArray_rcc_eq_if` | Nat.toArray_rcc_eq_if {m n : Nat} : (m...=n).toArray = if m ≤ n then #[m] ++ ((m + 1)...=n).toArray else #[] |
| `Nat.toArray_rcc_eq_push` | Nat.toArray_rcc_eq_push {m n : Nat} (h : m ≤ n) : (m...=n).toArray = (m...n).toArray.push n |
| `Nat.toArray_rcc_eq_singleton` | Nat.toArray_rcc_eq_singleton {m n : Nat} (h : n = m) : (m...=n).toArray = #[m] |
| `Nat.toArray_rcc_eq_singleton_append` | Nat.toArray_rcc_eq_singleton_append {m n : Nat} (h : m ≤ n) : (m...=n).toArray = #[m] ++ ((m + 1)...=n).toArray |
| `Nat.toArray_rcc_eq_toArray_rco` | Nat.toArray_rcc_eq_toArray_rco {m n : Nat} : (m...=n).toArray = (m...n + 1).toArray |
| `Nat.toArray_rcc_succ_right_eq_append_map` | Nat.toArray_rcc_succ_right_eq_append_map {m n : Nat} (h : m ≤ n + 1) : (m...=n |
| `Nat.toArray_rcc_succ_right_eq_push` | Nat.toArray_rcc_succ_right_eq_push {m n : Nat} (h : m ≤ n + 1) : (m...=n + 1).toArray = (m...=n).toArray.push (n + 1) |
| `Nat.toArray_rcc_succ_succ` | Nat.toArray_rcc_succ_succ {m n : Nat} : ((m + 1)...=n + 1).toArray = Array.map (fun x => x + 1) (m...=n).toArray |
| `Nat.toArray_rco_add_add_eq_append` | Nat.toArray_rco_add_add_eq_append {m n k : Nat} : (m...m |
| `Nat.toArray_rco_add_right_eq_map` | Nat.toArray_rco_add_right_eq_map {m n : Nat} : (m...m + n).toArray = Array.map (fun x => x + m) (0...n).toArray |
| `Nat.toArray_rco_add_succ_right_eq_push` | Nat.toArray_rco_add_succ_right_eq_push {m n : Nat} : (m...m + n + 1).toArray = (m...m + n).toArray.push (m + n) |
| `Nat.toArray_rco_add_succ_right_eq_push'` | Nat.toArray_rco_add_succ_right_eq_push' {m n : Nat} : (m...m + (n + 1)).toArray = (m...m + n).toArray.push (m + n) |
| `Nat.toArray_rco_append_toArray_rco` | Nat.toArray_rco_append_toArray_rco {l m n : Nat} (h : l ≤ m) (h' : m ≤ n) : (l...m).toArray |
| `Nat.toArray_rco_eq_empty` | Nat.toArray_rco_eq_empty {m n : Nat} (h : n ≤ m) : (m...n).toArray = #[] |
| `Nat.toArray_rco_eq_if` | Nat.toArray_rco_eq_if {m n : Nat} : (m...n).toArray = if m < n then #[m] ++ ((m + 1)...n).toArray else #[] |
| `Nat.toArray_rco_eq_if_push` | Nat.toArray_rco_eq_if_push {m n : Nat} : (m...n).toArray = if m < n then (m...n - 1).toArray.push (n - 1) else #[] |
| `Nat.toArray_rco_eq_push` | Nat.toArray_rco_eq_push {m n : Nat} (h : m < n) : (m...n).toArray = (m...n - 1).toArray.push (n - 1) |
| `Nat.toArray_rco_eq_singleton` | Nat.toArray_rco_eq_singleton {m n : Nat} (h : n = m + 1) : (m...n).toArray = #[m] |
| `Nat.toArray_rco_eq_singleton_append` | Nat.toArray_rco_eq_singleton_append {m n : Nat} (h : m < n) : (m...n).toArray = #[m] ++ ((m + 1)...n).toArray |
| `Nat.toArray_rco_succ_right_eq_append_map` | Nat.toArray_rco_succ_right_eq_append_map {m n : Nat} (h : m ≤ n) : (m...n |
| `Nat.toArray_rco_succ_right_eq_push` | Nat.toArray_rco_succ_right_eq_push {m n : Nat} (h : m ≤ n) : (m...n + 1).toArray = (m...n).toArray.push n |
| `Nat.toArray_rco_succ_succ` | Nat.toArray_rco_succ_succ {m n : Nat} : ((m + 1)...n + 1).toArray = Array.map (fun x => x + 1) (m...n).toArray |
| `Nat.toArray_rco_zero_right_eq_empty` | Nat.toArray_rco_zero_right_eq_empty {m : Nat} : (m...0).toArray = #[] |
| `Nat.toArray_ric_add_add_eq_append` | Nat.toArray_ric_add_add_eq_append {m n : Nat} : (*...=m + n).toArray = (*...m).toArray ++ (m...=m + n).toArray |
| `Nat.toArray_ric_eq_cons` | Nat.toArray_ric_eq_cons {n : Nat} : (*...=n).toArray = #[0] ++ (1...=n).toArray |
| `Nat.toArray_ric_eq_push` | Nat.toArray_ric_eq_push {n : Nat} (h : 0 < n) : (*...=n).toArray = (*...=n - 1).toArray.push n |
| `Nat.toArray_ric_eq_toArray_rcc` | Nat.toArray_ric_eq_toArray_rcc {n : Nat} : (*...=n).toArray = (0...=n).toArray |
| `Nat.toArray_ric_eq_toArray_rco` | Nat.toArray_ric_eq_toArray_rco {n : Nat} : (*...=n).toArray = (0...n + 1).toArray |
| `Nat.toArray_ric_eq_toArray_rio` | Nat.toArray_ric_eq_toArray_rio {n : Nat} : (*...=n).toArray = (*...n + 1).toArray |
| `Nat.toArray_ric_eq_toArray_rio_push` | Nat.toArray_ric_eq_toArray_rio_push {n : Nat} : (*...=n).toArray = (*...n).toArray.push n |
| `Nat.toArray_ric_succ` | Nat.toArray_ric_succ {n : Nat} : (*...=n + 1).toArray = (*...=n).toArray.push (n + 1) |
| `Nat.toArray_ric_succ_eq_push` | Nat.toArray_ric_succ_eq_push {n : Nat} : (*...=n + 1).toArray = (*...=n).toArray.push (n + 1) |
| `Nat.toArray_ric_zero_eq_singleton` | Nat.toArray_ric_zero_eq_singleton : (*...=0).toArray = #[0] |
| `Nat.toArray_rio_add_add_eq_append` | Nat.toArray_rio_add_add_eq_append {m n : Nat} : (*...m + n).toArray = (*...m).toArray ++ (m...m + n).toArray |
| `Nat.toArray_rio_eq_if` | Nat.toArray_rio_eq_if {n : Nat} : (*...n).toArray = if 0 < n then (*...n - 1).toArray.push (n - 1) else #[] |
| `Nat.toArray_rio_eq_nil` | Nat.toArray_rio_eq_nil {n : Nat} (h : n = 0) : (*...n).toArray = #[] |
| `Nat.toArray_rio_eq_push` | Nat.toArray_rio_eq_push {n : Nat} (h : 0 < n) : (*...n).toArray = (*...n - 1).toArray.push (n - 1) |
| `Nat.toArray_rio_eq_singleton_append` | Nat.toArray_rio_eq_singleton_append {n : Nat} (h : 0 < n) : (*...n).toArray = #[0] ++ (1...n).toArray |
| `Nat.toArray_rio_eq_toArray_rco` | Nat.toArray_rio_eq_toArray_rco {n : Nat} : (*...n).toArray = (0...n).toArray |
| `Nat.toArray_rio_one_eq_singleton` | Nat.toArray_rio_one_eq_singleton : (*...1).toArray = #[0] |
| `Nat.toArray_rio_succ` | Nat.toArray_rio_succ {n : Nat} : (*...n + 1).toArray = (*...n).toArray ++ [n] |
| `Nat.toArray_rio_succ_eq_push` | Nat.toArray_rio_succ_eq_push {n : Nat} : (*...n + 1).toArray = (*...n).toArray.push n |
| `Nat.toArray_rio_zero_right_eq_nil` | Nat.toArray_rio_zero_right_eq_nil {m : Nat} : (m...0).toArray = #[] |
| `Nat.toArray_roc_add_add_eq_append` | Nat.toArray_roc_add_add_eq_append {m n k : Nat} : (m<...=m |
| `Nat.toArray_roc_add_right_eq_map` | Nat.toArray_roc_add_right_eq_map {m n : Nat} : (m<...=m + n).toArray = Array.map (fun x => x + m + 1) (0...n).toArray |
| `Nat.toArray_roc_add_succ_right_eq_push` | Nat.toArray_roc_add_succ_right_eq_push {m n : Nat} : (m<...=m + n + 1).toArray = (m<...=m + n).toArray.push (m + n + 1) |
| `Nat.toArray_roc_add_succ_right_eq_push'` | Nat.toArray_roc_add_succ_right_eq_push' {m n : Nat} : (m<...=m |
| `Nat.toArray_roc_append_toArray_roc` | Nat.toArray_roc_append_toArray_roc {l m n : Nat} (h : l ≤ m) (h' : m ≤ n) : (l<...=m).toArray |
| `Nat.toArray_roc_eq_if` | Nat.toArray_roc_eq_if {m n : Nat} : (m<...=n).toArray = if m + 1 ≤ n then #[m + 1] ++ ((m + 1)<...=n).toArray else #[] |
| `Nat.toArray_roc_eq_nil` | Nat.toArray_roc_eq_nil {m n : Nat} (h : n ≤ m) : (m<...=n).toArray = #[] |
| `Nat.toArray_roc_eq_push` | Nat.toArray_roc_eq_push {m n : Nat} (h : m < n) : (m<...=n).toArray = (m<...=n - 1).toArray.push n |
| `Nat.toArray_roc_eq_singleton` | Nat.toArray_roc_eq_singleton {m n : Nat} (h : n = m + 1) : (m<...=n).toArray = #[m + 1] |
| `Nat.toArray_roc_eq_singleton_append` | Nat.toArray_roc_eq_singleton_append {m n : Nat} (h : m < n) : (m<...=n).toArray = #[m + 1] ++ ((m + 1)<...=n).toArray |
| `Nat.toArray_roc_eq_toArray_rcc` | Nat.toArray_roc_eq_toArray_rcc {m n : Nat} : (m<...=n).toArray = ((m + 1)...=n).toArray |
| `Nat.toArray_roc_eq_toArray_rco` | Nat.toArray_roc_eq_toArray_rco {m n : Nat} : (m<...=n).toArray = ((m + 1)...n + 1).toArray |
| `Nat.toArray_roc_eq_toArray_roo` | Nat.toArray_roc_eq_toArray_roo {m n : Nat} : (m<...=n).toArray = (m<...n + 1).toArray |
| `Nat.toArray_roc_succ_right_eq_append_map` | Nat.toArray_roc_succ_right_eq_append_map {m n : Nat} (h : m ≤ n) : (m<...=n |
| `Nat.toArray_roc_succ_right_eq_push` | Nat.toArray_roc_succ_right_eq_push {m n : Nat} (h : m ≤ n) : (m<...=n + 1).toArray = (m<...=n).toArray.push (n + 1) |
| `Nat.toArray_roc_succ_succ` | Nat.toArray_roc_succ_succ {m n : Nat} : ((m + 1)<...=n + 1).toArray = Array.map (fun x => x + 1) (m<...=n).toArray |
| `Nat.toArray_roo_add_right_eq_map` | Nat.toArray_roo_add_right_eq_map {m n : Nat} : (m<...m + 1 + n).toArray = Array.map (fun x => x + m + 1) (0...n).toArray |
| `Nat.toArray_roo_eq_if` | Nat.toArray_roo_eq_if {m n : Nat} : (m<...n).toArray = if m + 1 < n then #[m + 1] ++ ((m + 1)<...n).toArray else #[] |
| `Nat.toArray_roo_eq_nil` | Nat.toArray_roo_eq_nil {m n : Nat} (h : n ≤ m + 1) : (m<...n).toArray = #[] |
| `Nat.toArray_roo_eq_push` | Nat.toArray_roo_eq_push {m n : Nat} (h : m + 1 < n) : (m<...n).toArray = (m<...n - 1).toArray.push (n - 1) |
| `Nat.toArray_roo_eq_singleton` | Nat.toArray_roo_eq_singleton {m n : Nat} (h : n = m + 2) : (m<...n).toArray = #[m + 1] |
| `Nat.toArray_roo_eq_singleton_append` | Nat.toArray_roo_eq_singleton_append {m n : Nat} (h : m + 1 < n) : (m<...n).toArray = #[m + 1] ++ ((m + 1)<...n).toArray |
| `Nat.toArray_roo_eq_toArray_rco` | Nat.toArray_roo_eq_toArray_rco {m n : Nat} : (m<...n).toArray = ((m + 1)...n).toArray |
| `Nat.toArray_roo_one_right_eq_nil` | Nat.toArray_roo_one_right_eq_nil {m : Nat} : (m<...1).toArray = #[] |
| `Nat.toArray_roo_succ_right_eq_append_map` | Nat.toArray_roo_succ_right_eq_append_map {m n : Nat} (h : m < n) : (m<...n |
| `Nat.toArray_roo_succ_right_eq_push` | Nat.toArray_roo_succ_right_eq_push {m n : Nat} (h : m < n) : (m<...n + 1).toArray = (m<...n).toArray.push n |
| `Nat.toArray_roo_succ_succ` | Nat.toArray_roo_succ_succ {m n : Nat} : ((m + 1)<...n + 1).toArray = Array.map (fun x => x + 1) (m<...n).toArray |
| `Nat.toArray_roo_zero_right_eq_nil` | Nat.toArray_roo_zero_right_eq_nil {m : Nat} : (m<...0).toArray = #[] |
| `Nat.toArray_toList_rcc` | Nat.toArray_toList_rcc {m n : Nat} : (m...=n).toList.toArray = (m...=n).toArray |
| `Nat.toArray_toList_rco` | Nat.toArray_toList_rco {m n : Nat} : (m...n).toList.toArray = (m...n).toArray |
| `Nat.toArray_toList_ric` | Nat.toArray_toList_ric {n : Nat} : (*...=n).toList.toArray = (*...=n).toArray |
| `Nat.toArray_toList_rio` | Nat.toArray_toList_rio {n : Nat} : (*...n).toList.toArray = (*...n).toArray |
| `Nat.toArray_toList_roc` | Nat.toArray_toList_roc {m n : Nat} : (m<...=n).toList.toArray = (m<...=n).toArray |
| `Nat.toArray_toList_roo` | Nat.toArray_toList_roo {m n : Nat} : (m<...n).toList.toArray = (m<...n).toArray |
| `Nat.toDigits_append_toDigits` | Nat.toDigits_append_toDigits {b n d : Nat} (hb : 1 < b) (hn : 0 < n) (hd : d < b) : b.toDigits |
| `Nat.toDigits_eq_if` | Nat.toDigits_eq_if {b n : Nat} (hb : 1 < b) : b.toDigits |
| `Nat.toDigits_of_base_le` | Nat.toDigits_of_base_le {b n : Nat} (hb : 1 < b) (h : b ≤ n) : b.toDigits n = b.toDigits (n / b) ++ [(n % b).digitChar] |
| `Nat.toDigits_of_lt_base` | Nat.toDigits_of_lt_base {b n : Nat} (h : n < b) : b.toDigits n = [n.digitChar] |
| `Nat.toDigits_zero` | Nat.toDigits_zero (b : Nat) : b.toDigits 0 = ['0'] |
| `Nat.toList_rcc_add_right_eq_map` | Nat.toList_rcc_add_right_eq_map {m n : Nat} : (m...=m + n).toList = List.map (fun x => x + m) (0...=n).toList |
| `Nat.toList_rcc_add_succ_right_eq_append` | Nat.toList_rcc_add_succ_right_eq_append {m n : Nat} : (m...=m + n + 1).toList = (m...=m + n).toList ++ [m + n + 1] |
| `Nat.toList_rcc_add_succ_right_eq_append'` | Nat.toList_rcc_add_succ_right_eq_append' {m n : Nat} : (m...=m + (n + 1)).toList = (m...=m + n).toList ++ [m + n + 1] |
| `Nat.toList_rcc_eq_append` | Nat.toList_rcc_eq_append {m n : Nat} (h : m ≤ n) : (m...=n).toList = (m...n).toList ++ [n] |
| `Nat.toList_rcc_eq_cons` | Nat.toList_rcc_eq_cons {m n : Nat} (h : m ≤ n) : (m...=n).toList = m :: ((m + 1)...=n).toList |
| `Nat.toList_rcc_eq_if` | Nat.toList_rcc_eq_if {m n : Nat} : (m...=n).toList = if m ≤ n then m :: ((m + 1)...=n).toList else [] |
| `Nat.toList_rcc_eq_nil` | Nat.toList_rcc_eq_nil {m n : Nat} (h : n < m) : (m...=n).toList = [] |
| `Nat.toList_rcc_eq_singleton` | Nat.toList_rcc_eq_singleton {m n : Nat} (h : n = m) : (m...=n).toList = [m] |
| `Nat.toList_rcc_eq_toList_rco` | Nat.toList_rcc_eq_toList_rco {m n : Nat} : (m...=n).toList = (m...n + 1).toList |
| `Nat.toList_rcc_succ_right_eq_append` | Nat.toList_rcc_succ_right_eq_append {m n : Nat} (h : m ≤ n + 1) : (m...=n + 1).toList = (m...=n).toList ++ [n + 1] |
| `Nat.toList_rcc_succ_right_eq_cons_map` | Nat.toList_rcc_succ_right_eq_cons_map {m n : Nat} (h : m ≤ n + 1) : (m...=n |
| `Nat.toList_rcc_succ_succ` | Nat.toList_rcc_succ_succ {m n : Nat} : ((m + 1)...=n + 1).toList = List.map (fun x => x + 1) (m...=n).toList |
| `Nat.toList_rco_add_add_eq_append` | Nat.toList_rco_add_add_eq_append {m n k : Nat} : (m...m |
| `Nat.toList_rco_add_right_eq_map` | Nat.toList_rco_add_right_eq_map {m n : Nat} : (m...m + n).toList = List.map (fun x => x + m) (0...n).toList |
| `Nat.toList_rco_add_succ_right_eq_append` | Nat.toList_rco_add_succ_right_eq_append {m n : Nat} : (m...m + n + 1).toList = (m...m + n).toList ++ [m + n] |
| `Nat.toList_rco_add_succ_right_eq_append'` | Nat.toList_rco_add_succ_right_eq_append' {m n : Nat} : (m...m + (n + 1)).toList = (m...m + n).toList ++ [m + n] |
| `Nat.toList_rco_append_toList_rco` | Nat.toList_rco_append_toList_rco {l m n : Nat} (h : l ≤ m) (h' : m ≤ n) : (l...m).toList |
| `Nat.toList_rco_eq_append` | Nat.toList_rco_eq_append {m n : Nat} (h : m < n) : (m...n).toList = (m...n - 1).toList ++ [n - 1] |
| `Nat.toList_rco_eq_cons` | Nat.toList_rco_eq_cons {m n : Nat} (h : m < n) : (m...n).toList = m :: ((m + 1)...n).toList |
| `Nat.toList_rco_eq_if` | Nat.toList_rco_eq_if {m n : Nat} : (m...n).toList = if m < n then m :: ((m + 1)...n).toList else [] |
| `Nat.toList_rco_eq_if_append` | Nat.toList_rco_eq_if_append {m n : Nat} : (m...n).toList = if m < n then (m...n - 1).toList ++ [n - 1] else [] |
| `Nat.toList_rco_eq_nil` | Nat.toList_rco_eq_nil {m n : Nat} (h : n ≤ m) : (m...n).toList = [] |
| `Nat.toList_rco_eq_singleton` | Nat.toList_rco_eq_singleton {m n : Nat} (h : n = m + 1) : (m...n).toList = [m] |
| `Nat.toList_rco_succ_right_eq_append` | Nat.toList_rco_succ_right_eq_append {m n : Nat} (h : m ≤ n) : (m...n + 1).toList = (m...n).toList ++ [n] |
| `Nat.toList_rco_succ_right_eq_cons_map` | Nat.toList_rco_succ_right_eq_cons_map {m n : Nat} (h : m ≤ n) : (m...n |
| `Nat.toList_rco_succ_succ` | Nat.toList_rco_succ_succ {m n : Nat} : ((m + 1)...n + 1).toList = List.map (fun x => x + 1) (m...n).toList |
| `Nat.toList_rco_zero_right_eq_nil` | Nat.toList_rco_zero_right_eq_nil {m : Nat} : (m...0).toList = [] |
| `Nat.toList_repr` | Nat.toList_repr {n : Nat} : n.repr.toList = Nat.toDigits 10 n |
| `Nat.toList_ric_add_add_eq_append` | Nat.toList_ric_add_add_eq_append {m n : Nat} : (*...=m + n).toList = (*...m).toList ++ (m...=m + n).toList |
| `Nat.toList_ric_eq_append` | Nat.toList_ric_eq_append {n : Nat} (h : 0 < n) : (*...=n).toList = (*...=n - 1).toList ++ [n] |
| `Nat.toList_ric_eq_cons` | Nat.toList_ric_eq_cons {n : Nat} : (*...=n).toList = 0 :: (1...=n).toList |
| `Nat.toList_ric_eq_toList_rcc` | Nat.toList_ric_eq_toList_rcc {n : Nat} : (*...=n).toList = (0...=n).toList |
| `Nat.toList_ric_eq_toList_rco` | Nat.toList_ric_eq_toList_rco {n : Nat} : (*...=n).toList = (0...n + 1).toList |
| `Nat.toList_ric_eq_toList_rio` | Nat.toList_ric_eq_toList_rio {n : Nat} : (*...=n).toList = (*...n + 1).toList |
| `Nat.toList_ric_eq_toList_rio_append` | Nat.toList_ric_eq_toList_rio_append {n : Nat} : (*...=n).toList = (*...n).toList ++ [n] |
| `Nat.toList_ric_succ` | Nat.toList_ric_succ {n : Nat} : (*...=n + 1).toList = (*...=n).toList ++ [n + 1] |
| `Nat.toList_ric_succ_eq_append` | Nat.toList_ric_succ_eq_append {n : Nat} : (*...=n + 1).toList = (*...=n).toList ++ [n + 1] |
| `Nat.toList_ric_zero_eq_singleton` | Nat.toList_ric_zero_eq_singleton : (*...=0).toList = [0] |
| `Nat.toList_rio_add_add_eq_append` | Nat.toList_rio_add_add_eq_append {m n : Nat} : (*...m + n).toList = (*...m).toList ++ (m...m + n).toList |
| `Nat.toList_rio_eq_append` | Nat.toList_rio_eq_append {n : Nat} (h : 0 < n) : (*...n).toList = (*...n - 1).toList ++ [n - 1] |
| `Nat.toList_rio_eq_cons` | Nat.toList_rio_eq_cons {n : Nat} (h : 0 < n) : (*...n).toList = 0 :: (1...n).toList |
| `Nat.toList_rio_eq_if` | Nat.toList_rio_eq_if {n : Nat} : (*...n).toList = if 0 < n then (*...n - 1).toList ++ [n - 1] else [] |
| `Nat.toList_rio_eq_nil` | Nat.toList_rio_eq_nil {n : Nat} (h : n = 0) : (*...n).toList = [] |
| `Nat.toList_rio_eq_toList_rco` | Nat.toList_rio_eq_toList_rco {n : Nat} : (*...n).toList = (0...n).toList |
| `Nat.toList_rio_one_eq_singleton` | Nat.toList_rio_one_eq_singleton : (*...1).toList = [0] |
| `Nat.toList_rio_succ` | Nat.toList_rio_succ {n : Nat} : (*...n + 1).toList = (*...n).toList ++ [n] |
| `Nat.toList_rio_succ_eq_append` | Nat.toList_rio_succ_eq_append {n : Nat} : (*...n + 1).toList = (*...n).toList ++ [n] |
| `Nat.toList_rio_zero_right_eq_nil` | Nat.toList_rio_zero_right_eq_nil {m : Nat} : (m...0).toList = [] |
| `Nat.toList_roc_add_add_eq_append` | Nat.toList_roc_add_add_eq_append {m n k : Nat} : (m<...=m |
| `Nat.toList_roc_add_right_eq_map` | Nat.toList_roc_add_right_eq_map {m n : Nat} : (m<...=m + n).toList = List.map (fun x => x + m + 1) (0...n).toList |
| `Nat.toList_roc_add_succ_right_eq_append` | Nat.toList_roc_add_succ_right_eq_append {m n : Nat} : (m<...=m + n + 1).toList = (m<...=m + n).toList ++ [m + n + 1] |
| `Nat.toList_roc_add_succ_right_eq_append'` | Nat.toList_roc_add_succ_right_eq_append' {m n : Nat} : (m<...=m + (n + 1)).toList = (m<...=m + n).toList ++ [m + n + 1] |
| `Nat.toList_roc_append_toList_roc` | Nat.toList_roc_append_toList_roc {l m n : Nat} (h : l ≤ m) (h' : m ≤ n) : (l<...=m).toList |
| `Nat.toList_roc_eq_append` | Nat.toList_roc_eq_append {m n : Nat} (h : m < n) : (m<...=n).toList = (m<...=n - 1).toList ++ [n] |
| `Nat.toList_roc_eq_cons` | Nat.toList_roc_eq_cons {m n : Nat} (h : m < n) : (m<...=n).toList = (m + 1) :: ((m + 1)<...=n).toList |
| `Nat.toList_roc_eq_if` | Nat.toList_roc_eq_if {m n : Nat} : (m<...=n).toList = if m + 1 ≤ n then (m + 1) :: ((m + 1)<...=n).toList else [] |
| `Nat.toList_roc_eq_nil` | Nat.toList_roc_eq_nil {m n : Nat} (h : n ≤ m) : (m<...=n).toList = [] |
| `Nat.toList_roc_eq_singleton` | Nat.toList_roc_eq_singleton {m n : Nat} (h : n = m + 1) : (m<...=n).toList = [m + 1] |
| `Nat.toList_roc_eq_toList_rcc` | Nat.toList_roc_eq_toList_rcc {m n : Nat} : (m<...=n).toList = ((m + 1)...=n).toList |
| `Nat.toList_roc_eq_toList_rco` | Nat.toList_roc_eq_toList_rco {m n : Nat} : (m<...=n).toList = ((m + 1)...n + 1).toList |
| `Nat.toList_roc_eq_toList_roo` | Nat.toList_roc_eq_toList_roo {m n : Nat} : (m<...=n).toList = (m<...n + 1).toList |
| `Nat.toList_roc_succ_right_eq_append` | Nat.toList_roc_succ_right_eq_append {m n : Nat} (h : m ≤ n) : (m<...=n + 1).toList = (m<...=n).toList ++ [n + 1] |
| `Nat.toList_roc_succ_right_eq_cons_map` | Nat.toList_roc_succ_right_eq_cons_map {m n : Nat} (h : m ≤ n) : (m<...=n |
| `Nat.toList_roc_succ_succ` | Nat.toList_roc_succ_succ {m n : Nat} : ((m + 1)<...=n + 1).toList = List.map (fun x => x + 1) (m<...=n).toList |
| `Nat.toList_roo_add_right_eq_map` | Nat.toList_roo_add_right_eq_map {m n : Nat} : (m<...m + 1 + n).toList = List.map (fun x => x + m + 1) (0...n).toList |
| `Nat.toList_roo_eq_append` | Nat.toList_roo_eq_append {m n : Nat} (h : m + 1 < n) : (m<...n).toList = (m<...n - 1).toList ++ [n - 1] |
| `Nat.toList_roo_eq_cons` | Nat.toList_roo_eq_cons {m n : Nat} (h : m + 1 < n) : (m<...n).toList = (m + 1) :: ((m + 1)<...n).toList |
| `Nat.toList_roo_eq_if` | Nat.toList_roo_eq_if {m n : Nat} : (m<...n).toList = if m + 1 < n then (m + 1) :: ((m + 1)<...n).toList else [] |
| `Nat.toList_roo_eq_nil` | Nat.toList_roo_eq_nil {m n : Nat} (h : n ≤ m + 1) : (m<...n).toList = [] |
| `Nat.toList_roo_eq_singleton` | Nat.toList_roo_eq_singleton {m n : Nat} (h : n = m + 2) : (m<...n).toList = [m + 1] |
| `Nat.toList_roo_eq_toList_rco` | Nat.toList_roo_eq_toList_rco {m n : Nat} : (m<...n).toList = ((m + 1)...n).toList |
| `Nat.toList_roo_one_right_eq_nil` | Nat.toList_roo_one_right_eq_nil {m : Nat} : (m<...1).toList = [] |
| `Nat.toList_roo_succ_right_eq_append` | Nat.toList_roo_succ_right_eq_append {m n : Nat} (h : m < n) : (m<...n + 1).toList = (m<...n).toList ++ [n] |
| `Nat.toList_roo_succ_right_eq_cons_map` | Nat.toList_roo_succ_right_eq_cons_map {m n : Nat} (h : m < n) : (m<...n |
| `Nat.toList_roo_succ_succ` | Nat.toList_roo_succ_succ {m n : Nat} : ((m + 1)<...n + 1).toList = List.map (fun x => x + 1) (m<...n).toList |
| `Nat.toList_roo_zero_right_eq_nil` | Nat.toList_roo_zero_right_eq_nil {m : Nat} : (m<...0).toList = [] |
| `Nat.toList_toArray_rcc` | Nat.toList_toArray_rcc {m n : Nat} : (m...=n).toArray.toList = (m...=n).toList |
| `Nat.toList_toArray_rco` | Nat.toList_toArray_rco {m n : Nat} : (m...n).toArray.toList = (m...n).toList |
| `Nat.toList_toArray_ric` | Nat.toList_toArray_ric {n : Nat} : (*...=n).toArray.toList = (*...=n).toList |
| `Nat.toList_toArray_rio` | Nat.toList_toArray_rio {n : Nat} : (*...n).toArray.toList = (*...n).toList |
| `Nat.toList_toArray_roc` | Nat.toList_toArray_roc {m n : Nat} : (m<...=n).toArray.toList = (m<...=n).toList |
| `Nat.toList_toArray_roo` | Nat.toList_toArray_roo {m n : Nat} : (m<...n).toArray.toList = (m<...n).toList |
| `Nat.toNat_digitChar_of_lt_ten` | Nat.toNat_digitChar_of_lt_ten {n : Nat} (hn : n < 10) : n.digitChar.toNat = 48 + n |
| `Nat.toNat_digitChar_sub_48_of_lt_ten` | Nat.toNat_digitChar_sub_48_of_lt_ten {n : Nat} (hn : n < 10) : n.digitChar.toNat - 48 = n |
| `Nat.toNat_testBit` | Nat.toNat_testBit (x i : Nat) : (x.testBit i).toNat = x / 2 ^ i % 2 |
| `Nat.toString_eq_ofList_toDigits` | Nat.toString_eq_ofList_toDigits {n : Nat} : toString n = String.ofList (Nat.toDigits 10 n) |
| `Nat.toString_eq_repr` | Nat.toString_eq_repr {n : Nat} : toString n = n.repr |
| `Nat.toUInt16_eq` | Nat.toUInt16_eq {n : Nat} : n.toUInt16 = UInt16.ofNat n |
| `Nat.toUInt32_eq` | Nat.toUInt32_eq {n : Nat} : n.toUInt32 = UInt32.ofNat n |
| `Nat.toUInt64_eq` | Nat.toUInt64_eq {n : Nat} : n.toUInt64 = UInt64.ofNat n |
| `Nat.toUInt8_eq` | Nat.toUInt8_eq {n : Nat} : n.toUInt8 = UInt8.ofNat n |
| `Nat.toUSize_eq` | Nat.toUSize_eq {n : Nat} : n.toUSize = USize.ofNat n |
| `Nat.xor_assoc` | Nat.xor_assoc (x y z : Nat) : x ^^^ y ^^^ z = x ^^^ (y ^^^ z) |
| `Nat.xor_comm` | Nat.xor_comm (x y : Nat) : x ^^^ y = y ^^^ x |
| `Nat.xor_div_two` | Nat.xor_div_two {a b : Nat} : (a ^^^ b) / 2 = a / 2 ^^^ b / 2 |
| `Nat.xor_div_two_pow` | Nat.xor_div_two_pow {a b n : Nat} : (a ^^^ b) / 2 ^ n = a / 2 ^ n ^^^ b / 2 ^ n |
| `Nat.xor_eq` | Nat.xor_eq {m n : Nat} : m.xor n = m ^^^ n |
| `Nat.xor_mod_two_pow` | Nat.xor_mod_two_pow {a b n : Nat} : (a ^^^ b) % 2 ^ n = a % 2 ^ n ^^^ b % 2 ^ n |
| `Nat.xor_self` | Nat.xor_self (x : Nat) : x ^^^ x = 0 |
| `Nat.xor_zero` | Nat.xor_zero (x : Nat) : x ^^^ 0 = x |

## Nat Addition / subtraction (127)

| Lemma | Statement |
|---|---|
| `Nat.add_add_add_comm` | Nat.add_add_add_comm (a b c d : Nat) : a + b + (c + d) = a + c + (b + d) |
| `Nat.add_assoc` | Nat.add_assoc (n m k : Nat) : n + m + k = n + (m + k) |
| `Nat.add_comm` | Nat.add_comm (n m : Nat) : n + m = m + n |
| `Nat.add_div` | Nat.add_div {a b c : Nat} (h : 0 < c) : (a + b) / c = a / c + b / c + if c ≤ a % c + b % c then 1 else 0 |
| `Nat.add_div_left` | Nat.add_div_left (x : Nat) {z : Nat} (H : 0 < z) : (z + x) / z = x / z + 1 |
| `Nat.add_div_of_dvd_add_add_one` | Nat.add_div_of_dvd_add_add_one {c a b : Nat} (h : c ∣ a + b + 1) : (a + b) / c = a / c + b / c |
| `Nat.add_div_right` | Nat.add_div_right (x : Nat) {z : Nat} (H : 0 < z) : (x + z) / z = x / z + 1 |
| `Nat.add_eq` | Nat.add_eq {x y : Nat} : x.add y = x + y |
| `Nat.add_left_cancel` | Nat.add_left_cancel {n m k : Nat} : n + m = n + k → m = k |
| `Nat.add_left_comm` | Nat.add_left_comm (n m k : Nat) : n + (m + k) = m + (n + k) |
| `Nat.add_left_max_self` | Nat.add_left_max_self {a b : Nat} : max (b + a) a = b + a |
| `Nat.add_left_min_self` | Nat.add_left_min_self {a b : Nat} : min (b + a) a = a |
| `Nat.add_max_add_left` | Nat.add_max_add_left (a b c : Nat) : max (a + b) (a + c) = a + max b c |
| `Nat.add_max_add_right` | Nat.add_max_add_right (a b c : Nat) : max (a + c) (b + c) = max a b + c |
| `Nat.add_min_add_left` | Nat.add_min_add_left (a b c : Nat) : min (a + b) (a + c) = a + min b c |
| `Nat.add_min_add_right` | Nat.add_min_add_right (a b c : Nat) : min (a + c) (b + c) = min a b + c |
| `Nat.add_mod` | Nat.add_mod (a b n : Nat) : (a + b) % n = (a % n + b % n) % n |
| `Nat.add_mod_eq_add_mod_left` | Nat.add_mod_eq_add_mod_left {a d b : Nat} (c : Nat) (H : a % d = b % d) : (c + a) % d = (c + b) % d |
| `Nat.add_mod_eq_add_mod_right` | Nat.add_mod_eq_add_mod_right {a d b : Nat} (c : Nat) (H : a % d = b % d) : (a + c) % d = (b + c) % d |
| `Nat.add_mod_eq_ite` | Nat.add_mod_eq_ite {k m n : Nat} : (m + n) % k = if k ≤ m % k + n % k then m % k + n % k - k else m % k + n % k |
| `Nat.add_mod_eq_sub` | Nat.add_mod_eq_sub {a b c : Nat} : (a + b) % c = a % c + b % c - if a % c + b % c < c then 0 else c |
| `Nat.add_mod_left` | Nat.add_mod_left (x z : Nat) : (x + z) % x = z % x |
| `Nat.add_mod_mod` | Nat.add_mod_mod (m n k : Nat) : (m + n % k) % k = (m + n) % k |
| `Nat.add_mod_right` | Nat.add_mod_right (x z : Nat) : (x + z) % z = x % z |
| `Nat.add_mul` | Nat.add_mul (n m k : Nat) : (n + m) * k = n * k + m * k |
| `Nat.add_mul_div_left` | Nat.add_mul_div_left (x z : Nat) {y : Nat} (H : 0 < y) : (x + y * z) / y = x / y + z |
| `Nat.add_mul_div_right` | Nat.add_mul_div_right (x y : Nat) {z : Nat} (H : 0 < z) : (x + y * z) / z = x / z + y |
| `Nat.add_mul_mod_self_left` | Nat.add_mul_mod_self_left (x y z : Nat) : (x + y * z) % y = x % y |
| `Nat.add_mul_mod_self_right` | Nat.add_mul_mod_self_right (x y z : Nat) : (x + y * z) % z = x % z |
| `Nat.add_one` | Nat.add_one (n : Nat) : n + 1 = n.succ |
| `Nat.add_one_mul` | Nat.add_one_mul (n m : Nat) : (n + 1) * m = n * m + m |
| `Nat.add_one_mul_add_one` | Nat.add_one_mul_add_one (a b : Nat) : (a + 1) * (b + 1) = a * b + a + b + 1 |
| `Nat.add_one_sub_one` | Nat.add_one_sub_one (n : Nat) : n + 1 - 1 = n |
| `Nat.add_right_cancel` | Nat.add_right_cancel {n m k : Nat} (h : n + m = k + m) : n = k |
| `Nat.add_right_comm` | Nat.add_right_comm (n m k : Nat) : n + m + k = n + k + m |
| `Nat.add_right_max_self` | Nat.add_right_max_self {a b : Nat} : max (a + b) a = a + b |
| `Nat.add_right_min_self` | Nat.add_right_min_self {a b : Nat} : min (a + b) a = a |
| `Nat.add_sub_add_left` | Nat.add_sub_add_left (k n m : Nat) : k + n - (k + m) = n - m |
| `Nat.add_sub_add_right` | Nat.add_sub_add_right (n k m : Nat) : n + k - (m + k) = n - m |
| `Nat.add_sub_assoc` | Nat.add_sub_assoc {m k : Nat} (h : k ≤ m) (n : Nat) : n + m - k = n + (m - k) |
| `Nat.add_sub_cancel` | Nat.add_sub_cancel (n m : Nat) : n + m - m = n |
| `Nat.add_sub_cancel'` | Nat.add_sub_cancel' {n m : Nat} (h : m ≤ n) : m + (n - m) = n |
| `Nat.add_sub_cancel_left` | Nat.add_sub_cancel_left (n m : Nat) : n + m - n = m |
| `Nat.add_sub_cancel_right` | Nat.add_sub_cancel_right (n m : Nat) : n + m - m = n |
| `Nat.add_sub_of_le` | Nat.add_sub_of_le {a b : Nat} (h : a ≤ b) : a + (b - a) = b |
| `Nat.add_sub_self_left` | Nat.add_sub_self_left (a b : Nat) : a + b - a = b |
| `Nat.add_sub_self_right` | Nat.add_sub_self_right (a b : Nat) : a + b - b = a |
| `Nat.add_sub_sub_add_right` | Nat.add_sub_sub_add_right (n m k l : Nat) : n + l - m - (k + l) = n - m - k |
| `Nat.add_sub_sub_cancel` | Nat.add_sub_sub_cancel {a b c : Nat} (h : c ≤ a) : a + b - (a - c) = b + c |
| `Nat.add_succ` | Nat.add_succ (n m : Nat) : n + m.succ = (n + m).succ |
| `Nat.add_succ_sub_one` | Nat.add_succ_sub_one (m n : Nat) : m + n.succ - 1 = m + n |
| `Nat.add_zero` | Nat.add_zero (n : Nat) : n + 0 = n |
| `Nat.pred_add_self` | Nat.pred_add_self (n : Nat) : n.pred + n = (2 * n).pred |
| `Nat.pred_eq_of_eq_succ` | Nat.pred_eq_of_eq_succ {m n : Nat} (H : m = n.succ) : m.pred = n |
| `Nat.pred_eq_sub_one` | Nat.pred_eq_sub_one {n : Nat} : n.pred = n - 1 |
| `Nat.pred_inj` | Nat.pred_inj {a b : Nat} : 0 < a → 0 < b → a.pred = b.pred → a = b |
| `Nat.pred_max_pred` | Nat.pred_max_pred (x y : Nat) : max x.pred y.pred = (max x y).pred |
| `Nat.pred_min_pred` | Nat.pred_min_pred (x y : Nat) : min x.pred y.pred = (min x y).pred |
| `Nat.pred_mul` | Nat.pred_mul (n m : Nat) : n.pred * m = n * m - m |
| `Nat.pred_one_add` | Nat.pred_one_add (n : Nat) : (1 + n).pred = n |
| `Nat.pred_sub` | Nat.pred_sub (n m : Nat) : n.pred - m = (n - m).pred |
| `Nat.pred_succ` | Nat.pred_succ (n : Nat) : n.succ.pred = n |
| `Nat.pred_zero` | Nat.pred_zero : Nat.pred 0 = 0 |
| `Nat.sub_add_cancel` | Nat.sub_add_cancel {n m : Nat} (h : m ≤ n) : n - m + m = n |
| `Nat.sub_add_comm` | Nat.sub_add_comm {n m k : Nat} (h : k ≤ n) : n + m - k = n - k + m |
| `Nat.sub_add_eq` | Nat.sub_add_eq (a b c : Nat) : a - (b + c) = a - b - c |
| `Nat.sub_add_eq_max` | Nat.sub_add_eq_max (a b : Nat) : a - b + b = max a b |
| `Nat.sub_add_min_cancel` | Nat.sub_add_min_cancel (n m : Nat) : n - m + min n m = n |
| `Nat.sub_add_sub_cancel` | Nat.sub_add_sub_cancel {a b c : Nat} (hab : b ≤ a) (hcb : c ≤ b) : a - b + (b - c) = a - c |
| `Nat.sub_eq` | Nat.sub_eq {x y : Nat} : x.sub y = x - y |
| `Nat.sub_eq_max_sub` | Nat.sub_eq_max_sub (n m : Nat) : n - m = max n m - m |
| `Nat.sub_eq_of_eq_add` | Nat.sub_eq_of_eq_add {a b c : Nat} (h : a = c + b) : a - b = c |
| `Nat.sub_eq_of_eq_add'` | Nat.sub_eq_of_eq_add' {a b c : Nat} (h : a = b + c) : a - b = c |
| `Nat.sub_eq_sub_min` | Nat.sub_eq_sub_min (n m : Nat) : n - m = n - min n m |
| `Nat.sub_eq_zero_of_le` | Nat.sub_eq_zero_of_le {n m : Nat} (h : n ≤ m) : n - m = 0 |
| `Nat.sub_max_sub_left` | Nat.sub_max_sub_left (a b c : Nat) : max (a - b) (a - c) = a - min b c |
| `Nat.sub_max_sub_right` | Nat.sub_max_sub_right (a b c : Nat) : max (a - c) (b - c) = max a b - c |
| `Nat.sub_min_sub_left` | Nat.sub_min_sub_left (a b c : Nat) : min (a - b) (a - c) = a - max b c |
| `Nat.sub_min_sub_right` | Nat.sub_min_sub_right (a b c : Nat) : min (a - c) (b - c) = min a b - c |
| `Nat.sub_mod_add_mod_cancel` | Nat.sub_mod_add_mod_cancel (a b : Nat) [NeZero a] : a - b % a + b % a = a |
| `Nat.sub_mod_eq_zero_of_mod_eq` | Nat.sub_mod_eq_zero_of_mod_eq {m k n : Nat} (h : m % k = n % k) : (m - n) % k = 0 |
| `Nat.sub_mul` | Nat.sub_mul (n m k : Nat) : (n - m) * k = n * k - m * k |
| `Nat.sub_mul_div` | Nat.sub_mul_div (a b c : Nat) : (a - b * c) / b = a / b - c |
| `Nat.sub_mul_div_of_le` | Nat.sub_mul_div_of_le (x n p : Nat) (h₁ : n * p ≤ x) : (x - n * p) / n = x / n - p |
| `Nat.sub_mul_mod` | Nat.sub_mul_mod {x k n : Nat} (h₁ : n * k ≤ x) : (x - n * k) % n = x % n |
| `Nat.sub_one` | Nat.sub_one (n : Nat) : n - 1 = n.pred |
| `Nat.sub_one_add_one` | Nat.sub_one_add_one {a : Nat} (h : a ≠ 0) : a - 1 + 1 = a |
| `Nat.sub_one_add_one_eq_of_pos` | Nat.sub_one_add_one_eq_of_pos {n : Nat} : 0 < n → n - 1 + 1 = n |
| `Nat.sub_one_add_self` | Nat.sub_one_add_self (n : Nat) : n - 1 + n = 2 * n - 1 |
| `Nat.sub_one_cancel` | Nat.sub_one_cancel {a b : Nat} : 0 < a → 0 < b → a - 1 = b - 1 → a = b |
| `Nat.sub_one_mul` | Nat.sub_one_mul (n m : Nat) : (n - 1) * m = n * m - m |
| `Nat.sub_right_comm` | Nat.sub_right_comm (m n k : Nat) : m - n - k = m - k - n |
| `Nat.sub_self` | Nat.sub_self (n : Nat) : n - n = 0 |
| `Nat.sub_self_add` | Nat.sub_self_add (n m : Nat) : n - (n + m) = 0 |
| `Nat.sub_sub` | Nat.sub_sub (n m k : Nat) : n - m - k = n - (m + k) |
| `Nat.sub_sub_eq_min` | Nat.sub_sub_eq_min (a b : Nat) : a - (a - b) = min a b |
| `Nat.sub_sub_right` | Nat.sub_sub_right (a : Nat) {b c : Nat} (h : c ≤ b) : a - (b - c) = a + c - b |
| `Nat.sub_sub_self` | Nat.sub_sub_self {n m : Nat} (h : m ≤ n) : n - (n - m) = m |
| `Nat.sub_sub_sub_cancel_right` | Nat.sub_sub_sub_cancel_right {a b c : Nat} (h : c ≤ b) : a - c - (b - c) = a - b |
| `Nat.sub_succ` | Nat.sub_succ (n m : Nat) : n - m.succ = (n - m).pred |
| `Nat.sub_succ'` | Nat.sub_succ' (m n : Nat) : m - n.succ = m - n - 1 |
| `Nat.sub_zero` | Nat.sub_zero (n : Nat) : n - 0 = n |
| `Nat.succ.inj` | Nat.succ.inj {m n : Nat} : m.succ = n.succ → m = n |
| `Nat.succ.injEq` | Nat.succ.injEq (u v : Nat) : (u.succ = v.succ) = (u = v) |
| `Nat.succ_add` | Nat.succ_add (n m : Nat) : n.succ + m = (n + m).succ |
| `Nat.succ_add_eq_add_succ` | Nat.succ_add_eq_add_succ (a b : Nat) : a.succ + b = a + b.succ |
| `Nat.succ_add_sub_one` | Nat.succ_add_sub_one (n m : Nat) : m.succ + n - 1 = m + n |
| `Nat.succ_div` | Nat.succ_div {a b : Nat} : (a + 1) / b = a / b + if b ∣ a + 1 then 1 else 0 |
| `Nat.succ_div_of_dvd` | Nat.succ_div_of_dvd {a b : Nat} (h : b ∣ a + 1) : (a + 1) / b = a / b + 1 |
| `Nat.succ_div_of_mod_eq_zero` | Nat.succ_div_of_mod_eq_zero {a b : Nat} (h : (a + 1) % b = 0) : (a + 1) / b = a / b + 1 |
| `Nat.succ_div_of_mod_ne_zero` | Nat.succ_div_of_mod_ne_zero {a b : Nat} (h : (a + 1) % b ≠ 0) : (a + 1) / b = a / b |
| `Nat.succ_div_of_not_dvd` | Nat.succ_div_of_not_dvd {a b : Nat} (h : ¬b ∣ a + 1) : (a + 1) / b = a / b |
| `Nat.succ_eq_add_one` | Nat.succ_eq_add_one (n : Nat) : n.succ = n + 1 |
| `Nat.succ_eq_one_add` | Nat.succ_eq_one_add (n : Nat) : n.succ = 1 + n |
| `Nat.succ_max_succ` | Nat.succ_max_succ (x y : Nat) : max x.succ y.succ = (max x y).succ |
| `Nat.succ_min_succ` | Nat.succ_min_succ (x y : Nat) : min x.succ y.succ = (min x y).succ |
| `Nat.succ_mul` | Nat.succ_mul (n m : Nat) : n.succ * m = n * m + m |
| `Nat.succ_mul_succ` | Nat.succ_mul_succ (a b : Nat) : a.succ * b.succ = a * b + a + b + 1 |
| `Nat.succ_mul_succ_eq` | Nat.succ_mul_succ_eq (a b : Nat) : a.succ * b.succ = a * b + a + b + 1 |
| `Nat.succ_pred` | Nat.succ_pred {a : Nat} (h : a ≠ 0) : a.pred.succ = a |
| `Nat.succ_pred_eq_of_ne_zero` | Nat.succ_pred_eq_of_ne_zero {n : Nat} : n ≠ 0 → n.pred.succ = n |
| `Nat.succ_pred_eq_of_pos` | Nat.succ_pred_eq_of_pos {n : Nat} : 0 < n → n.pred.succ = n |
| `Nat.succ_sub` | Nat.succ_sub {m n : Nat} (h : n ≤ m) : m.succ - n = (m - n).succ |
| `Nat.succ_sub_one` | Nat.succ_sub_one (n : Nat) : n.succ - 1 = n |
| `Nat.succ_sub_sub_succ` | Nat.succ_sub_sub_succ (n m k : Nat) : n.succ - m - k.succ = n - m - k |
| `Nat.succ_sub_succ` | Nat.succ_sub_succ (n m : Nat) : n.succ - m.succ = n - m |
| `Nat.succ_sub_succ_eq_sub` | Nat.succ_sub_succ_eq_sub (n m : Nat) : n.succ - m.succ = n - m |

## Nat Division / modulus / gcd (159)

| Lemma | Statement |
|---|---|
| `Nat.div.go.congr_simp` | Nat.div.go.congr_simp (y y✝ : Nat) (e_y : y = y✝) (hy : 0 < y) (fuel fuel✝ : Nat) (e_fuel : fuel = fuel✝) (x x✝ : Nat) (e_x |
| `Nat.div.go.eq_1` | Nat.div.go.eq_1 (y : Nat) (hy : 0 < y) (x fuel_2 : Nat) (hfuel_2 : x < fuel_2.succ) : Nat.div.go |
| `Nat.div.go.eq_def` | Nat.div.go.eq_def (y : Nat) (hy : 0 < y) (fuel x : Nat) (hfuel : x < fuel) : Nat.div.go match \| |
| `Nat.div.inductionOn.eq_def.{u}` | Nat.div.inductionOn.eq_def.{u} {motive : Nat → Nat → Sort u} (x y : Nat) (ind (base Nat.div.inductionOn if |
| `Nat.div_add_mod` | Nat.div_add_mod (m n : Nat) : n * (m / n) + m % n = m |
| `Nat.div_add_mod'` | Nat.div_add_mod' (a b : Nat) : a / b * b + a % b = a |
| `Nat.div_div_div_eq_div` | Nat.div_div_div_eq_div {a b c : Nat} (dvd : b ∣ a) (dvd2 : a ∣ c) : c / (a / b) / b = c / a |
| `Nat.div_div_eq_div_mul` | Nat.div_div_eq_div_mul (m n k : Nat) : m / n / k = m / (n * k) |
| `Nat.div_div_self` | Nat.div_div_self {n m : Nat} (h : n ∣ m) (hm : m ≠ 0) : m / (m / n) = n |
| `Nat.div_eq` | Nat.div_eq (x y : Nat) : x / y = if 0 < y ∧ y ≤ x then (x - y) / y + 1 else 0 |
| `Nat.div_eq_of_eq_mul_left` | Nat.div_eq_of_eq_mul_left {n m k : Nat} (H1 : 0 < n) (H2 : m = k * n) : m / n = k |
| `Nat.div_eq_of_eq_mul_right` | Nat.div_eq_of_eq_mul_right {n m k : Nat} (H1 : 0 < n) (H2 : m = n * k) : m / n = k |
| `Nat.div_eq_of_lt` | Nat.div_eq_of_lt {a b : Nat} (h₀ : a < b) : a / b = 0 |
| `Nat.div_eq_of_lt_le` | Nat.div_eq_of_lt_le {k n m : Nat} (lo : k * n ≤ m) (hi : m < (k + 1) * n) : m / n = k |
| `Nat.div_eq_sub_div` | Nat.div_eq_sub_div {b a : Nat} (h₁ : 0 < b) (h₂ : b ≤ a) : a / b = (a - b) / b + 1 |
| `Nat.div_eq_sub_mod_div` | Nat.div_eq_sub_mod_div {m n : Nat} : m / n = (m - m % n) / n |
| `Nat.div_mod_eq_div` | Nat.div_mod_eq_div {a b c : Nat} (ha : a < c) : a / b % c = a / b |
| `Nat.div_mod_eq_mod_div_mod` | Nat.div_mod_eq_mod_div_mod {a b c : Nat} (ha : a < c) (hb : b < c) : a / b % c = a % c / (b % c) |
| `Nat.div_mul_cancel` | Nat.div_mul_cancel {n m : Nat} (H : n ∣ m) : m / n * n = m |
| `Nat.div_mul_div_comm` | Nat.div_mul_div_comm {a b c d : Nat} : b ∣ a → d ∣ c → a / b * (c / d) = a * c / (b * d) |
| `Nat.div_mul_right_comm` | Nat.div_mul_right_comm {a b : Nat} (hba : b ∣ a) (c : Nat) : a / b * c = a * c / b |
| `Nat.div_mul_self_eq_mod_sub_self` | Nat.div_mul_self_eq_mod_sub_self {x k : Nat} : x / k * k = x - x % k |
| `Nat.div_one` | Nat.div_one (n : Nat) : n / 1 = n |
| `Nat.div_pow` | Nat.div_pow {a b c : Nat} (h : a ∣ b) : (b / a) ^ c = b ^ c / a ^ c |
| `Nat.div_self` | Nat.div_self {n : Nat} (H : 0 < n) : n / n = 1 |
| `Nat.div_zero` | Nat.div_zero (n : Nat) : n / 0 = 0 |
| `Nat.dvd_antisymm` | Nat.dvd_antisymm {m n : Nat} : m ∣ n → n ∣ m → m = n |
| `Nat.dvd_eq_false_of_mod_ne_zero` | Nat.dvd_eq_false_of_mod_ne_zero {m n : Nat} (h : (n % m != 0) = true) : (m ∣ n) = False |
| `Nat.dvd_eq_true_of_mod_eq_zero` | Nat.dvd_eq_true_of_mod_eq_zero {m n : Nat} (h : (n % m == 0) = true) : (m ∣ n) = True |
| `Nat.gcd_add_left_left_of_dvd` | Nat.gcd_add_left_left_of_dvd {m k : Nat} (n : Nat) : m ∣ k → (k + n).gcd m = n.gcd m |
| `Nat.gcd_add_left_right_of_dvd` | Nat.gcd_add_left_right_of_dvd {n k : Nat} (m : Nat) : n ∣ k → n.gcd (k + m) = n.gcd m |
| `Nat.gcd_add_mul_left_left` | Nat.gcd_add_mul_left_left (m n k : Nat) : (n + m * k).gcd m = n.gcd m |
| `Nat.gcd_add_mul_left_right` | Nat.gcd_add_mul_left_right (m n k : Nat) : m.gcd (n + m * k) = m.gcd n |
| `Nat.gcd_add_mul_right_left` | Nat.gcd_add_mul_right_left (m n k : Nat) : (n + k * m).gcd m = n.gcd m |
| `Nat.gcd_add_mul_right_right` | Nat.gcd_add_mul_right_right (m n k : Nat) : m.gcd (n + k * m) = m.gcd n |
| `Nat.gcd_add_one` | Nat.gcd_add_one (x y : Nat) : (x + 1).gcd y = (y % (x + 1)).gcd (x + 1) |
| `Nat.gcd_add_right_left_of_dvd` | Nat.gcd_add_right_left_of_dvd {m k : Nat} (n : Nat) : m ∣ k → (n + k).gcd m = n.gcd m |
| `Nat.gcd_add_right_right_of_dvd` | Nat.gcd_add_right_right_of_dvd {n k : Nat} (m : Nat) : n ∣ k → n.gcd (m + k) = n.gcd m |
| `Nat.gcd_add_self_left` | Nat.gcd_add_self_left (m n : Nat) : (n + m).gcd m = n.gcd m |
| `Nat.gcd_add_self_right` | Nat.gcd_add_self_right (m n : Nat) : m.gcd (n + m) = m.gcd n |
| `Nat.gcd_assoc` | Nat.gcd_assoc (m n k : Nat) : (m.gcd n).gcd k = m.gcd (n.gcd k) |
| `Nat.gcd_comm` | Nat.gcd_comm (m n : Nat) : m.gcd n = n.gcd m |
| `Nat.gcd_def` | Nat.gcd_def (x y : Nat) : x.gcd y = if x = 0 then y else (y % x).gcd x |
| `Nat.gcd_div` | Nat.gcd_div {m n k : Nat} (H1 : k ∣ m) (H2 : k ∣ n) : (m / k).gcd (n / k) = m.gcd n / k |
| `Nat.gcd_div_gcd_div_gcd_of_pos_left` | Nat.gcd_div_gcd_div_gcd_of_pos_left {n m : Nat} (h : 0 < n) : (n / n.gcd m).gcd (m / n.gcd m) = 1 |
| `Nat.gcd_div_gcd_div_gcd_of_pos_right` | Nat.gcd_div_gcd_div_gcd_of_pos_right {n m : Nat} (h : 0 < m) : (n / n.gcd m).gcd (m / n.gcd m) = 1 |
| `Nat.gcd_eq_left` | Nat.gcd_eq_left {m n : Nat} (H : m ∣ n) : m.gcd n = m |
| `Nat.gcd_eq_right` | Nat.gcd_eq_right {m n : Nat} (H : n ∣ m) : m.gcd n = n |
| `Nat.gcd_gcd_self_left_left` | Nat.gcd_gcd_self_left_left (m n : Nat) : (m.gcd n).gcd m = m.gcd n |
| `Nat.gcd_gcd_self_left_right` | Nat.gcd_gcd_self_left_right (m n : Nat) : (n.gcd m).gcd m = n.gcd m |
| `Nat.gcd_gcd_self_right_left` | Nat.gcd_gcd_self_right_left (m n : Nat) : m.gcd (m.gcd n) = m.gcd n |
| `Nat.gcd_gcd_self_right_right` | Nat.gcd_gcd_self_right_right (m n : Nat) : m.gcd (n.gcd m) = n.gcd m |
| `Nat.gcd_left_comm` | Nat.gcd_left_comm (m n k : Nat) : m.gcd (n.gcd k) = n.gcd (m.gcd k) |
| `Nat.gcd_mul_gcd_of_coprime_of_mul_eq_mul` | Nat.gcd_mul_gcd_of_coprime_of_mul_eq_mul {c d a b : Nat} (cop : c.Coprime d) (h : a * b = c * d) : a.gcd c * b.gcd c = c |
| `Nat.gcd_mul_lcm` | Nat.gcd_mul_lcm (m n : Nat) : m.gcd n * m.lcm n = m * n |
| `Nat.gcd_mul_left` | Nat.gcd_mul_left (m n k : Nat) : (m * n).gcd (m * k) = m * n.gcd k |
| `Nat.gcd_mul_left_add_left` | Nat.gcd_mul_left_add_left (m n k : Nat) : (m * k + n).gcd m = n.gcd m |
| `Nat.gcd_mul_left_add_right` | Nat.gcd_mul_left_add_right (m n k : Nat) : m.gcd (m * k + n) = m.gcd n |
| `Nat.gcd_mul_left_left` | Nat.gcd_mul_left_left (m n : Nat) : (m * n).gcd n = n |
| `Nat.gcd_mul_left_left_of_gcd_eq_one` | Nat.gcd_mul_left_left_of_gcd_eq_one {n m k : Nat} (h : n.gcd m = 1) : (k * n).gcd m = k.gcd m |
| `Nat.gcd_mul_left_right` | Nat.gcd_mul_left_right (m n : Nat) : n.gcd (m * n) = n |
| `Nat.gcd_mul_left_right_of_gcd_eq_one` | Nat.gcd_mul_left_right_of_gcd_eq_one {n m k : Nat} (h : n.gcd m = 1) : n.gcd (k * m) = n.gcd k |
| `Nat.gcd_mul_left_sub_left` | Nat.gcd_mul_left_sub_left {m n k : Nat} (h : n ≤ m * k) : (m * k - n).gcd m = n.gcd m |
| `Nat.gcd_mul_left_sub_right` | Nat.gcd_mul_left_sub_right {m n k : Nat} (h : n ≤ m * k) : m.gcd (m * k - n) = m.gcd n |
| `Nat.gcd_mul_right` | Nat.gcd_mul_right (m n k : Nat) : (m * n).gcd (k * n) = m.gcd k * n |
| `Nat.gcd_mul_right_add_left` | Nat.gcd_mul_right_add_left (m n k : Nat) : (k * m + n).gcd m = n.gcd m |
| `Nat.gcd_mul_right_add_right` | Nat.gcd_mul_right_add_right (m n k : Nat) : m.gcd (k * m + n) = m.gcd n |
| `Nat.gcd_mul_right_left` | Nat.gcd_mul_right_left (m n : Nat) : (n * m).gcd n = n |
| `Nat.gcd_mul_right_left_of_gcd_eq_one` | Nat.gcd_mul_right_left_of_gcd_eq_one {n m k : Nat} (h : n.gcd m = 1) : (n * k).gcd m = k.gcd m |
| `Nat.gcd_mul_right_right` | Nat.gcd_mul_right_right (m n : Nat) : n.gcd (n * m) = n |
| `Nat.gcd_mul_right_right_of_gcd_eq_one` | Nat.gcd_mul_right_right_of_gcd_eq_one {n m k : Nat} : n.gcd m = 1 → n.gcd (m * k) = n.gcd k |
| `Nat.gcd_mul_right_sub_left` | Nat.gcd_mul_right_sub_left {m n k : Nat} (h : n ≤ k * m) : (k * m - n).gcd m = n.gcd m |
| `Nat.gcd_mul_right_sub_right` | Nat.gcd_mul_right_sub_right {m n k : Nat} (h : n ≤ k * m) : m.gcd (k * m - n) = m.gcd n |
| `Nat.gcd_one_left` | Nat.gcd_one_left (n : Nat) : Nat.gcd 1 n = 1 |
| `Nat.gcd_one_right` | Nat.gcd_one_right (n : Nat) : n.gcd 1 = 1 |
| `Nat.gcd_pow_left_of_gcd_eq_one` | Nat.gcd_pow_left_of_gcd_eq_one {k n m : Nat} (h : n.gcd m = 1) : (n ^ k).gcd m = 1 |
| `Nat.gcd_pow_right_of_gcd_eq_one` | Nat.gcd_pow_right_of_gcd_eq_one {k n m : Nat} (h : n.gcd m = 1) : n.gcd (m ^ k) = 1 |
| `Nat.gcd_rec` | Nat.gcd_rec (m n : Nat) : m.gcd n = (n % m).gcd m |
| `Nat.gcd_self` | Nat.gcd_self (n : Nat) : n.gcd n = n |
| `Nat.gcd_self_add_left` | Nat.gcd_self_add_left (m n : Nat) : (m + n).gcd m = n.gcd m |
| `Nat.gcd_self_add_right` | Nat.gcd_self_add_right (m n : Nat) : m.gcd (m + n) = m.gcd n |
| `Nat.gcd_self_sub_left` | Nat.gcd_self_sub_left {m n : Nat} (h : n ≤ m) : (m - n).gcd m = n.gcd m |
| `Nat.gcd_self_sub_right` | Nat.gcd_self_sub_right {m n : Nat} (h : n ≤ m) : m.gcd (m - n) = m.gcd n |
| `Nat.gcd_sub_left_left_of_dvd` | Nat.gcd_sub_left_left_of_dvd {n k : Nat} (m : Nat) (h : n ≤ k) : m ∣ k → (k - n).gcd m = n.gcd m |
| `Nat.gcd_sub_left_right_of_dvd` | Nat.gcd_sub_left_right_of_dvd {m k : Nat} (n : Nat) (h : m ≤ k) : n ∣ k → n.gcd (k - m) = n.gcd m |
| `Nat.gcd_sub_mul_left_left` | Nat.gcd_sub_mul_left_left {m n k : Nat} (h : m * k ≤ n) : (n - m * k).gcd m = n.gcd m |
| `Nat.gcd_sub_mul_left_right` | Nat.gcd_sub_mul_left_right {m n k : Nat} (h : m * k ≤ n) : m.gcd (n - m * k) = m.gcd n |
| `Nat.gcd_sub_mul_right_left` | Nat.gcd_sub_mul_right_left {m n k : Nat} (h : k * m ≤ n) : (n - k * m).gcd m = n.gcd m |
| `Nat.gcd_sub_mul_right_right` | Nat.gcd_sub_mul_right_right {m n k : Nat} (h : k * m ≤ n) : m.gcd (n - k * m) = m.gcd n |
| `Nat.gcd_sub_right_left_of_dvd` | Nat.gcd_sub_right_left_of_dvd {n k : Nat} (m : Nat) (h : k ≤ n) : m ∣ k → (n - k).gcd m = n.gcd m |
| `Nat.gcd_sub_right_right_of_dvd` | Nat.gcd_sub_right_right_of_dvd {m k : Nat} (n : Nat) (h : k ≤ m) : n ∣ k → n.gcd (m - k) = n.gcd m |
| `Nat.gcd_sub_self_left` | Nat.gcd_sub_self_left {m n : Nat} (h : m ≤ n) : (n - m).gcd m = n.gcd m |
| `Nat.gcd_sub_self_right` | Nat.gcd_sub_self_right {m n : Nat} (h : m ≤ n) : m.gcd (n - m) = m.gcd n |
| `Nat.gcd_succ` | Nat.gcd_succ (x y : Nat) : x.succ.gcd y = (y % x.succ).gcd x.succ |
| `Nat.gcd_zero_left` | Nat.gcd_zero_left (y : Nat) : Nat.gcd 0 y = y |
| `Nat.gcd_zero_right` | Nat.gcd_zero_right (n : Nat) : n.gcd 0 = n |
| `Nat.lcm_assoc` | Nat.lcm_assoc (m n k : Nat) : (m.lcm n).lcm k = m.lcm (n.lcm k) |
| `Nat.lcm_comm` | Nat.lcm_comm (m n : Nat) : m.lcm n = n.lcm m |
| `Nat.lcm_div` | Nat.lcm_div {m n k : Nat} (hkm : k ∣ m) (hkn : k ∣ n) : (m / k).lcm (n / k) = m.lcm n / k |
| `Nat.lcm_eq_left` | Nat.lcm_eq_left {m n : Nat} (h : n ∣ m) : m.lcm n = m |
| `Nat.lcm_eq_mul_div` | Nat.lcm_eq_mul_div (m n : Nat) : m.lcm n = m * n / m.gcd n |
| `Nat.lcm_eq_right` | Nat.lcm_eq_right {m n : Nat} (h : m ∣ n) : m.lcm n = n |
| `Nat.lcm_lcm_self_left_left` | Nat.lcm_lcm_self_left_left (m n : Nat) : (m.lcm n).lcm m = n.lcm m |
| `Nat.lcm_lcm_self_left_right` | Nat.lcm_lcm_self_left_right (m n : Nat) : (n.lcm m).lcm m = n.lcm m |
| `Nat.lcm_lcm_self_right_left` | Nat.lcm_lcm_self_right_left (m n : Nat) : m.lcm (m.lcm n) = m.lcm n |
| `Nat.lcm_lcm_self_right_right` | Nat.lcm_lcm_self_right_right (m n : Nat) : m.lcm (n.lcm m) = m.lcm n |
| `Nat.lcm_mul_gcd` | Nat.lcm_mul_gcd (m n : Nat) : m.lcm n * m.gcd n = m * n |
| `Nat.lcm_mul_left` | Nat.lcm_mul_left (m n k : Nat) : (m * n).lcm (m * k) = m * n.lcm k |
| `Nat.lcm_mul_left_left` | Nat.lcm_mul_left_left (m n : Nat) : (m * n).lcm n = m * n |
| `Nat.lcm_mul_left_left_eq_mul_of_lcm_eq_mul` | Nat.lcm_mul_left_left_eq_mul_of_lcm_eq_mul {n m k : Nat} (h : n.lcm m = n * m) : (k * n).lcm m = n * k.lcm m |
| `Nat.lcm_mul_left_right` | Nat.lcm_mul_left_right (m n : Nat) : n.lcm (m * n) = m * n |
| `Nat.lcm_mul_left_right_eq_mul_of_lcm_eq_mul` | Nat.lcm_mul_left_right_eq_mul_of_lcm_eq_mul {n m k : Nat} (h : n.lcm m = n * m) : n.lcm (k * m) = n.lcm k * m |
| `Nat.lcm_mul_right` | Nat.lcm_mul_right (m n k : Nat) : (m * n).lcm (k * n) = m.lcm k * n |
| `Nat.lcm_mul_right_left` | Nat.lcm_mul_right_left (m n : Nat) : (n * m).lcm n = n * m |
| `Nat.lcm_mul_right_left_eq_mul_of_lcm_eq_mul` | Nat.lcm_mul_right_left_eq_mul_of_lcm_eq_mul {n m k : Nat} (h : n.lcm m = n * m) : (n * k).lcm m = n * k.lcm m |
| `Nat.lcm_mul_right_right` | Nat.lcm_mul_right_right (m n : Nat) : n.lcm (n * m) = n * m |
| `Nat.lcm_mul_right_right_eq_mul_of_lcm_eq_mul` | Nat.lcm_mul_right_right_eq_mul_of_lcm_eq_mul {n m k : Nat} (h : n.lcm m = n * m) : n.lcm (m * k) = n.lcm k * m |
| `Nat.lcm_one_left` | Nat.lcm_one_left (m : Nat) : Nat.lcm 1 m = m |
| `Nat.lcm_one_right` | Nat.lcm_one_right (m : Nat) : m.lcm 1 = m |
| `Nat.lcm_self` | Nat.lcm_self (m : Nat) : m.lcm m = m |
| `Nat.lcm_zero_left` | Nat.lcm_zero_left (m : Nat) : Nat.lcm 0 m = 0 |
| `Nat.lcm_zero_right` | Nat.lcm_zero_right (m : Nat) : m.lcm 0 = 0 |
| `Nat.mod.eq_1` | Nat.mod.eq_1 (x✝ : Nat) : Nat.mod 0 x✝ = 0 |
| `Nat.mod.eq_2` | Nat.mod.eq_2 (x✝ n : Nat) : n.succ.mod x✝ = if x✝ ≤ n.succ then n.succ.modCore x✝ else n.succ |
| `Nat.mod_add_div` | Nat.mod_add_div (m k : Nat) : m % k + k * (m / k) = m |
| `Nat.mod_add_div'` | Nat.mod_add_div' (a b : Nat) : a % b + a / b * b = a |
| `Nat.mod_add_mod` | Nat.mod_add_mod (m n k : Nat) : (m % n + k) % n = (m + k) % n |
| `Nat.mod_add_mod_eq` | Nat.mod_add_mod_eq {a b c : Nat} : a % c + b % c = (a + b) % c + if a % c + b % c < c then 0 else c |
| `Nat.mod_def` | Nat.mod_def (m k : Nat) : m % k = m - k * (m / k) |
| `Nat.mod_div_self` | Nat.mod_div_self (m n : Nat) : m % n / n = 0 |
| `Nat.mod_eq` | Nat.mod_eq (x y : Nat) : x % y = if 0 < y ∧ y ≤ x then (x - y) % y else x |
| `Nat.mod_eq_of_lt` | Nat.mod_eq_of_lt {a b : Nat} (h : a < b) : a % b = a |
| `Nat.mod_eq_sub` | Nat.mod_eq_sub (x w : Nat) : x % w = x - w * (x / w) |
| `Nat.mod_eq_sub_div_mul` | Nat.mod_eq_sub_div_mul {x k : Nat} : x % k = x - x / k * k |
| `Nat.mod_eq_sub_mod` | Nat.mod_eq_sub_mod {a b : Nat} (h : a ≥ b) : a % b = (a - b) % b |
| `Nat.mod_eq_sub_mul_div` | Nat.mod_eq_sub_mul_div {x k : Nat} : x % k = x - k * (x / k) |
| `Nat.mod_eq_zero_of_dvd` | Nat.mod_eq_zero_of_dvd {m n : Nat} (H : m ∣ n) : n % m = 0 |
| `Nat.mod_mod` | Nat.mod_mod (a n : Nat) : a % n % n = a % n |
| `Nat.mod_mod_eq_mod_mod_mod` | Nat.mod_mod_eq_mod_mod_mod {a b c : Nat} (ha : a < c) (hb : b < c) : a % b % c = a % c % (b % c) |
| `Nat.mod_mod_eq_mod_mod_mod_of_dvd` | Nat.mod_mod_eq_mod_mod_mod_of_dvd {a b c : Nat} (hb : b ∣ c) : a % b % c = a % c % (b % c) |
| `Nat.mod_mod_eq_mod_mod_of_dvd` | Nat.mod_mod_eq_mod_mod_of_dvd {a b c : Nat} (h : b ∣ c) : a % b % c = a % c % b |
| `Nat.mod_mod_eq_mod_of_lt_right` | Nat.mod_mod_eq_mod_of_lt_right {a b c : Nat} (ha : a < c) : a % b % c = a % b |
| `Nat.mod_mod_of_dvd` | Nat.mod_mod_of_dvd {c b : Nat} (a : Nat) (h : c ∣ b) : a % b % c = a % c |
| `Nat.mod_mod_of_dvd'` | Nat.mod_mod_of_dvd' {a b c : Nat} (h : b ∣ c) : a % b % c = a % b |
| `Nat.mod_mul` | Nat.mod_mul {a b x : Nat} : x % (a * b) = x % a + a * (x / a % b) |
| `Nat.mod_mul_left_div_self` | Nat.mod_mul_left_div_self (m n k : Nat) : m % (k * n) / n = m / n % k |
| `Nat.mod_mul_left_mod` | Nat.mod_mul_left_mod (a b c : Nat) : a % (b * c) % c = a % c |
| `Nat.mod_mul_mod` | Nat.mod_mul_mod (m n l : Nat) : m % l * n % l = m * n % l |
| `Nat.mod_mul_right_div_self` | Nat.mod_mul_right_div_self (m n k : Nat) : m % (n * k) / n = m / n % k |
| `Nat.mod_mul_right_mod` | Nat.mod_mul_right_mod (a b c : Nat) : a % (b * c) % b = a % b |
| `Nat.mod_one` | Nat.mod_one (x : Nat) : x % 1 = 0 |
| `Nat.mod_pow_succ` | Nat.mod_pow_succ {x b k : Nat} : x % b ^ (k + 1) = x % b ^ k + b ^ k * (x / b ^ k % b) |
| `Nat.mod_self` | Nat.mod_self (n : Nat) : n % n = 0 |
| `Nat.mod_succ` | Nat.mod_succ (n : Nat) : n % n.succ = n |
| `Nat.mod_two_bne_one` | Nat.mod_two_bne_one {a : Nat} : (a % 2 != 1) = (a % 2 == 0) |
| `Nat.mod_two_bne_zero` | Nat.mod_two_bne_zero {a : Nat} : (a % 2 != 0) = (a % 2 == 1) |
| `Nat.mod_two_pow_self` | Nat.mod_two_pow_self {n : Nat} : n % 2 ^ n = n |
| `Nat.mod_two_pow_shiftLeft_mod_two_pow` | Nat.mod_two_pow_shiftLeft_mod_two_pow {a b c : Nat} : (a % 2 ^ c) <<< b % 2 ^ c = a <<< b % 2 ^ c |
| `Nat.mod_zero` | Nat.mod_zero (a : Nat) : a % 0 = a |

## Nat Order / equality (67)

| Lemma | Statement |
|---|---|
| `Nat.eq_add_of_sub_eq` | Nat.eq_add_of_sub_eq {a b c : Nat} (hle : b ≤ a) (h : a - b = c) : a = c + b |
| `Nat.eq_div_of_mul_eq_left` | Nat.eq_div_of_mul_eq_left {c a b : Nat} (hc : c ≠ 0) (h : a * c = b) : a = b / c |
| `Nat.eq_div_of_mul_eq_right` | Nat.eq_div_of_mul_eq_right {c a b : Nat} (hc : c ≠ 0) (h : c * a = b) : a = b / c |
| `Nat.eq_mul_of_div_eq_left` | Nat.eq_mul_of_div_eq_left {a b c : Nat} (H1 : b ∣ a) (H2 : a / b = c) : a = c * b |
| `Nat.eq_mul_of_div_eq_right` | Nat.eq_mul_of_div_eq_right {a b c : Nat} (H1 : b ∣ a) (H2 : a / b = c) : a = b * c |
| `Nat.eq_of_beq_eq_true` | Nat.eq_of_beq_eq_true {n m : Nat} : n.beq m = true → n = m |
| `Nat.eq_of_dvd_of_div_eq_one` | Nat.eq_of_dvd_of_div_eq_one {a b : Nat} (hab : a ∣ b) (h : b / a = 1) : a = b |
| `Nat.eq_of_dvd_of_lt_two_mul` | Nat.eq_of_dvd_of_lt_two_mul {a b : Nat} (ha : a ≠ 0) (hdvd : b ∣ a) (hlt : a < 2 * b) : a = b |
| `Nat.eq_of_le_of_lt_succ` | Nat.eq_of_le_of_lt_succ {n m : Nat} (h₁ : n ≤ m) (h₂ : m < n + 1) : m = n |
| `Nat.eq_of_lt_succ_of_not_lt` | Nat.eq_of_lt_succ_of_not_lt {m n : Nat} (hmn : m < n + 1) (h : ¬m < n) : m = n |
| `Nat.eq_of_mul_eq_mul_left` | Nat.eq_of_mul_eq_mul_left {m k n : Nat} (hn : 0 < n) (h : n * m = n * k) : m = k |
| `Nat.eq_of_mul_eq_mul_right` | Nat.eq_of_mul_eq_mul_right {n m k : Nat} (hm : 0 < m) (h : n * m = k * m) : n = k |
| `Nat.eq_of_testBit_eq` | Nat.eq_of_testBit_eq {x y : Nat} (pred : ∀ (i : Nat), x.testBit i = y.testBit i) : x = y |
| `Nat.eq_one_of_dvd_one` | Nat.eq_one_of_dvd_one {n : Nat} (H : n ∣ 1) : n = 1 |
| `Nat.eq_one_of_mul_eq_one_left` | Nat.eq_one_of_mul_eq_one_left {m n : Nat} (H : m * n = 1) : n = 1 |
| `Nat.eq_one_of_mul_eq_one_right` | Nat.eq_one_of_mul_eq_one_right {m n : Nat} (H : m * n = 1) : m = 1 |
| `Nat.eq_sub_of_add_eq` | Nat.eq_sub_of_add_eq {a b c : Nat} (h : c + b = a) : c = a - b |
| `Nat.eq_sub_of_add_eq'` | Nat.eq_sub_of_add_eq' {a b c : Nat} (h : b + c = a) : c = a - b |
| `Nat.eq_zero_of_add_eq_zero_left` | Nat.eq_zero_of_add_eq_zero_left {n m : Nat} (h : n + m = 0) : m = 0 |
| `Nat.eq_zero_of_add_eq_zero_right` | Nat.eq_zero_of_add_eq_zero_right {n m : Nat} (h : n + m = 0) : n = 0 |
| `Nat.eq_zero_of_dvd_of_div_eq_zero` | Nat.eq_zero_of_dvd_of_div_eq_zero {a b : Nat} (hab : a ∣ b) (h : b / a = 0) : b = 0 |
| `Nat.eq_zero_of_dvd_of_lt` | Nat.eq_zero_of_dvd_of_lt {a b : Nat} (w : a ∣ b) (h : b < a) : b = 0 |
| `Nat.eq_zero_of_gcd_eq_zero_left` | Nat.eq_zero_of_gcd_eq_zero_left {m n : Nat} (H : m.gcd n = 0) : m = 0 |
| `Nat.eq_zero_of_gcd_eq_zero_right` | Nat.eq_zero_of_gcd_eq_zero_right {m n : Nat} (H : m.gcd n = 0) : n = 0 |
| `Nat.eq_zero_of_le_div` | Nat.eq_zero_of_le_div {n m : Nat} (hn : 2 ≤ n) (h : m ≤ m / n) : m = 0 |
| `Nat.eq_zero_of_le_div_two` | Nat.eq_zero_of_le_div_two {n : Nat} (h : n ≤ n / 2) : n = 0 |
| `Nat.eq_zero_of_le_zero` | Nat.eq_zero_of_le_zero {n : Nat} (h : n ≤ 0) : n = 0 |
| `Nat.eq_zero_of_mul_le` | Nat.eq_zero_of_mul_le {n m : Nat} (hb : 2 ≤ n) (h : n * m ≤ m) : m = 0 |
| `Nat.eq_zero_of_not_pos` | Nat.eq_zero_of_not_pos {n : Nat} (h : ¬0 < n) : n = 0 |
| `Nat.eq_zero_of_two_mul_le` | Nat.eq_zero_of_two_mul_le {n : Nat} (h : 2 * n ≤ n) : n = 0 |
| `Nat.eq_zero_of_zero_dvd` | Nat.eq_zero_of_zero_dvd {a : Nat} (h : 0 ∣ a) : a = 0 |
| `Nat.le_antisymm` | Nat.le_antisymm {n m : Nat} (h₁ : n ≤ m) (h₂ : m ≤ n) : n = m |
| `Nat.le_eq` | Nat.le_eq {x y : Nat} : x.le y = (x ≤ y) |
| `Nat.le_zero_eq` | Nat.le_zero_eq (a : Nat) : (a ≤ 0) = (a = 0) |
| `Nat.lt.eq_1` | Nat.lt.eq_1 (n m : Nat) : n.lt m = n.succ.le m |
| `Nat.lt_eq` | Nat.lt_eq {x y : Nat} : x.lt y = (x < y) |
| `Nat.lt_wfRel.eq_1` | Nat.lt_wfRel.eq_1 : Nat.lt_wfRel = { rel := fun x1 x2 => x1 < x2, wf := Nat.lt_wfRel._proof_3 } |
| `Nat.max_add_left_self` | Nat.max_add_left_self {a b : Nat} : max a (b + a) = b + a |
| `Nat.max_add_right_self` | Nat.max_add_right_self {a b : Nat} : max a (a + b) = a + b |
| `Nat.max_assoc` | Nat.max_assoc (a b c : Nat) : max (max a b) c = max a (max b c) |
| `Nat.max_comm` | Nat.max_comm (a b : Nat) : max a b = max b a |
| `Nat.max_def` | Nat.max_def {n m : Nat} : max n m = if n ≤ m then m else n |
| `Nat.max_eq_left` | Nat.max_eq_left {a b : Nat} (h : b ≤ a) : max a b = a |
| `Nat.max_eq_max` | Nat.max_eq_max {b : Nat} (a : Nat) : a.max b = max a b |
| `Nat.max_eq_right` | Nat.max_eq_right {a b : Nat} (h : a ≤ b) : max a b = b |
| `Nat.max_left_comm` | Nat.max_left_comm (a b c : Nat) : max a (max b c) = max b (max a c) |
| `Nat.max_min_distrib_left` | Nat.max_min_distrib_left (a b c : Nat) : max a (min b c) = min (max a b) (max a c) |
| `Nat.max_min_distrib_right` | Nat.max_min_distrib_right (a b c : Nat) : max (min a b) c = min (max a c) (max b c) |
| `Nat.max_right_comm` | Nat.max_right_comm (a b c : Nat) : max (max a b) c = max (max a c) b |
| `Nat.max_self` | Nat.max_self (a : Nat) : max a a = a |
| `Nat.max_zero` | Nat.max_zero (a : Nat) : max a 0 = a |
| `Nat.min_add_left_self` | Nat.min_add_left_self {a b : Nat} : min a (b + a) = a |
| `Nat.min_add_right_self` | Nat.min_add_right_self {a b : Nat} : min a (a + b) = a |
| `Nat.min_assoc` | Nat.min_assoc (a b c : Nat) : min (min a b) c = min a (min b c) |
| `Nat.min_comm` | Nat.min_comm (a b : Nat) : min a b = min b a |
| `Nat.min_def` | Nat.min_def {n m : Nat} : min n m = if n ≤ m then n else m |
| `Nat.min_eq_left` | Nat.min_eq_left {a b : Nat} (h : a ≤ b) : min a b = a |
| `Nat.min_eq_min` | Nat.min_eq_min {b : Nat} (a : Nat) : a.min b = min a b |
| `Nat.min_eq_right` | Nat.min_eq_right {a b : Nat} (h : b ≤ a) : min a b = b |
| `Nat.min_left_comm` | Nat.min_left_comm (a b c : Nat) : min a (min b c) = min b (min a c) |
| `Nat.min_max_distrib_left` | Nat.min_max_distrib_left (a b c : Nat) : min a (max b c) = max (min a b) (min a c) |
| `Nat.min_max_distrib_right` | Nat.min_max_distrib_right (a b c : Nat) : min (max a b) c = max (min a c) (min b c) |
| `Nat.min_right_comm` | Nat.min_right_comm (a b c : Nat) : min (min a b) c = min (min a c) b |
| `Nat.min_self` | Nat.min_self (a : Nat) : min a a = a |
| `Nat.min_self_assoc` | Nat.min_self_assoc {m n : Nat} : min m (min m n) = min m n |
| `Nat.min_self_assoc'` | Nat.min_self_assoc' {m n : Nat} : min n (min m n) = min n m |
| `Nat.min_zero` | Nat.min_zero (a : Nat) : min a 0 = 0 |

## Nat Multiplication / exponentiation (75)

| Lemma | Statement |
|---|---|
| `Nat.mul_add` | Nat.mul_add (n m k : Nat) : n * (m + k) = n * m + n * k |
| `Nat.mul_add_div` | Nat.mul_add_div {m : Nat} (m_pos : m > 0) (x y : Nat) : (m * x + y) / m = x + y / m |
| `Nat.mul_add_mod` | Nat.mul_add_mod (m x y : Nat) : (m * x + y) % m = y % m |
| `Nat.mul_add_mod'` | Nat.mul_add_mod' (a b c : Nat) : (a * b + c) % b = c % b |
| `Nat.mul_add_mod_of_lt` | Nat.mul_add_mod_of_lt {a b c : Nat} (h : c < b) : (a * b + c) % b = c |
| `Nat.mul_add_mod_self_left` | Nat.mul_add_mod_self_left (a b c : Nat) : (a * b + c) % a = c % a |
| `Nat.mul_add_mod_self_right` | Nat.mul_add_mod_self_right (a b c : Nat) : (a * b + c) % b = c % b |
| `Nat.mul_add_mul_div_of_dvd` | Nat.mul_add_mul_div_of_dvd {b d a c : Nat} (hb : b ≠ 0) (hd : d ≠ 0) (hba : b ∣ a) (hdc : d ∣ c) : (a |
| `Nat.mul_add_one` | Nat.mul_add_one (n m : Nat) : n * (m + 1) = n * m + n |
| `Nat.mul_assoc` | Nat.mul_assoc (n m k : Nat) : n * m * k = n * (m * k) |
| `Nat.mul_comm` | Nat.mul_comm (n m : Nat) : n * m = m * n |
| `Nat.mul_div_assoc` | Nat.mul_div_assoc {k n : Nat} (m : Nat) (H : k ∣ n) : m * n / k = m * (n / k) |
| `Nat.mul_div_cancel` | Nat.mul_div_cancel (m : Nat) {n : Nat} (H : 0 < n) : m * n / n = m |
| `Nat.mul_div_cancel'` | Nat.mul_div_cancel' {n m : Nat} (H : n ∣ m) : n * (m / n) = m |
| `Nat.mul_div_cancel_left` | Nat.mul_div_cancel_left (m : Nat) {n : Nat} (H : 0 < n) : n * m / n = m |
| `Nat.mul_div_cancel_left'` | Nat.mul_div_cancel_left' {a b : Nat} (Hd : a ∣ b) : a * (b / a) = b |
| `Nat.mul_div_left` | Nat.mul_div_left (m : Nat) {n : Nat} (H : 0 < n) : m * n / n = m |
| `Nat.mul_div_mul_comm` | Nat.mul_div_mul_comm {a b c d : Nat} (hba : b ∣ a) (hdc : d ∣ c) : a * c / (b * d) = a / b * (c / d) |
| `Nat.mul_div_mul_left` | Nat.mul_div_mul_left {m : Nat} (n k : Nat) (H : 0 < m) : m * n / (m * k) = n / k |
| `Nat.mul_div_mul_right` | Nat.mul_div_mul_right {m : Nat} (n k : Nat) (H : 0 < m) : n * m / (k * m) = n / k |
| `Nat.mul_div_right` | Nat.mul_div_right (n : Nat) {m : Nat} (H : 0 < m) : m * n / m = n |
| `Nat.mul_div_right_comm` | Nat.mul_div_right_comm {a b : Nat} (hba : b ∣ a) (c : Nat) : a * c / b = a / b * c |
| `Nat.mul_div_self_eq_mod_sub_self` | Nat.mul_div_self_eq_mod_sub_self {x k : Nat} : k * (x / k) = x - x % k |
| `Nat.mul_eq` | Nat.mul_eq {x y : Nat} : x.mul y = x * y |
| `Nat.mul_left_cancel` | Nat.mul_left_cancel {n m k : Nat} (np : 0 < n) (h : n * m = n * k) : m = k |
| `Nat.mul_left_comm` | Nat.mul_left_comm (n m k : Nat) : n * (m * k) = m * (n * k) |
| `Nat.mul_max_mul_left` | Nat.mul_max_mul_left (a b c : Nat) : max (a * b) (a * c) = a * max b c |
| `Nat.mul_max_mul_right` | Nat.mul_max_mul_right (a b c : Nat) : max (a * c) (b * c) = max a b * c |
| `Nat.mul_min_mul_left` | Nat.mul_min_mul_left (a b c : Nat) : min (a * b) (a * c) = a * min b c |
| `Nat.mul_min_mul_right` | Nat.mul_min_mul_right (a b c : Nat) : min (a * c) (b * c) = min a b * c |
| `Nat.mul_mod` | Nat.mul_mod (a b n : Nat) : a * b % n = a % n * (b % n) % n |
| `Nat.mul_mod_left` | Nat.mul_mod_left (m n : Nat) : m * n % n = 0 |
| `Nat.mul_mod_mod` | Nat.mul_mod_mod (m n l : Nat) : m * (n % l) % l = m * n % l |
| `Nat.mul_mod_mul_left` | Nat.mul_mod_mul_left (z x y : Nat) : z * x % (z * y) = z * (x % y) |
| `Nat.mul_mod_mul_right` | Nat.mul_mod_mul_right (z x y : Nat) : x * z % (y * z) = x % y * z |
| `Nat.mul_mod_right` | Nat.mul_mod_right (m n : Nat) : m * n % m = 0 |
| `Nat.mul_mul_mul_comm` | Nat.mul_mul_mul_comm (a b c d : Nat) : a * b * (c * d) = a * c * (b * d) |
| `Nat.mul_one` | Nat.mul_one (n : Nat) : n * 1 = n |
| `Nat.mul_pow` | Nat.mul_pow (a b n : Nat) : (a * b) ^ n = a ^ n * b ^ n |
| `Nat.mul_pred` | Nat.mul_pred (n m : Nat) : n * m.pred = n * m - n |
| `Nat.mul_right_cancel` | Nat.mul_right_cancel {n m k : Nat} (mp : 0 < m) (h : n * m = k * m) : n = k |
| `Nat.mul_right_comm` | Nat.mul_right_comm (n m k : Nat) : n * m * k = n * k * m |
| `Nat.mul_self_sub_mul_self_eq` | Nat.mul_self_sub_mul_self_eq (a b : Nat) : a * a - b * b = (a + b) * (a - b) |
| `Nat.mul_sub` | Nat.mul_sub (n m k : Nat) : n * (m - k) = n * m - n * k |
| `Nat.mul_sub_div` | Nat.mul_sub_div (x n p : Nat) (h₁ : x < n * p) : (n * p - (x + 1)) / n = p - (x / n + 1) |
| `Nat.mul_sub_div_of_dvd` | Nat.mul_sub_div_of_dvd {b c : Nat} (hc : c ≠ 0) (hcb : c ∣ b) (a : Nat) : (c * a - b) / c = a - b / c |
| `Nat.mul_sub_left_distrib` | Nat.mul_sub_left_distrib (n m k : Nat) : n * (m - k) = n * m - n * k |
| `Nat.mul_sub_mod` | Nat.mul_sub_mod {x n p : Nat} (h : x < n * p) : (n * p - (x + 1)) % n = n - (x % n + 1) |
| `Nat.mul_sub_mul_div_of_dvd` | Nat.mul_sub_mul_div_of_dvd {b d a c : Nat} (hb : b ≠ 0) (hd : d ≠ 0) (hba : b ∣ a) (hdc : d ∣ c) : (a |
| `Nat.mul_sub_one` | Nat.mul_sub_one (n m : Nat) : n * (m - 1) = n * m - n |
| `Nat.mul_sub_right_distrib` | Nat.mul_sub_right_distrib (n m k : Nat) : (n - m) * k = n * k - m * k |
| `Nat.mul_succ` | Nat.mul_succ (n m : Nat) : n * m.succ = n * m + n |
| `Nat.mul_two` | Nat.mul_two (n : Nat) : n * 2 = n + n |
| `Nat.mul_zero` | Nat.mul_zero (n : Nat) : n * 0 = 0 |
| `Nat.pow_add` | Nat.pow_add (a m n : Nat) : a ^ (m + n) = a ^ m * a ^ n |
| `Nat.pow_add'` | Nat.pow_add' (a m n : Nat) : a ^ (m + n) = a ^ n * a ^ m |
| `Nat.pow_add_one` | Nat.pow_add_one (n m : Nat) : n ^ (m + 1) = n ^ m * n |
| `Nat.pow_add_one'` | Nat.pow_add_one' {m n : Nat} : m ^ (n + 1) = m * m ^ n |
| `Nat.pow_div` | Nat.pow_div {x m n : Nat} (h : n ≤ m) (hx : 0 < x) : x ^ m / x ^ n = x ^ (m - n) |
| `Nat.pow_eq` | Nat.pow_eq {m n : Nat} : m.pow n = m ^ n |
| `Nat.pow_gcd_pow` | Nat.pow_gcd_pow {k n m : Nat} : (n ^ k).gcd (m ^ k) = n.gcd m ^ k |
| `Nat.pow_gcd_pow_of_gcd_eq_one` | Nat.pow_gcd_pow_of_gcd_eq_one {k l n m : Nat} (h : n.gcd m = 1) : (n ^ k).gcd (m ^ l) = 1 |
| `Nat.pow_lcm_pow` | Nat.pow_lcm_pow {k n m : Nat} : (n ^ k).lcm (m ^ k) = n.lcm m ^ k |
| `Nat.pow_mod` | Nat.pow_mod (a b n : Nat) : a ^ b % n = (a % n) ^ b % n |
| `Nat.pow_mul` | Nat.pow_mul (a m n : Nat) : a ^ (m * n) = (a ^ m) ^ n |
| `Nat.pow_mul'` | Nat.pow_mul' (a m n : Nat) : a ^ (m * n) = (a ^ n) ^ m |
| `Nat.pow_one` | Nat.pow_one (a : Nat) : a ^ 1 = a |
| `Nat.pow_pred_mul` | Nat.pow_pred_mul {x w : Nat} (h : 0 < w) : x ^ (w - 1) * x = x ^ w |
| `Nat.pow_right_comm` | Nat.pow_right_comm (a m n : Nat) : (a ^ m) ^ n = (a ^ n) ^ m |
| `Nat.pow_sub_mul_pow` | Nat.pow_sub_mul_pow (a : Nat) {m n : Nat} (h : m ≤ n) : a ^ (n - m) * a ^ m = a ^ n |
| `Nat.pow_succ` | Nat.pow_succ (n m : Nat) : n ^ m.succ = n ^ m * n |
| `Nat.pow_succ'` | Nat.pow_succ' {m n : Nat} : m ^ n.succ = m * m ^ n |
| `Nat.pow_two` | Nat.pow_two (a : Nat) : a ^ 2 = a * a |
| `Nat.pow_two_sub_pow_two` | Nat.pow_two_sub_pow_two (a b : Nat) : a ^ 2 - b ^ 2 = (a + b) * (a - b) |
| `Nat.pow_zero` | Nat.pow_zero (n : Nat) : n ^ 0 = 1 |

## Nat Zero / one / numerals (34)

| Lemma | Statement |
|---|---|
| `Nat.one_add` | Nat.one_add (n : Nat) : 1 + n = n.succ |
| `Nat.one_add_sub_one` | Nat.one_add_sub_one (n : Nat) : 1 + n - 1 = n |
| `Nat.one_and_eq_mod_two` | Nat.one_and_eq_mod_two (n : Nat) : 1 &&& n = n % 2 |
| `Nat.one_mod` | Nat.one_mod (n : Nat) : 1 % (n + 2) = 1 |
| `Nat.one_mod_two_pow` | Nat.one_mod_two_pow {n : Nat} (h : 0 < n) : 1 % 2 ^ n = 1 |
| `Nat.one_mul` | Nat.one_mul (n : Nat) : 1 * n = n |
| `Nat.one_pow` | Nat.one_pow (n : Nat) : 1 ^ n = 1 |
| `Nat.one_shiftLeft` | Nat.one_shiftLeft (n : Nat) : 1 <<< n = 2 ^ n |
| `Nat.one_sub` | Nat.one_sub (n : Nat) : 1 - n = if n = 0 then 1 else 0 |
| `Nat.two_mul` | Nat.two_mul (n : Nat) : 2 * n = n + n |
| `Nat.two_pow_add_eq_or_of_lt` | Nat.two_pow_add_eq_or_of_lt {i b : Nat} (b_lt : b < 2 ^ i) (a : Nat) : 2 ^ i * a + b = 2 ^ i * a \|\|\| b |
| `Nat.two_pow_pred_add_two_pow_pred` | Nat.two_pow_pred_add_two_pow_pred {w : Nat} (h : 0 < w) : 2 ^ (w - 1) + 2 ^ (w - 1) = 2 ^ w |
| `Nat.two_pow_pred_mod_two_pow` | Nat.two_pow_pred_mod_two_pow {w : Nat} (h : 0 < w) : 2 ^ (w - 1) % 2 ^ w = 2 ^ (w - 1) |
| `Nat.two_pow_pred_mul_two` | Nat.two_pow_pred_mul_two {w : Nat} (h : 0 < w) : 2 ^ (w - 1) * 2 = 2 ^ w |
| `Nat.two_pow_sub_one_mod_two` | Nat.two_pow_sub_one_mod_two {n : Nat} : (2 ^ n - 1) % 2 = 1 % 2 ^ n |
| `Nat.two_pow_sub_two_pow_pred` | Nat.two_pow_sub_two_pow_pred {w : Nat} (h : 0 < w) : 2 ^ w - 2 ^ (w - 1) = 2 ^ (w - 1) |
| `Nat.two_pow_succ` | Nat.two_pow_succ (n : Nat) : 2 ^ (n + 1) = 2 ^ n + 2 ^ n |
| `Nat.zero_add` | Nat.zero_add (n : Nat) : 0 + n = n |
| `Nat.zero_and` | Nat.zero_and (x : Nat) : 0 &&& x = 0 |
| `Nat.zero_div` | Nat.zero_div (b : Nat) : 0 / b = 0 |
| `Nat.zero_eq` | Nat.zero_eq : Nat.zero = 0 |
| `Nat.zero_max` | Nat.zero_max (a : Nat) : max 0 a = a |
| `Nat.zero_min` | Nat.zero_min (a : Nat) : min 0 a = 0 |
| `Nat.zero_mod` | Nat.zero_mod (b : Nat) : 0 % b = 0 |
| `Nat.zero_mul` | Nat.zero_mul (n : Nat) : 0 * n = 0 |
| `Nat.zero_or` | Nat.zero_or (x : Nat) : 0 \|\|\| x = x |
| `Nat.zero_pow` | Nat.zero_pow {n : Nat} (H : 0 < n) : 0 ^ n = 0 |
| `Nat.zero_pow_of_pos` | Nat.zero_pow_of_pos (n : Nat) (h : 0 < n) : 0 ^ n = 0 |
| `Nat.zero_shiftLeft` | Nat.zero_shiftLeft (n : Nat) : 0 <<< n = 0 |
| `Nat.zero_shiftRight` | Nat.zero_shiftRight (n : Nat) : 0 >>> n = 0 |
| `Nat.zero_sub` | Nat.zero_sub (n : Nat) : 0 - n = 0 |
| `Nat.zero_sub_one` | Nat.zero_sub_one : 0 - 1 = 0 |
| `Nat.zero_testBit` | Nat.zero_testBit (i : Nat) : Nat.testBit 0 i = false |
| `Nat.zero_testBit` | Nat.zero_testBit (i : Nat) : Nat.testBit 0 i = false |

---

## Regenerating this list

```lean
-- /tmp/dump_names.lean  —  run with: lake env lean /tmp/dump_names.lean > names.txt
import Lean
open Lean

partial def internalish : Name → Bool
  | .str p s => internalish p ∨ s.front == '_' ∨ s.take 6 == "match_" ∨ s.take 6 == "proof_"
  | .num p _ => internalish p
  | .anonymous => false

partial def stripForalls : Expr → Expr
  | .forallE _ _ b _ => stripForalls b
  | e => e

def secondIsInternal (n : Name) : Bool :=
  match n with
  | .str (.str _ s2) _ => s2 == "Internal"
  | _ => false

#eval show CoreM Unit from do
  let env ← getEnv
  let mut names : Array String := #[]
  for (n, ci) in env.constants.toList do
    if (n.getRoot == `Nat ∨ n.getRoot == `Int) ∧ n.getNumParts > 1
       ∧ ¬internalish n ∧ ¬secondIsInternal n then
      if stripForalls ci.type |>.getAppFn.isConstOf ``Eq then
        names := names.push (toString n)
  let sorted := names.qsort (fun a b => a < b)
  for s in sorted do IO.println s
```

Then turn each name into a statement:

```bash
awk '{print "#check " $0}' names.txt > check_all.lean
sed -i '1i set_option pp.width 200' check_all.lean
lake env lean check_all.lean
```

To check a different toolchain version, edit `lean-toolchain` and rerun — the list will differ.

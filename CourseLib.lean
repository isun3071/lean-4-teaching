import CourseLib.Shims
import CourseLib.Extras

/-!
# Course library

Everything the problem sets use beyond core Lean, for problem sets that do not import
Mathlib. It is split in two because a problem set that does import Mathlib (for ℝ) must
avoid half of it:

* `CourseLib.Shims` reimplements pieces of Mathlib under Mathlib's names: the classical logic
  lemmas, `Set`, `nth_rewrite`. It collides with Mathlib and must never be imported
  alongside it.
* `CourseLib.Extras` holds definitions Mathlib does not supply under these names: `factorial`,
  `choose`, well-ordering. It is safe either way.

So a problem set imports `CourseLib` without Mathlib, or `Mathlib.Basic.Real.Basic` (say) plus
`CourseLib.Extras` with it.
-/

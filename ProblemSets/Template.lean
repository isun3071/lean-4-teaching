/-
# Template for a new problem set

Copy this file to `ProblemSets/PS<n>.lean` and replace the examples.
This is a working file to demonstrate intended functionality of the autograder
as it stands. (Open an issue on the repository if something does not work.)

Building and uploading:

    ./gradescope/make_autograder.sh <name of your gradescope zip> <location of your stencil>

Upload `gradescope/<name of your gradescope zip>` under Configure Autograder.
Then, under the assignment's settings, set memory to 6 GB and CPU to 4. (Please
do this to avoid memory limits or timeouts on the autograder!)

Oftentimes, you can just copy your student facing Lean handout file and have that
serve as a stencil, with some additions specified below.
-/

-- ## 1. Imports
--
-- Here you can import parts of Mathlib that certain proofs need. Not every tactic or
-- theorem is supported by Lean natively without imports. Do not `import Mathlib` in its
-- entirety as that risks memory timeouts during grading (trust me, I tried. :( )
-- Instead, import pieces of Mathlib that you absolutely need to grade this problem set, like
-- so:

import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring
import AutograderLib    -- You MUST import this for the autograder to work! Student handouts do not need it

-- NOTE: Extraneous imports beyond what the stencil imports will fail the submission and give a 0,
-- so please make sure students know to not tamper with imports.

-- ## 2. Definitions and provided lemmas
--
-- Anything students need goes here, as in the handout. Lemmas you prove here may be
-- used in any problem, whatever the allowlists say, as long as students don't
-- change them.

def IsEven (n : ℤ) : Prop := ∃ k : ℤ, 2 * k = n

theorem even_add_even (m n : ℤ) : IsEven m → IsEven n → IsEven (m + n) := by
  intro hm hn
  obtain ⟨a, ha⟩ := hm
  obtain ⟨b, hb⟩ := hn
  use a + b
  rewrite [← ha, ← hb]
  ring

-- ## 3. Autograded problems
--
-- To declare a problem autogradable, add the following headers above the theorem:
--   autogradedProof 10          points awardable
--   allowedTactics #[...]       a predefined set of tactics you allow.
--                               Leave this out to allow any tactic. (However, note that leaving this
--                               out allows `grind`, `simp`, and other one-liner cheat codes!)
--   allowedTheorems #[...]      a predefined set of theorems you allow besides the ones you specify.
--                               Leave this out to allow any theorem.

-- You do not need to write solutions here. The autograder simply checks if the
-- student solved the exact goals you specified in each problem however they want
-- provided they follow the tactic and theorem restrictions you listed. Therefore,
-- this stencil can leave `sorry` placeholders.

-- (Don't worry, student submissions with `sorry` in them do not award credit)
--
-- Before uploading, it's highly recommended that you run `exact?` on each problem to see
-- if a one-liner theorem solves the problem. If it does, you might want to ban the
-- theorem in question or reword the problem.


-- Examples of certain problems are below (replace them as you see fit):

@[autogradedProof 10,
  allowedTactics #["intro", "unfold", "obtain", "use", "rewrite", "ring"]]
theorem problem_1 (n : ℤ) : IsEven n → IsEven (n ^ 2) := by
  sorry

@[autogradedProof 10,
  allowedTactics #["intro", "have", "exact"],
  allowedTheorems #["add_lt_add_left", "add_lt_add_right", "lt_trans"]]
theorem problem_2 (a b c d : ℝ) : a < b → c < d → a + c < b + d := by
  sorry


-- ## 4. Problems graded by hand
--
-- When students write their own statement ("state and prove..."), there is nothing to
-- compare against. `gradedByHand` scores it zero and shows graders the student's
-- version at the end of the results. Add a manually graded question for its points.

@[gradedByHand]
theorem problem_3 : True := by  -- students replace `True` with their own statement
  sorry

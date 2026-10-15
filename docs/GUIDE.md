# Guide

Learn more about this autograder beyond the README and `ProblemSets/Template.lean` here :)

## Glossary

* **Problem set:** the file you write and give the autograder. It is the handout with
  `import AutograderLib` and an `@[...]` line above each graded problem.
* **Handout:** the file you give students, i.e. the problem set without those additions above and
problems left with `sorry` placeholders.
* **Submission:** the handout as a student hands it back with their answers filled in.
* **`Template.lean`:** an example problem set to copy when you write your own.

## Attributes

```lean
@[autogradedProof 10, allowedTactics #["intro", "have", "exact"],
  allowedTheorems #["add_lt_add_left", "add_lt_add_right", "lt_trans"]]
theorem problem_2 (a b c d : ℝ) : a < b → c < d → a + c < b + d := by
  sorry
```

* `autogradedProof` declares that this problem will be graded automatically. Specify a number
  to dictate how many points to award. You must specify a positive number here to avoid
  errors in your problem set.
* `allowedTactics` specifies what tactics your students may use. Note that `rw` and
  `rewrite` are different tactics and bullets are `"cdot"`. Otherwise, spell them exactly
  as you'd use them. Omitting this allows every tactic, including `grind` and `simp` that can
  solve many exercises in one line. It is recommended you use this to ensure students learn 
  how to actually prove theorems in Lean instead of shortcutting.
* `allowedTheorems` lists the only library theorems a proof may invoke (i.e. theorems that come
  with Lean or as part of Mathlib). Theorems a tactic finds are not included, but definitions,
  theorems, and lemmas your problem set provides are allowed across all problems. Note that 
  misspelling names prevents your problem set from compiling.
* `allowedLemmas` lists the only theorems from your problem set itself (other problems and
  lemmas you provide) a proof may use, e.g. `allowedLemmas #["problem_3", "problem_4"]` on
  problem 5 rules out problems 1 and 2. Omitting it allows all of them; `#[]` allows none.
  Lemmas the student writes are still fine, but they are held to the same list. Any use
  counts, including one `simp` makes of a lemma you tagged `@[simp]`.
* On any problem with `allowedTactics` or `allowedTheorems`, a submission that defines its
  own `notation`, `macro`, `macro_rules`, `syntax`, `elab` or `attribute` is refused: those let a proof
  show a permitted name while something else does the work. The refusal covers every
  restricted problem in the file, since a macro can re-point any tactic and nothing in the
  source says which proofs it touched, so tell students not to write their own macros.
  Notation your problem set declares is yours and stays fine, as long as the student leaves
  it unchanged, and a problem with no allowlists is unaffected -- so if you want students
  writing macros, leave the allowlists off that problem.
* `autogradedDef` grades a definition rather than a proof, and is inherited from the
  upstream autograder. It checks the student's definition is *definitionally equal* to
  yours, so a correct but differently-written implementation fails, and every theorem
  mentioning that definition then fails statement matching too. Your problem set must also
  contain the real implementation, so it is no longer safe to hand out. Most courses are
  better served by putting the definition in the handout and grading proofs about it.
* `gradedByHand` denotes a problem you want to manually grade. Add a manual grading entry
  to award points for problems you denote with this header. 

Grading simply verifies that the student submission correctly solves the goal specified
in the problem within your tactic and theorem restrictions. This means that you do not need to write
an answer key in your problem set here.

*Note: Most results taught in discrete math classes are already theorems in Mathlib and are ∴ one `exact`
away. It helps to run `exact?` to see if such a theorem exists for your problem; if one exists, 
consider banning it or rewording your problem.*

## Imports

**Never `import Mathlib` whole.** Grading is killed for memory even at Gradescope's 6 GB
max. Only import the modules a problem set really needs. For example:

* `Mathlib.Basic.Real.Basic`: ℝ and inequalities, with `nth_rewrite`, `norm_num` and
  `grind`.
* `Mathlib.Basic.Logic.Basic`: logic laws. Add `Mathlib.Tactic.NthRewrite` for
  `nth_rewrite`.
* `Mathlib.Tactic.Ring`: the `ring` tactic.

Student submissions must not import anything your handout does not. An extra import fails the
submission and scores 0 even when the file compiles, since it can strengthen a tactic you
permit; the student is told which import to remove. Leaving one out is not refused, because it
can only take things out of scope.

`CourseLib` is an optional lightweight library for problem sets that avoid Mathlib; see `CourseLib.lean`
if you want to use it.

## Testing a problem set

Grade a solution that keeps to your allowlists such as:

```bash
lake exe autograder --local {solution path} {problem set path to grade against}
```

To test several submissions at once, start each file with its expected score, such as
`-- expect: 10/20`, and run `./run_suite.sh {problem set path} {submission files...}`. 
It notes any file that scores differently.

## Uploading

`make_autograder.sh` takes the zip's name and the problem set, which must be inside
`ProblemSets/`. The name defaults to `autograder.zip` and the problem set
to `assignment_path` in `gradescope/config.json`. Then you can upload that zip as is to 
Gradescope.

## What graders and students see

Students see each problem's result in the problem set's order. Failures come with a message 
indicating why, such as a Lean error, a disallowed tactic or theorem used, an incomplete proof, or more.

Hand-graded problems arrive as 0 point entries. In the hidden autograder output, you'll see
quick audit lines such as:

```
[audit] problem_2  tactics: intro, have, exact  |  theorems cited: add_lt_add_left, add_lt_add_right, lt_trans
[audit] exam_9  tactics: intro, exact  |  theorems cited: none  |  own lemmas: sneaky (tactics: grind)
```


## Troubleshooting

**"All my submissions failed or grading didn't finish!"**

1. Did you configure your autograder to use 6 GB of memory and 4 CPUs?  You can find that setting
    in the assignment's Settings page (NOT the "Configure Autograder" page!). If you see an exit 
    status of 137 or an error mentioning `olean.private` in the debugging output, it means you ran out of memory.
2. Did you upload the zip again after your last change? The `commit:` line above the results shows which
    build graded the submission.
3. Does your problem set `import Mathlib` whole? Instead, import only the modules
    you need since it won't fit.

**"A student somehow got a 0 on this assignment?"**

1. Did they change the import lines? Their result tells them the imports they need to put back.
2. Did they accidentally submit another assignment file or your unmodified handout with `sorry`s? 

**"A problem is missing from the results!"**

1. Does your problem set compile with nothing but `sorry` warnings? A mistake in a grading
    attribute, such as `autogradedProof` without a positive number, will cause an error and 
    prevent the problem from being graded.

**"A solution I know is right doesn't work!"**

1. Does your own solution pass when you grade it locally? If not, you probably disallowed
    a tactic or theorem your problem needs.
2. Did the student write `rw` where you allowed `rewrite`, or use bullets without
   `"cdot"` on the list?
3. Did the submission define its own notation or macro? That is refused on any problem
   with an allowlist.
4. Does it compile in the student's editor but not here? Their editor may run a newer
   Mathlib than this repository.

**"Grading somehow stopped partway?"**

1. Read the log above the results. The last `[phase]` line denotes the step that was
   running before it stopped.

## Upgrading Lean and Mathlib

Change the version in `lean-toolchain`, `autograder/lean-toolchain`, `lakefile.toml`,
`autograder/lakefile.lean` and `gradescope/setup.sh`, run `lake update`, and rerun the
examples. Check that the Mathlib module names your problem sets import still exist.

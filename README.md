# lean-4-teaching

Lean "4" Teaching is a Gradescope autograder for Lean 4 proofs. 

Students fill in their answers in the handout you give them and upload the file to Gradescope. Each problem is awarded points iff the proof is correct and contains only the tactics, theorems and earlier problems you allow.

### Features
* **Accepts all valid submissions:** This grader uses [Comparator](https://github.com/leanprover/comparator) to check proofs with Lean's kernel, which means you don't need to write an answer key.
In fact, you can reuse the handout you give to students (with some modifications).
* **Tactic, theorem, and previous problem allowlists:** Limit the tactics and theorems your students may use. You can also restrict which earlier problems a problem may cite.
For example, if you have a problem 4b and you only want to allow problem 4a as a reference, you can restrict that.
* **Independent problem grading:** If one problem fails, it does not affect the rest of the submission. 
* **Unfinished previous problem citation:** If students cite unfinished previous problems in their current problem solution, they are not penalized for that. The grader assumes those previous problems are axioms when grading the current problem.
* **Hand-graded problem specification:** Problems where the student must declare a theorem
and other such problems can be graded by hand.
* **Built for Gradescope's limits:** Only the Mathlib modules an assignment imports are
  downloaded to avoid Mathlib memory timeouts. That being said, you should still allot the maximum
  possible memory and CPU to this grader (6GB RAM and 4 CPUs).

## Try it

Install [elan](https://github.com/leanprover/elan), then:

```bash
lake update && lake build && lake build autograder
./run_suite.sh ProblemSets/Template.lean examples/*.lean
./run_suite.sh ProblemSets/TemplateCourseLib.lean examples/courselib/*.lean
./run_suite.sh ProblemSets/DiscreteMath.lean examples/discrete/*.lean
./run_suite.sh ProblemSets/Givens.lean examples/givens/*.lean
```

This grades the sample submissions in `examples/` and validates each score
against what's expected.

## Create your own pset:

Copy `ProblemSets/Template.lean` and write your problems, or
`ProblemSets/TemplateCourseLib.lean` for a course that avoids Mathlib. Comments are in there
to help you walk through configuration. Then:

```bash
./gradescope/make_autograder.sh {your zip file name} ProblemSets/{your problem set file name}
```

Upload `gradescope/{your zip file name}` under Configure Autograder. Then, under the assignment's settings, set memory to 6 GB and CPU to 4. (Please do this to avoid memory limits or timeouts on the autograder!)

If you want more information, [docs/GUIDE.md](docs/GUIDE.md) covers imports, testing, graders' views, troubleshooting, and more.

## Limitations

* Each problem is all or nothing. For partial credit, split a problem into
  separately graded theorems.
* A theorem reached through dot notation, such as `h.symm` or `(foo h).mp`, is not checked against the
  theorem list.
* Theorems that `simp`, `grind`, `exact?` or `norm_num` find are
  controlled only by keeping those tactics off the tactic list. It is recommended that you
  disallow `simp`, `grind`, `exact?` to ensure students learn how to actually prove theorems
  in Lean instead of shortcutting.
* Submissions are not sandboxed as Gradescope's kernel (4.14) predates the features it needs.
* A submission that imports anything your problem set doesn't will fail and score 0 no matter if it compiles or not. A submission can leave imports out, though.
* A submission that defines its own `notation`, `macro`, `macro_rules`, `syntax`, `elab` or `attribute`
  scores 0 on every problem with an allowlist, not just the problem that uses it, since a macro
  can quietly redefine any tactic and the source does not show which proofs it touched.
  Tell students not to write their own macros. If you want to teach macro writing, leave
  the allowlists off that problem.
* This grader is fixed to Lean version 4.35. Lean has monthly releases and there is a weekly CI job
  (`try-lean.yml`) that tests the latest release and hands you the upgrade as a patch when it
  passes. 

## Issues

If you encounter any issues with this grader you can always submit a GitHub issue.

## License

`autograder/` and `gradescope/` derive from Robert Y. Lewis's
[lean4-autograder-main](https://github.com/robertylewis/lean4-autograder-main) and
[lean4_autograder](https://github.com/robertylewis/lean4_autograder), used and modified
under the Apache 2.0 license in each directory.

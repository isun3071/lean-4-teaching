# lean-4-teaching

"Lean 4 Teaching" is a Gradescope autograder for Lean 4 proofs. 

Students fill in their answers in the handout you give them and upload the file to Gradescope. Each problem is awarded points iff the proof is correct and contains only the tactics and theorems you allow.

### Features
* **Accepts all valid submissions:** This grader uses [Comparator](https://github.com/leanprover/comparator) to check proofs with Lean's kernel, which means you don't need to write an answer key.
In fact, you can reuse the handout you give to students (with some modifications).
* **Tactic and theorem allowlists:** Limit the tactics and theorems your students may use
for a problem.
* **Independent problem grading:** If one problem fails, it does not affect the rest of the submission. 
* **Hand-graded problem specification:** Problems where the student must declare a theorem
and other such problems can be graded by hand.
* **Built for Gradescope's limits:** Only the Mathlib modules an assignment imports are
  downloaded to avoid Mathlib memory timeouts.

## Try it

Install [elan](https://github.com/leanprover/elan), then:

```bash
lake update && lake build && lake build autograder
./run_suite.sh ProblemSets/Template.lean examples/*.lean
```

This grades the sample submissions in `examples/` and validates each score
against what's expected.

## Create your own pset:

Copy `ProblemSets/Template.lean` and write your problems. Comments are in there
to help you walk through configuration. Then:

```bash
./gradescope/make_autograder.sh {your zip file name} ProblemSets/{your problem set file name}
```

Upload `gradescope/{your zip file name}` under Configure Autograder. Then, under the assignment's settings, set memory to 6 GB and CPU to 4. (Please do this to avoid memory limits or timeouts on the autograder!)

If you want more information, [docs/GUIDE.md](docs/GUIDE.md) covers imports, testing, graders' views, troubleshooting, and more.

## Limitations

* Each problem is all or nothing. For partial credit, split a problem into
  separately graded theorems.
* A theorem reached through dot notation, such as `h.symm`, is not checked against the
  theorem list.
* Theorems that `simp`, `grind`, `exact?` or `norm_num` find are
  controlled only by keeping those tactics off the tactic list. It is recommended that you
  disallow `simp`, `grind`, `exact?` to ensure students learn how to actually prove theorems
  in Lean instead of shortcutting.
* Submissions are not sandboxed as Gradescope's kernel (4.14) predates the features it needs.
* Submissions with modified imports will fail and score 0. A student submission must import 
  exactly what you specify in your problem set.
* A submission that defines its own `notation`, `macro`, `macro_rules`, `syntax` or `elab`
  scores 0 on every problem with an allowlist, not just the problem that uses it: a macro
  can silently re-point any tactic and the source does not show which proofs it touched.
  Tell students not to write their own macros. If you want to teach macro writing, leave
  the allowlists off that problem.
* This grader is fixed to Lean version 4.34. 

## Issues

If you encounter any issues with this grader you can always submit a GitHub issue.

## License

`autograder/` and `gradescope/` derive from Robert Y. Lewis's
[lean4-autograder-main](https://github.com/robertylewis/lean4-autograder-main) and
[lean4_autograder](https://github.com/robertylewis/lean4_autograder), used and modified
under the Apache 2.0 license in each directory.

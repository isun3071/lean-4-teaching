# lean-4-teaching

A Gradescope autograder for Lean 4 proofs. Students fill in the `sorry`s in a problem set
and upload the file; each problem earns its points if the proof is correct and uses only
the tactics and theorems the instructor allows.

* **Any correct proof counts.** There is no answer key: the problem set's statements are
  the reference, and [Comparator](https://github.com/leanprover/comparator) re-checks each
  proof with Lean's kernel.
* **Tactic and theorem allowlists**, enforced through students' own helper lemmas.
* **Problems are graded independently.** A broken attempt at one costs only that one.
* **Hand-graded problems** ("state and prove...") are shown to graders as written.
* **Built for Gradescope's limits.** Only the Mathlib modules an assignment imports are
  downloaded, so images build in minutes and grading takes about a minute.

## Try it

Install [elan](https://github.com/leanprover/elan), then:

```bash
lake update && lake build && lake build autograder
./run_suite.sh ProblemSets/Template.lean examples/*.lean
```

This grades the sample submissions in `examples/` against the template and checks each
against its expected score.

## A new problem set

Copy `ProblemSets/Template.lean`, whose comments explain each part, and write your
problems. Then:

```bash
./gradescope/make_autograder.sh ps1.zip ProblemSets/PS1.lean
```

Upload `gradescope/ps1.zip` under Configure Autograder. Under the assignment's
**Settings**, set memory to 6 GB, CPU to 4, and autograder points to the sum of the
problems' points. The defaults are too small, and grading fails on them.

[docs/GUIDE.md](docs/GUIDE.md) covers imports, the browser editor, testing, what
graders see, and troubleshooting.

## Limits

* Each problem scores all or nothing. For partial credit, split a problem into
  separately graded theorems.
* A theorem reached through dot notation, such as `h.symm`, is not checked against the
  theorem list.
* Theorems that `simp`, `grind`, `exact?` or `norm_num` find by themselves are
  controlled only by keeping those tactics off the tactic list.
* Submissions are not sandboxed: Gradescope's kernel (4.14) predates the features
  sandboxing tools need.

## License

`autograder/` and `gradescope/` derive from Robert Y. Lewis's
[lean4-autograder-main](https://github.com/robertylewis/lean4-autograder-main) and
[lean4_autograder](https://github.com/robertylewis/lean4_autograder), used and modified
under the Apache 2.0 license in each directory.

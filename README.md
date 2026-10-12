# lean-4-teaching

A Gradescope autograder for Lean 4 proofs. Students fill in the `sorry`s in a problem set
and upload the file; each problem earns its points if the proof is correct and uses only
the tactics and theorems the instructor allows.

* **Any correct proof counts.** There is no answer key: the problem set's statements are
  the reference, and [Comparator](https://github.com/leanprover/comparator) re-checks each
  proof with Lean's kernel.
* **Tactic and theorem allowlists**, enforced through students' own helper lemmas. A
  tactic or theorem not on a problem's list fails that problem, with a message naming it.
* **Problems are graded independently.** A broken attempt at one problem costs only that
  problem.
* **Hand-graded problems** ("state and prove...") are shown to graders as written.
* **Built for Gradescope's limits.** Only the Mathlib modules an assignment imports are
  downloaded, so images build in minutes and grading takes about a minute per submission.

```
ProblemSets/   problem-set stencils; Template.lean is an annotated example
examples/      sample submissions against the template, each with its expected score
CourseLib.lean a small library for problem sets that avoid Mathlib (CourseLib/ holds it)
autograder/    the grading engine
gradescope/    builds the upload zip
docs/          lemma tables for students
run_suite.sh   grades a folder of submissions and checks their scores
```

## Setup

Install [elan](https://github.com/leanprover/elan), then run `lake update && lake build`
in this directory. To see it work:

```bash
lake build autograder
./run_suite.sh ProblemSets/Template.lean examples/*.lean
```

## Writing a problem set

Start from `ProblemSets/Template.lean`. A stencil is the problem set as students receive
it, with proofs left as `sorry`, plus `import AutograderLib` and an attribute line above
each graded problem:

```lean
@[autogradedProof 10, allowedTactics #["intro", "have", "exact"],
  allowedTheorems #["add_lt_add_left", "add_lt_add_right", "lt_trans"]]
theorem problem_2 (a b c d : ℝ) : a < b → c < d → a + c < b + d := by
  sorry
```

* `autogradedProof` sets the points.
* `allowedTactics` lists the only tactics allowed, spelled as students type them. `rw` and
  `rewrite` are different tactics, and bullets are `"cdot"`. Omitted, any tactic is
  allowed, including `grind` and `simp`, which solve many exercises in one word.
* `allowedTheorems` lists the only library theorems a proof may name, in the proof or in
  a lemma of the student's own that it uses. Theorems a tactic finds by itself are not
  named, so keep such tactics off `allowedTactics`. Lemmas the stencil proves, and the
  other problems, are always allowed. `"add_comm"` also allows `Nat.add_comm`, and a
  misspelled name stops the stencil compiling.
* `gradedByHand` marks a problem where students write their own statement. It scores
  nothing, and graders see the student's version, with whether it compiles and uses
  `sorry`, at the end of the results.

Grading compares each student's statement with the stencil's, so the stencil is the
reference and is safe to hand out.

Most results taught in discrete mathematics are already theorems in Mathlib, one `exact`
away. Run `exact?` on each problem before release: if it finds a one-line proof, so will
students, so restate the problem or keep that theorem off its list.

### Imports

The autograder image holds prebuilt files for exactly the Mathlib modules the stencil
imports. A submission importing anything else fails to load and scores zero, and is
told which import lines to restore. The handout students receive must import the same
modules as the stencil. Local testing does not catch a mismatch, because a development
machine usually has more of Mathlib built than the image.

Never `import Mathlib` whole: grading is killed for memory even at Gradescope's 6 GB
maximum. Import the modules a problem set needs:

* `Mathlib.Basic.Real.Basic`: ℝ and inequalities, with `nth_rewrite`, `norm_num` and
  `grind`.
* `Mathlib.Basic.Logic.Basic`: logic laws. Add `Mathlib.Tactic.NthRewrite` for
  `nth_rewrite`.
* `Mathlib.Tactic.Ring`: the `ring` tactic.

These are the module names from Mathlib v4.34 on (`Mathlib.Data.Real.Basic` and
`Mathlib.Logic.Basic` before), which is what this project pins. Lemma names follow
Mathlib, where `add_lt_add_left h c` proves `a + c < b + c`, adding on the right.

A problem set without Mathlib can `import CourseLib` instead: classical logic laws, `Set`,
`nth_rewrite`, `factorial`, `choose` and well-ordering, built on core Lean. Never import
it alongside Mathlib, since it defines some of the same names. `CourseLib.Extras`
(factorial, choose, well-ordering) is safe with either.

### Handouts for the browser editor

Students can complete a handout at [live.lean-lang.org](https://live.lean-lang.org),
which runs Mathlib's newest version. The handout must then import only Mathlib modules,
and lemmas a problem set needs are stated and proved in the handout itself. A handout
can be opened from a link: `https://live.lean-lang.org/#url=` followed by the raw URL of
the file.

The editor moves ahead of the version pinned here, so a proof that checks in the browser
can use a lemma this pin lacks. Check reference solutions both in the editor and with
the grader.

## Checking a problem set

Grade a solution that keeps to your lists, submission first and stencil second:

```bash
lake exe autograder --local my_solution.lean ProblemSets/PS1.lean
```

Swapped arguments grade the wrong file without warning. A solution that fails here means
the lists make the problem unsolvable, which nothing else reports.

To test several submissions at once, start each file with its expected score, such as
`-- expect: 10/20`, and run `./run_suite.sh STENCIL FILES...`. It flags any file that
scores differently. `examples/` shows the format.

## Building and uploading

```bash
./gradescope/make_autograder.sh ps1.zip ProblemSets/PS1.lean
```

Upload `gradescope/ps1.zip` under Configure Autograder. The stencil must be inside
`ProblemSets/`. Both arguments are optional: the name defaults to `autograder.zip`, and
the stencil to `assignment_path` in `gradescope/config.json`.

Then, under the assignment's **Settings**, change three defaults, for every new
assignment:

* **Memory: 6 GB**, the maximum. Grading peaks around 3 GB without Mathlib and 4.4 GB
  with ℝ.
* **CPU: 4**, the maximum. Less is slow enough to look broken.
* **Autograder points:** the sum of the `autogradedProof` values.

Uploading rebuilds the image; use "Regrade All Submissions" to regrade existing work.

Too little memory shows up as exit status 137, or as Lean failing to read its own files:

```
failed to read file '.../lib/lean/Lean/Message.olean.private'
```

Lean memory-maps these files, so the mapping fails under memory pressure. It looks like
a corrupt installation, but it means the container is too small. Do not check with
`free`, which reports the host's memory inside a container. Read the container's limit:

```bash
cat /sys/fs/cgroup/memory.max 2>/dev/null || cat /sys/fs/cgroup/memory/memory.limit_in_bytes
```

## What graders and students see

Students see each problem's result, in the stencil's order. A failure says what the
proof used and what is allowed, or shows Lean's error. Hand-graded problems follow as
0-point entries.

Above the results, in output students never see, graders get one line per problem:

```
[audit] problem_2  tactics: intro, have, exact  |  theorems cited: add_lt_add_left, add_lt_add_right, lt_trans
[audit] exam_9  tactics: intro, exact  |  theorems cited: none  |  own lemmas: sneaky (tactics: grind)
```

It changes no score; it makes shortcuts stand out. When grading itself fails, a full log
appears there instead, with a `[phase]` line per step; the last one shows where it
stopped.

Every results entry is visible to students on purpose. Gradescope withholds a student's
total score whenever any entry is hidden from them, even one worth no points.

## Limits

* Each problem scores all or nothing. For partial credit, split a problem into
  separately graded theorems.
* A theorem reached through dot notation, such as `h.symm` for `Eq.symm h`, is not
  checked against `allowedTheorems`.
* Theorems that `simp`, `grind`, `exact?` or `norm_num` find by themselves are
  controlled only by keeping those tactics off `allowedTactics`.
* Submissions are not sandboxed on Gradescope. Its kernel (4.14) predates the
  features the sandboxing tools rely on, so code that runs while a submission compiles
  is contained only by Gradescope's own per-submission container.

## Upgrading Lean and Mathlib

Change the version in `lean-toolchain`, `autograder/lean-toolchain`, `lakefile.toml`,
`autograder/lakefile.lean` and `gradescope/setup.sh`, run `lake update`, and rerun the
examples. Check the Mathlib module names your stencils import still exist.

## License

`autograder/` and `gradescope/` derive from Robert Y. Lewis's
[lean4-autograder-main](https://github.com/robertylewis/lean4-autograder-main) and
[lean4_autograder](https://github.com/robertylewis/lean4_autograder), used and modified
under the Apache 2.0 license in each directory.

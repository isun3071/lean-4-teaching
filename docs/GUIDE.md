# Guide

The details behind the README. `ProblemSets/Template.lean` is the place to start; this
covers what it does not.

## Attributes

```lean
@[autogradedProof 10, allowedTactics #["intro", "have", "exact"],
  allowedTheorems #["add_lt_add_left", "add_lt_add_right", "lt_trans"]]
theorem problem_2 (a b c d : ℝ) : a < b → c < d → a + c < b + d := by
  sorry
```

* `autogradedProof` sets the points.
* `allowedTactics` lists the only tactics allowed, spelled as students type them. `rw` and
  `rewrite` are different tactics, and bullets are `"cdot"`. Omitted, any tactic is
  allowed, including `grind` and `simp`, which solve many exercises in one word. Where
  it is set, a proof must be written with tactics.
* `allowedTheorems` lists the only library theorems a proof may name, in the proof or in
  a lemma of the student's own that it uses. Theorems a tactic finds by itself are not
  named, so keep such tactics off `allowedTactics`. Lemmas the stencil proves, and the
  other problems, are always allowed. `"add_comm"` also allows `Nat.add_comm`, and a
  misspelled name stops the stencil compiling.
* `gradedByHand` marks a problem where students write their own statement. It scores
  nothing, and graders see the student's version, with whether it compiles and uses
  `sorry`, at the end of the results. Add a manually graded question for its points.

Grading compares each student's statement with the stencil's, so the stencil is the
reference and is safe to hand out.

Most results taught in discrete mathematics are already theorems in Mathlib, one `exact`
away. Run `exact?` on each problem before release: if it finds a one-line proof, so will
students, so restate the problem or keep that theorem off its list.

## Imports

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

## Handouts for the browser editor

Students can complete a handout at [live.lean-lang.org](https://live.lean-lang.org),
which runs Mathlib's newest version. The handout must then import only Mathlib modules,
and lemmas a problem set needs are stated and proved in the handout itself. A handout
can be opened from a link: `https://live.lean-lang.org/#url=` followed by the raw URL of
the file.

The editor moves ahead of the version pinned here, so a proof that checks in the browser
can use a lemma this pin lacks. Check reference solutions both in the editor and with
the grader.

## Testing a problem set

Grade a solution that keeps to your lists, submission first and stencil second:

```bash
lake exe autograder --local my_solution.lean ProblemSets/PS1.lean
```

Swapped arguments grade the wrong file without warning. A solution that fails here means
the lists make the problem unsolvable, which nothing else reports.

To test several submissions at once, start each file with its expected score, such as
`-- expect: 10/20`, and run `./run_suite.sh STENCIL FILES...`. It flags any file that
scores differently. `examples/` shows the format.

## Uploading

`make_autograder.sh` takes the zip's name and the stencil, which must be inside
`ProblemSets/`. Both are optional: the name defaults to `autograder.zip`, and the stencil
to `assignment_path` in `gradescope/config.json`.

Gradescope's memory, CPU and timeout settings are per assignment, under the assignment's
Settings rather than Configure Autograder. Grading peaks around 3 GB without Mathlib and
4.4 GB with ℝ, so 6 GB, the maximum, is needed; with less CPU than 4 it is slow enough to
look broken.

Uploading rebuilds the image; use "Regrade All Submissions" to regrade existing work.

## What graders and students see

Students see each problem's result, in the stencil's order. A failure says what the
proof used and what is allowed, or shows Lean's error. Hand-graded problems follow as
0-point entries.

Above the results, in output students never see, graders get one line per problem:

```
[audit] problem_2  tactics: intro, have, exact  |  theorems cited: add_lt_add_left, add_lt_add_right, lt_trans
[audit] exam_9  tactics: intro, exact  |  theorems cited: none  |  own lemmas: sneaky (tactics: grind)
```

It changes no score; it makes shortcuts stand out.

Every results entry is visible to students on purpose. Gradescope withholds a student's
total score whenever any entry is hidden from them, even one worth no points.

## Troubleshooting

**Out of memory.** It shows up as exit status 137, or as Lean failing to read its own
files:

```
failed to read file '.../lib/lean/Lean/Message.olean.private'
```

Lean memory-maps these files, so the mapping fails under memory pressure. It looks like
a corrupt installation, but it means the container is too small. Do not check with
`free`, which reports the host's memory inside a container. Read the container's limit:

```bash
cat /sys/fs/cgroup/memory.max 2>/dev/null || cat /sys/fs/cgroup/memory/memory.limit_in_bytes
```

**Grading failed or timed out.** The full log replaces the grader summary above the
results, with a `[phase]` line per step; the last one shows where it stopped.

## Upgrading Lean and Mathlib

Change the version in `lean-toolchain`, `autograder/lean-toolchain`, `lakefile.toml`,
`autograder/lakefile.lean` and `gradescope/setup.sh`, run `lake update`, and rerun the
examples. Check the Mathlib module names your stencils import still exist.

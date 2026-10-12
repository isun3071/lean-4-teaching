# Grading engine

`Main.lean` is the grader and `AutograderLib.lean` holds the attributes stencils use.
The repository's top-level README describes how to use them.

This directory derives from
[robertylewis/lean4-autograder-main](https://github.com/robertylewis/lean4-autograder-main)
and is used under the Apache 2.0 license in `LICENSE`. It has been substantially
modified. The additions include tactic and theorem allowlists enforced through
students' helper lemmas, per-problem grading of files with errors, hand-graded
problems, and messages written for students. Proof checking still goes through
[Comparator](https://github.com/leanprover/comparator).

import Lean
import AutograderLib
-- Ensures Mathlib is compiled when the container is being uploaded:
-- import Mathlib
open Lean IO System Elab Command Meta Lean.Meta Lean.Elab.Tactic

-- Don't change these
-- The autograder is vendored into the course repository and required by path, so it
-- lives here rather than under `.lake/packages/` where a git dependency would be
-- unpacked. Paths are relative to the Lake workspace root, which is where the
-- `autograder` executable runs.
def agPkgPathPrefix : FilePath := "autograder"
def solutionDirName := "AutograderTests"
def submissionUploadDir : FilePath := "/autograder/submission"
def resultsJsonPath : FilePath := ".." / "results" / "results.json"
/-- The proof summary, for run_autograder to print above the results: see `gradeSubmission`. -/
def proofSummaryPath : FilePath := "/tmp/proof_summary.txt"
-- These are arbitrary
def solutionModuleName := "Solution"
def submissionFileName := "Assignment.lean"

-- These are generated based on the above
def sheetModuleName := s!"{solutionDirName}.{solutionModuleName}".toName
def sheetFileName := s!"{solutionModuleName}.lean"
-- "autograder/AutograderTests/Solution.lean"
def sheetFile : FilePath := agPkgPathPrefix / solutionDirName / sheetFileName

/-! ## Comparator scratch space

Grading verdicts are produced by [Comparator](https://github.com/leanprover/comparator),
which independently rebuilds the relevant declarations in a sandboxed subprocess,
re-serializes them through `lean4export`, and replays them through the Lean kernel,
rather than trusting our own in-process elaboration of the submission the way this
autograder used to. `ComparatorGrading` is a scratch Lake library, regenerated on
every grading run, holding:

* `Ref.lean` -- a verbatim copy of the sheet, wrapped in a namespace so its
  declarations are reachable under a qualified name that can never collide with a
  submission's own declarations of the same (bare) name.
* `Solution.lean` -- whatever is being graded (the submission, or a `--test`
  fixture), verbatim. Used directly as `solution_module` for proof exercises.
* `ChallengeN.lean` / `PinN.lean` (one numbered pair per definition exercise) --
  `ChallengeN` holds a trivial (`rfl`-provable) reference "pin" theorem; `PinN`
  imports `Solution` and restates the same pin theorem for whatever the
  submission actually provided. Each definition exercise gets its own pair of
  *separate modules* rather than sharing one file: Lean's compilation is
  whole-file, so if one exercise's pin theorem is genuinely unprovable (an
  expected, normal outcome for a wrong submission), that must not fail the
  build of -- and thus cascade into rejecting -- every other exercise that
  happens to share the file.
-/

def comparatorLibDirName := "ComparatorGrading"
def comparatorLibDir : FilePath := agPkgPathPrefix / comparatorLibDirName
def comparatorRefFile : FilePath := comparatorLibDir / "Ref.lean"
def comparatorSolutionFile : FilePath := comparatorLibDir / "Solution.lean"
def comparatorConfigFile : FilePath := comparatorLibDir / "config.json"
def comparatorRefModule := s!"{comparatorLibDirName}.Ref"
def comparatorSolutionModule := s!"{comparatorLibDirName}.Solution"
def comparatorReferenceNamespace := "ComparatorReference"
def comparatorBinary : FilePath :=
  ".lake" / "packages" / "comparator" / ".lake" / "build" / "bin" / "comparator"
def lean4exportBinary : FilePath :=
  ".lake" / "packages" / "lean4export" / ".lake" / "build" / "bin" / "lean4export"
def fakeLandrunScript : FilePath :=
  ".lake" / "packages" / "comparator" / "scripts" / "fake-landrun.sh"

def comparatorPinChallengeFile (i : Nat) : FilePath := comparatorLibDir / s!"Challenge{i}.lean"
def comparatorPinChallengeModule (i : Nat) : String := s!"{comparatorLibDirName}.Challenge{i}"
def comparatorPinFile (i : Nat) : FilePath := comparatorLibDir / s!"Pin{i}.lean"
def comparatorPinModule (i : Nat) : String := s!"{comparatorLibDirName}.Pin{i}"

/-- Prints a phase marker and flushes immediately.

Lean buffers stdout, so a process killed partway through -- by the container's memory
limit or the assignment's timeout, the two ways grading dies without explaining itself --
takes whatever it had printed with it. That is how a run that got most of the way
through becomes indistinguishable from one that never started. Flushing each marker
means the last line that *did* arrive names the phase that was still running. -/
def phase (msg : String) : IO Unit := do
  IO.println s!"[phase] {msg}"
  (← IO.getStdout).flush

-- Used for non-exercise-specific results (e.g., global failures)
structure FailureResult where
  output : String
  score : Float := 0.0
  output_format : String := "text"
  deriving ToJson

-- Used for exercise-specific results
structure ExerciseResult where
  name : Name
  score : Float
  status : String
  output : String
  deriving ToJson

def ExerciseResult.print (er : ExerciseResult) : IO Unit := do
  let score :=
    match JsonNumber.fromFloat? er.score with
    | Sum.inl e => Json.str e
    | Sum.inr n => Json.num n
  IO.println s!"{er.name}:"
  IO.println s!"  {er.status} ({score} points)"
  IO.println s!"  {er.output}"

structure ExerciseResultDebug extends ExerciseResult where
  sheet_name : Name         -- Name of the exercise in the sheet
  expected_status : String  -- Expected status of the test, "passed" or "failed"
  output_log : String       -- Additional information about the autograder's decision

inductive Color : Type
  | red
  | green

def addANSICode (c : Color) (s : String) : String :=
  let code := match c with
    | .red => "31"
    | .green => "32"
  s!"\x1b[1m[{code}m{s}[0m"

def ExerciseResultDebug.print (er : ExerciseResultDebug) : IO Unit := do
  IO.print s!"{er.name}: "
  if er.status == er.expected_status then
    IO.println (addANSICode Color.green "Passed")
  else
    IO.println (addANSICode Color.red "Failed")
  IO.println s!"  {er.output_log}"

structure GradingResults where
  tests : Array ExerciseResult
  output: String
  output_format: String := "text"
  deriving ToJson

def GradingResults.print (gr : GradingResults) : IO Unit := do
  IO.println gr.output
  for er in gr.tests do
    er.print
    IO.println ""

def Lean.Environment.moduleDataOf? (module : Name) (env : Environment)
  : Option ModuleData := do
  let modIdx : Nat ← env.getModuleIdx? module
  env.header.moduleData[modIdx]?

def Lean.Environment.moduleOfDecl? (decl : Name) (env : Environment)
  : Option Name := do
  let modIdx : Nat ← env.getModuleIdxFor? decl
  env.header.moduleNames[modIdx]?

def defaultValidAxioms : Array Name :=
  #["Classical.choice".toName,
    "Quot.sound".toName,
    "propext".toName,
    "funext".toName]

-- Ideally, we could format our Gradescope output nicely as HTML and escape
-- inserted file names/error messages/etc. Unfortunately, Gradescope doesn't
-- handle pre-escaped HTML well (it tries to re-escape it), so until a
-- workaround for that issue is found, we'll stick with plain text.
def escapeHtml (s : String) :=
  [("<", "&lt;"), (">", "&gt;"), ("&", "&amp;"), ("\"", "&quot;")].foldl
    (λ acc (char, repl) => acc.replace char repl) s

-- Throw error and show it to the student, optionally providing additional
-- information for the instructor only
-- TODO this fails with --local if ../results doesn't exist
def exitWithError {α} (errMsg : String) (instructorInfo: String := "")
  : IO α := do
  let result : FailureResult := {output := errMsg}
  -- Outside a real Gradescope container (e.g. local dev testing outside `--local`'s
  -- own results-printing path, or an error raised before we even know we're in
  -- `--local` mode, like a bad CLI argument), `../results` won't exist. Don't let
  -- that write failure mask the actual error below with a confusing, unrelated
  -- "no such file or directory" instead.
  try
    IO.FS.writeFile resultsJsonPath (toJson result).pretty
  catch _ => pure ()
  throw <| IO.userError (errMsg ++ "\n" ++ instructorInfo)

/-- Axioms declared in the sheet and tagged `@[legalAxiom]`, in addition to whatever
`@[validAxioms]` specifies for `name` (or `defaultValidAxioms` if unspecified). This is
the `permitted_axioms` list handed to Comparator. Comparator independently enforces
both that only these axioms are used *and* (since it structurally compares every
permitted axiom's declaration between challenge and solution) that a submission can't
smuggle in its own same-named axiom with a different, exploitable type. -/
def legalAxiomNames (sheet : Environment) : Array Name :=
  sheet.constants.toList.filterMap (fun (n, info) =>
    match info with
    | .axiomInfo _ => if legalAxiomAttr.hasTag sheet n then some n else none
    | _ => none) |>.toArray

def permittedAxiomsFor (sheet : Environment) (name : Name) : Array Name :=
  let validAxioms :=
    if let some t := validAxiomsAttr.getParam? sheet name then t
    else defaultValidAxioms
  validAxioms ++ legalAxiomNames sheet

structure ComparatorConfig where
  challenge_module : String
  solution_module : String
  theorem_names : Array String
  definition_names : Array String := #[]
  permitted_axioms : Array String
  enable_nanoda : Bool := false
  deriving ToJson

/-- Splits off the leading `import` lines of a trusted (instructor-authored) Lean
source file, so the remainder can be re-wrapped in a namespace. This is purely
textual (not parser-driven), which is fine here since it is only ever applied to
trusted sheet content, never to a submission. -/
def splitLeadingImports (contents : String) : String × String :=
  let isHeaderLine (s : String) : Bool :=
    let t := s.trimAscii.copy
    t.isEmpty || t.startsWith "import " || t == "import"
  let lines := contents.splitOn "\n"
  let (headerLines, rest) := lines.span isHeaderLine
  (String.intercalate "\n" headerLines, String.intercalate "\n" rest)

/-- Writes `ComparatorGrading/Ref.lean`: the sheet's own imports, followed by a
verbatim copy of the rest of the sheet wrapped in `namespace ComparatorReference`. -/
def writeComparatorRef (sheetContents : String) : IO Unit := do
  let (imports, body) := splitLeadingImports sheetContents
  IO.FS.createDirAll comparatorLibDir
  IO.FS.writeFile comparatorRefFile <|
    imports ++ "\n\nnamespace " ++ comparatorReferenceNamespace ++ "\n"
      ++ body ++ "\n\nend " ++ comparatorReferenceNamespace ++ "\n"

/-- Writes `ComparatorGrading/Solution.lean`: whatever is being graded (submission or
`--test` fixture), verbatim -- deliberately *not* importing `ComparatorGrading.Ref`.
Solution.lean never itself references `ComparatorReference.*` (only `PinN.lean` does,
and it already imports `Ref` directly); importing it here anyway would leak the sheet's
own `notation`/`macro` declarations into the submission's scope, since those aren't
namespace-scoped the way ordinary declarations are -- even though `Ref.lean` wraps the
sheet in `namespace ComparatorReference`. A submission that (legitimately or
maliciously) redeclares the same notation would then collide with the sheet's own
copy, breaking the whole shared file instead of just the one exercise. -/
def writeComparatorSolution (bodyContents : String) : IO Unit := do
  IO.FS.createDirAll comparatorLibDir
  IO.FS.writeFile comparatorSolutionFile bodyContents

/-- One "pin" obligation: verify that `subName` (as it appears in whatever is being
graded -- the submission, or a `--test` candidate) is provably equal to the sheet's
reference declaration `refName`. -/
structure PinTarget where
  subName : Name
  refName : Name
  /-- Pretty-printed type of `refName` (fully-qualified names/universes, so it
  doesn't depend on any `open`/notation state), used to give the *challenge*-side
  alias `def subName : refTypeText := ComparatorReference.refName` an explicit
  type ascription. Without this, a polymorphic `refName` (leading implicit
  arguments) can't be aliased point-free -- Lean eagerly tries to instantiate the
  leading implicit as soon as the identifier appears unapplied, instead of
  generalizing it back into the alias's own signature. -/
  refTypeText : String
  /-- Safety keyword needed for the alias to type-check; must match `refName`'s
  own safety. -/
  safetyKeyword : String

def pinTheoremName (t : PinTarget) : String := s!"{t.subName}__pin"

/-- The pin theorem states `@subName = @refName` (all arguments explicit via `@`)
rather than the bare `subName = refName`, for the same reason the challenge-side
alias needs a type ascription: with a polymorphic (implicit-argument) `subName`,
`Eq`'s own implicit type argument can't be inferred from two unapplied,
still-polymorphic terms. `@` gives both sides a concrete, closed type. -/
def pinTheoremStatement (t : PinTarget) : String :=
  s!"@{t.subName} = @{comparatorReferenceNamespace}.{t.refName}"

/-- Content of `ChallengeN.lean`: a reference-forwarding alias plus the (trivially
true, proved by `rfl`) pin theorem, giving Comparator a same-named, same-typed
statement on the trusted side to structurally compare the submission's own pin
theorem against. -/
def PinTarget.challengeContent (t : PinTarget) : String :=
  s!"import {comparatorRefModule}\n\n" ++
  s!"{t.safetyKeyword}def {t.subName} : {t.refTypeText} := {comparatorReferenceNamespace}.{t.refName}\n" ++
  s!"theorem {pinTheoremName t} : {pinTheoremStatement t} := by rfl\n"

/-- Content of `PinN.lean`: imports the (already-built) `Solution` module for
`t.subName`, then restates the pin theorem with `tacticBlock` as its proof. -/
def PinTarget.solutionContent (t : PinTarget) (tacticBlock : String) : String :=
  s!"import {comparatorRefModule}\nimport {comparatorSolutionModule}\n\n" ++
  s!"theorem {pinTheoremName t} : {pinTheoremStatement t} := by\n" ++ tacticBlock

def safetyKeywordFor (info : ConstantInfo) : String :=
  if info.isUnsafe then "unsafe " else if info.isPartial then "partial " else ""

/-- Pretty-prints `t` (a type) using fully-qualified names and explicit universes,
so the result doesn't depend on any `open`/notation state and can be spliced
directly into a freshly-generated file as a type ascription. -/
def renderType (sheet : Environment) (t : Expr) : IO String := do
  let ctx : Core.Context := { fileName := "", fileMap := default }
  let cstate : Core.State := { env := sheet }
  let helper : MetaM String :=
    withOptions (fun o => o.setBool `pp.fullNames true |>.setBool `pp.universes true) do
      return (← Meta.ppExpr t).pretty
  let (s, _, _) ← MetaM.toIO helper ctx cstate
  return s

/-- Writes the `ChallengeN.lean`/`PinN.lean` pair for one definition exercise. -/
def writeComparatorPin (i : Nat) (t : PinTarget) (tacticBlock : String) : IO Unit := do
  IO.FS.createDirAll comparatorLibDir
  IO.FS.writeFile (comparatorPinChallengeFile i) t.challengeContent
  IO.FS.writeFile (comparatorPinFile i) (t.solutionContent tacticBlock)

/-- Set once, at the top of `main`, from `cfg.localRun`. Read by
`resolveLocalLandrunFallback` below; see its doc comment for why this is a ref rather
than a parameter threaded through the whole call chain down to `runComparator`. -/
initialize localRunRef : IO.Ref Bool ← IO.mkRef false

/-- Whether a landrun-compatible binary is resolvable right now: either
`COMPARATOR_LANDRUN` is already set (Comparator will use it directly, whatever it
points to -- an explicit choice we never override), or a bare `landrun` resolves via
`PATH`. -/
def landrunIsResolvable : IO Bool := do
  if (← IO.getEnv "COMPARATOR_LANDRUN").isSome then
    return true
  try
    let out ← IO.Process.output { cmd := "landrun", args := #["--version"] }
    return out.exitCode == 0
  catch _ => return false

/-- Whether `resolveLocalLandrunFallback` has already printed its warning this run, so
it only prints once (it's otherwise called once per Comparator invocation, i.e. once
per exercise). -/
initialize landrunFallbackWarnedRef : IO.Ref Bool ← IO.mkRef false

/-- In `--local` mode only -- never during a real Gradescope run, where `setup.sh`
guarantees a real, sandboxing `landrun` is on `PATH`, and where silently degrading
sandboxing would be a serious problem, not a convenience -- fall back to Comparator's
own `scripts/fake-landrun.sh` dev shim (which provides NO sandboxing at all) when
neither `COMPARATOR_LANDRUN` nor a bare `landrun` resolves. This exists so `lake exe
autograder --local ...` works out of the box for course staff iterating on a stencil,
who would otherwise see every single exercise fail with a misleading "could not be
built" message and no indication that the actual problem is an unrelated missing
binary. Returns the env override to hand to `runComparator`, if any; prints a loud
warning the first time it activates. -/
def resolveLocalLandrunFallback : IO (Array (String × Option String)) := do
  if !(← localRunRef.get) then return #[]
  if ← landrunIsResolvable then return #[]
  let alreadyWarned ← landrunFallbackWarnedRef.get
  landrunFallbackWarnedRef.set true
  if ← fakeLandrunScript.pathExists then
    if !alreadyWarned then
      IO.println <| "WARNING: `landrun` was not found on PATH and COMPARATOR_LANDRUN is "
        ++ "not set. Falling back to Comparator's scripts/fake-landrun.sh dev shim for "
        ++ "this --local run, which provides NO SANDBOXING. This is fine for locally "
        ++ "testing your own problem set and submission files, but must never be relied on to "
        ++ "grade an untrusted submission -- install a real `landrun` (or point "
        ++ "COMPARATOR_LANDRUN at one) for that."
    return #[("COMPARATOR_LANDRUN", some fakeLandrunScript.toString)]
  else
    if !alreadyWarned then
      IO.println <| "WARNING: `landrun` was not found on PATH, COMPARATOR_LANDRUN is "
        ++ "not set, and Comparator's dev shim isn't available either (expected at "
        ++ s!"{fakeLandrunScript}). Comparator will fail to run."
    return #[]

def comparatorRunEnv : IO (Array (String × Option String)) := do
  let lean4export ← IO.FS.realPath lean4exportBinary
  let landrunFallback ← resolveLocalLandrunFallback
  return #[("COMPARATOR_LEAN4EXPORT", some lean4export.toString)] ++ landrunFallback

/-- The `lake` to shell out to.

Upstream invoked lake two different ways: `compileAutograder` by absolute path under
`/root/.elan`, and `runComparator` by the bare name, trusting PATH. On Gradescope the
absolute path is what works -- the elan installer wires PATH up through shell profiles
that a non-interactive grading script never sources -- so the bare name was a per-
exercise gamble on something the other call site had already decided not to rely on.
Resolve once, preferring the container's elan install and falling back to PATH (which
is what a developer running this locally has). -/
def lakeCmd : IO String := do
  let elanLake : FilePath := "/root" / ".elan" / "bin" / "lake"
  if ← elanLake.pathExists then return elanLake.toString
  return "lake"

/-- Seconds any single Comparator invocation may take before it is killed.

Generous: a legitimate exercise takes seconds, so this only fires on something that has
genuinely stopped making progress. Without it a Comparator call that blocks -- on a
subprocess of its own, or on a sandbox that never returns -- hangs the whole submission
forever, producing no verdict for any exercise and no output to say which one was
responsible, since the grader is still "running" and has therefore reported nothing. -/
def comparatorTimeoutSecs := 300

/-- Runs `comparator` on `cfg` and returns whether it succeeded, plus a log of its
output for debugging/instructor info. -/
def runComparator (cfg : ComparatorConfig) : IO (Bool × String) := do
  IO.FS.writeFile comparatorConfigFile (toJson cfg).pretty
  let comparatorPath ← IO.FS.realPath comparatorBinary
  let env ← comparatorRunEnv
  -- `timeout` rather than a bare invocation: see `comparatorTimeoutSecs`. Exit code
  -- 124 is how it reports having killed the command.
  let out ← IO.Process.output {
    cmd := "timeout"
    args := #[toString comparatorTimeoutSecs, ← lakeCmd, "env",
              comparatorPath.toString, comparatorConfigFile.toString]
    env
  }
  let log :=
    if out.exitCode == 124 then
      s!"Comparator did not finish within {comparatorTimeoutSecs}s and was killed.\n"
        ++ out.stdout ++ "\n" ++ out.stderr
    else out.stdout ++ "\n" ++ out.stderr
  return (out.exitCode == 0, log)

/-- Coarse categorization of why Comparator rejected a submission, derived by pattern
matching against its own diagnostic output (`Comparator/Compare.lean`,
`Comparator/Axioms.lean`, `Main.lean` in the pinned Comparator version). This is a
best-effort enrichment of the student-facing message, never a correctness dependency:
Comparator's exact wording is an internal implementation detail that could change in a
future version, and any log that doesn't match a known pattern always falls back to
`.unknown`, which reproduces today's generic message. -/
inductive ComparatorFailureReason
  | timedOut
  | usesSorry
  | illegalAxiom (axiomName : String)
  | wrongStatement
  | kernelRejected
  | buildFailed
  | unknown

/-- Pulls the axiom name out of Comparator's `Illegal axiom detected: 'name'` message. -/
def extractIllegalAxiomName (log : String) : Option String := do
  let parts := log.splitOn "Illegal axiom detected: '"
  let rest ← parts[1]?
  let name := (rest.splitOn "'").headD ""
  if name.isEmpty then none else some name

def classifyComparatorFailure (log : String) : ComparatorFailureReason :=
  if (log.splitOn "did not finish within").length > 1 then .timedOut
  else if let some axiomName := extractIllegalAxiomName log then
    if axiomName == "sorryAx" then .usesSorry else .illegalAxiom axiomName
  else if #["theorem statement do not match", "constant kind don't match",
      "does not match between challenge and target", "is not a theorem",
      "is not a definition"].any (fun needle => (log.splitOn needle).length > 1) then
    .wrongStatement
  else if (log.splitOn "Child exited with").length > 1 then
    .buildFailed
  else if (log.splitOn "Running Lean default kernel on solution").length > 1
      && (log.splitOn "Lean default kernel accepts the solution").length == 1 then
    .kernelRejected
  else
    .unknown

def proofFailureMessage : ComparatorFailureReason → String
  | .timedOut => "Verifying this proof took too long and was stopped.\nThis is usually a "
      ++ "problem with the autograder rather than your proof; please notify your instructor."
  | .usesSorry => "Your proof is missing or incomplete (it appears to use `sorry`)."
  | .illegalAxiom ax =>
    s!"Your proof relies on the axiom `{ax}`, which isn't permitted for this exercise."
  | .wrongStatement => "Your proof does not prove the expected statement for this exercise."
  | .kernelRejected => "Your proof was rejected by an independent kernel check."
  | .buildFailed => "Your submission could not be built for independent verification; "
      ++ "please check it for compile errors."
  | .unknown => "Comparator could not verify this proof.\nThis usually means the proof is "
      ++ "missing, uses `sorry`, uses an axiom that isn't permitted, or doesn't prove the "
      ++ "expected statement."

def defFailureMessage : ComparatorFailureReason → String
  | .timedOut => "Verifying this definition took too long and was stopped.\nThis is usually "
      ++ "a problem with the autograder rather than your work; please notify your instructor."
  | .usesSorry => "Your definition could not be proven equal to the reference solution."
  | .illegalAxiom ax =>
    s!"Proving your definition equal to the reference solution relies on the axiom `{ax}`, "
      ++ "which isn't permitted for this exercise."
  | .wrongStatement => "Your definition's type does not match the expected type for this exercise."
  | .kernelRejected => "The proof that your definition equals the reference solution was "
      ++ "rejected by an independent kernel check."
  | .buildFailed => "Your submission could not be built for independent verification; "
      ++ "please check it for compile errors."
  | .unknown => "Comparator could not verify this definition against the reference solution."

/-- Verifies a proof exercise via Comparator. `challenge_module` is the sheet itself,
unmodified (its theorem statement -- `sorry`'d or not, Comparator never inspects the
proof body -- is the trusted reference); `solution_module` is the submission (or, in
`--test` mode with `subName ≠ name`, the submission plus a one-line proof-term
alias, already baked into `ComparatorGrading/Solution.lean` by the caller). -/
def verifyProofViaComparator (name subName : Name) (pts : Float)
    (sheet : Environment) : IO ExerciseResultDebug := do
  let cfg : ComparatorConfig := {
    challenge_module := sheetModuleName.toString
    solution_module := comparatorSolutionModule
    theorem_names := #[name.toString]
    permitted_axioms := (permittedAxiomsFor sheet name).map Name.toString
  }
  let (ok, log) ← runComparator cfg
  if ok then
    return { name := subName, score := pts, status := "passed",
             output := "Passed all tests", sheet_name := name,
             expected_status := "none",
             output_log := s!"Verified by Comparator\n{log}" }
  else
    return { name := subName, score := 0.0, status := "failed",
             output := proofFailureMessage (classifyComparatorFailure log),
             sheet_name := name, expected_status := "none",
             output_log := s!"Comparator rejected the proof\n{log}" }

/-- Verifies a definition exercise's pin theorem via Comparator: that `t.subName` has
the same type/universe levels/safety as the reference `t.refName` (`definition_names`),
and that the pin theorem proving them equal type-checks using only permitted axioms
(`theorem_names`). -/
def verifyDefViaComparator (i : Nat) (t : PinTarget) (pts : Float)
    (sheet : Environment) : IO ExerciseResultDebug := do
  let cfg : ComparatorConfig := {
    challenge_module := comparatorPinChallengeModule i
    solution_module := comparatorPinModule i
    theorem_names := #[pinTheoremName t]
    definition_names := #[t.subName.toString]
    permitted_axioms := (permittedAxiomsFor sheet t.refName).map Name.toString
  }
  let (ok, log) ← runComparator cfg
  if ok then
    return { name := t.subName, score := pts, status := "passed",
             output := "Passed all tests", sheet_name := t.refName,
             expected_status := "none",
             output_log := s!"Verified equal to reference by Comparator\n{log}" }
  else
    return { name := t.subName, score := 0.0, status := "failed",
             output := defFailureMessage (classifyComparatorFailure log),
             sheet_name := t.refName, expected_status := "none",
             output_log := s!"Comparator rejected the definition\n{log}" }

def tacticsFor (sheet : Environment) (name : Name) : Array Syntax :=
  let raw :=
    if let some t := validTacticsAttr.getParam? sheet name then t
    else if let some d := defaultTacticsAttr.getParam? sheet `setDefaultTactics then d
    else #[]
  raw.map Prod.snd

/-- Recovers the exact original source text of `stx` from `sourceContents`, via its
parsed position range -- *not* by pretty-printing, which does not reliably round-trip
(e.g. the `rfl` tactic's parsed syntax pretty-prints as the semantically different
`exact Iff.rfl`). -/
def syntaxSourceText (sourceContents : String) (stx : Syntax) : Option String := do
  let startPos ← stx.getPos?
  let endPos ← stx.getTailPos?
  let bytes := sourceContents.toUTF8
  return String.fromUTF8! (bytes.extract startPos.byteIdx endPos.byteIdx)

/-- Combines `rfl`, `apply HEq.refl`, every tactic configured via `@[validTactics]`/
`@[defaultTactics]` (recovered from the sheet's own source text, see
`syntaxSourceText`), and a final `sorry` fallback into one `first | ...` block,
spliced as a definition exercise's pin theorem proof.

Definition exercises are always verified by handing this block to Comparator and
letting its independent, from-scratch elaboration be the sole judge of whether any
alternative works, rather than pre-deciding locally which one "should" succeed: a
local pre-check would be unreliable, since whether e.g. `rfl` succeeds in proving two
independently-elaborated (even if source-identical) recursive definitions equal can
depend on low-level details of how the equation compiler happened to compile each
copy, which isn't guaranteed to transfer between our in-process environment and
Comparator's from-scratch rebuild.

The `sorry` fallback ensures a genuinely-unprovable pin theorem still produces a
clean Comparator axiom-check rejection (`sorryAx` is never a permitted axiom) instead
of a hard Lean compile error for the containing file/module. -/
def combinedTacticBlock (sheetContents : String) (tactics : Array Syntax) : String :=
  let tacticTexts := tactics.filterMap (syntaxSourceText sheetContents)
  let alternatives := #["rfl", "apply HEq.refl"] ++ tacticTexts ++ #["sorry"]
  "  first\n" ++ String.intercalate "\n" (alternatives.toList.map (s!"    | ({·})")) ++ "\n"

/-- Cheap, purely local precondition for a definition exercise (the declaration must
actually contain a value) so we can fail fast without invoking Comparator at all for
an obviously-incomplete submission. Type/universe/safety matching and the actual
equality proof are both independently verified by Comparator later. -/
def defQuickCheck (subName name : Name) (subConstInfo : ConstantInfo) :
    Option ExerciseResultDebug :=
  if !subConstInfo.hasValue then
    some { name := subName, score := 0.0, status := "failed",
           output := "Declaration does not contain a value",
           sheet_name := name, expected_status := "none",
           output_log := "Declaration does not contain a value" }
  else none

/-! ## Tactic allowlist enforcement

`@[autogradedProof]` checks only that a submission *closes the stated theorem* using
permitted axioms. It deliberately says nothing about how the proof was found, which is
usually right -- but not when an assignment exists to practice a specific technique.
Many propositional exercises fall to a one-word `grind` or `simp`, and those would
otherwise earn full marks while demonstrating none of the intended skill.

`@[allowedTactics]` on a sheet exercise restricts which tactics its proof may use. Two
properties matter for it to be enforcement rather than an honour-system nudge:

* **The check runs on a parse of the submission, not on its elaboration.** Elaborating a
  Lean file executes arbitrary code in this process (`initialize`/`#eval`/`run_cmd`
  blocks run during elaboration, which is exactly why `run_autograder` destroys the
  deploy key beforehand). Parsing executes none of it, so a submission cannot influence
  the verdict on itself.
* **Parsing uses the *sheet's* environment, never the submission's.** Which syntax is a
  tactic at all is therefore fixed by the instructor's imports. A submission cannot
  enlarge that set by declaring its own `syntax ... : tactic`, nor reach a tactic from a
  library the sheet does not import -- such a file simply fails to parse here, which is
  reported as a violation rather than quietly allowed.

It remains a *syntactic* check, and the honest limit is that it constrains tactics, not
proofs: a submission that writes the proof term directly, using no tactics at all, has
nothing for this to reject. Catching that needs a check on the elaborated term, which
is a different (and much harder to calibrate) mechanism -- see the README. -/

/-- Syntax node kinds registered in Lean's `tactic` parser category, according to `env`.

Testing membership here, rather than pattern-matching a hard-coded list of tactic names
or sniffing the kind's name for `.Tactic.`, is what makes the walk below complete: every
tactic is registered in this category, including ones defined by `macro`/`syntax`
declarations, so none is invisible to the allowlist. -/
def tacticKinds (env : Environment) : PersistentHashMap SyntaxNodeKind Unit :=
  match (Parser.parserExtension.getState env).categories.find? `tactic with
  | some cat => cat.kinds
  | none     => .empty

/-- The name a student would recognize a tactic node by: the keyword they typed.

Every tactic node's first child is an atom holding that keyword (`rewrite`, `rfl`,
`intro`), so this reports exactly what appears in the source. Otherwise it is named by the
last component of its syntax kind, which gives `cdot` for a bullet. An infix combinator
such as `<;>` has an auto-generated kind (`tactic_<;>_`) that no instructor would write,
so it is named by its operator instead. -/
def tacticDisplayName (stx : Syntax) : String :=
  match stx with
  | .node _ k args =>
    match args[0]? with
    | some (Lean.Syntax.atom _ v) => v
    | _ =>
      let last := match k with
        | .str _ c => c
        | _ => "unknown"
      let op? := args.findSome? fun
        | Lean.Syntax.atom _ v => some v
        | _ => none
      if last.startsWith "tactic_" then op?.getD last else last
  | _ => "<malformed>"

/-- Every tactic node anywhere inside `stx`, outermost first.

Recursion continues *through* tactic nodes rather than stopping at them, so tactics
nested inside a combinator (`first | rfl | simp`, `try simp`, `rfl <;> simp`) are each
checked on their own. Both the combinator and its branches must be permitted. -/
partial def collectTactics (kinds : PersistentHashMap SyntaxNodeKind Unit)
    (stx : Syntax) (acc : Array Syntax := #[]) : Array Syntax :=
  let acc := if kinds.contains stx.getKind then acc.push stx else acc
  stx.getArgs.foldl (fun a c => collectTactics kinds c a) acc

/-- The name a parsed command declares, if it declares one. -/
partial def declNameOf? (stx : Syntax) : Option Name :=
  if stx.getKind == ``Lean.Parser.Command.declId then
    some stx[0].getId
  else
    stx.getArgs.findSome? declNameOf?

/-- Splits `contents` into top-level commands, parsing only -- nothing is elaborated, so
none of the submission's own code runs. `env` supplies the syntax in scope and is always
the sheet's environment; see the note above. -/
def parseCommandsOnly (env : Environment) (contents fileName : String)
    : IO (Array Syntax) := do
  let ictx := Parser.mkInputContext contents fileName
  let (_, parserState, _) ← Parser.parseHeader ictx
  let pmctx : Parser.ParserModuleContext := { env, options := {} }
  let mut cmds : Array Syntax := #[]
  let mut ps := parserState
  let mut msgs := MessageLog.empty
  while !ictx.atEnd ps.pos do
    let (stx, ps', msgs') := Parser.parseCommand ictx pmctx ps msgs
    -- A command that consumes nothing means the parser is stuck (an unparseable
    -- construct); stop rather than spin forever on it.
    if ps'.pos == ps.pos then break
    cmds := cmds.push stx
    ps := ps'
    msgs := msgs'
  return cmds

/-- Whether any part of `stx` failed to parse.

`parseCommandsOnly` uses the *sheet's* syntax, so a submission that declares its own
tactic (`macro "sneaky" : tactic => `(tactic| grind)`) leaves a hole here: the tactic is
real when the submission elaborates itself, but is not syntax we know, so it parses as
`missing`. That must be refused rather than silently contributing no tactic names to
check -- otherwise defining a macro would be a way to become invisible to the allowlist. -/
partial def containsMissing (stx : Syntax) : Bool :=
  match stx with
  | .missing      => true
  | .node _ _ args => args.any containsMissing
  | _             => false

/-- The name of a command that extends Lean's own syntax or elaboration -- `notation`,
`macro`, `macro_rules`, `syntax`, `elab`, `infixl` and the like -- if `stx` is or contains
one.

Such a command breaks the link between what a student wrote and what Lean runs, which is
what both allowlists read. `containsMissing` above catches a *new* tactic name, because
the submission is parsed with the sheet's syntax and an unknown name leaves a hole. These
leave no hole at all:

* `local notation "CHEAT" => @add_lt_add` parses as an ordinary identifier, so the proof
  term cites `add_lt_add` while the source says only `CHEAT`;
* `macro_rules | `(tactic| rw [$_]) => `(tactic| simp [or_assoc])` re-points syntax that
  already exists, so the source says the permitted `rw` while `simp` does the work.

Neither is inspected by the guards above either way: they are commands of their own, and
those guards only ever see the exercise's declaration and the helpers it depends on. The
kind's last component is matched by prefix so that variants (`notation3`, `syntaxAbbrev`,
`syntaxCat`) are covered too. -/
partial def syntaxExtension? (stx : Syntax) : Option String :=
  let kind := stx.getKind
  let extension? : Option String :=
    -- `attribute [local simp] foo` puts a library theorem into a tactic's reach without
    -- naming it in the proof, so the citation check never sees it. Matched exactly rather
    -- than by prefix: `Term.attributes` is the node inside every `@[...]`, and flagging
    -- that would refuse any declaration carrying an attribute at all.
    if kind == `Lean.Parser.Command.attribute then some "attribute"
    else match kind with
    | .str _ last =>
      if ["notation", "macro", "syntax", "elab", "mixfix", "infix", "prefix", "postfix"].any
          (fun p => last.startsWith p) then some last else none
    | _ => none
  extension? <|> stx.getArgs.findSome? syntaxExtension?

/-- Every syntax-extension command in `cmds`, as its kind and its source text with runs
of whitespace collapsed. A problem set may legitimately define notation of its own, and a
submission is a copy of the handout, so the text is what says whether an extension is the
instructor's or the student's. -/
def syntaxExtensions (contents : String) (cmds : Array Syntax) : Array (String × String) :=
  cmds.filterMap fun c => do
    let kind ← syntaxExtension? c
    let b ← c.getPos?
    let e ← c.getTailPos?
    let text := String.Pos.Raw.extract contents b e
    let words := (text.splitOn " ").flatMap (·.splitOn "\n") |>.flatMap (·.splitOn "\t")
    return (kind, String.intercalate " " (words.filter (!·.isEmpty)))

/-- Whether `stx` contains a `by` block, i.e. is proved with tactics at all.

An exercise carrying `@[allowedTactics]` is asking the student to practice tactics, so a
term-mode proof (`:= fun h => h.1 h.2`) sidesteps the exercise entirely *and* offers the
allowlist nothing to inspect. Requiring a tactic block closes that, leaving the allowlist
itself to govern which tactics are then used. -/
partial def containsByBlock (stx : Syntax) : Bool :=
  stx.getKind == ``Lean.Parser.Term.byTactic
    || stx.getArgs.any containsByBlock

/-- Tactics used in `cmdStx` that `allowed` does not permit, deduplicated and in source
order. An empty array means the proof is within its budget. -/
def disallowedTactics (kinds : PersistentHashMap SyntaxNodeKind Unit)
    (allowed : Array String) (cmdStx : Syntax) : Array String :=
  (collectTactics kinds cmdStx).foldl (init := #[]) fun bad s =>
    let n := tacticDisplayName s
    if allowed.contains n || bad.contains n then bad else bad.push n

/-! ### Helper lemmas

Checking only the declaration named after an exercise leaves an obvious way round the
allowlist: prove a lemma of your own with a forbidden tactic, then cite it from the graded
proof with `exact`. The graded proof's syntax is then entirely permitted, and the finished
proof term carries no record of which tactics built it, so Comparator cannot see it either.

So each graded proof is followed into the student's own declarations it depends on, and
every one of those must satisfy the *same exercise's* allowlist -- a lemma cited from an
exercise is part of that exercise's proof. The walk runs over the elaborated proof term,
not the source, so a lemma counts only if the proof really uses it: scratch work the proof
never touches costs nothing. It stops at anything the stencil itself declares, which covers
another graded exercise (checked under its own allowlist already) and the stencil's own
definitions. -/

/-- The value of a constant, when it has one. -/
def constValue? : ConstantInfo → Option Expr
  | .thmInfo v    => some v.value
  | .defnInfo v   => some v.value
  | .opaqueInfo v => some v.value
  | _             => none

/-- Whether the submission's declaration `r` says the same thing as the stencil's.

Stencils ship declarations of their own -- helper lemmas proved for the student, supporting
definitions, the graded exercises -- and a submission built from the handout carries copies
of them. A copy can be trusted only if it is unchanged in what it asserts: a student who
re-proves a provided lemma, however they like, gains nothing, but one who keeps the name
and changes the statement has written a new lemma under a trusted name. So a theorem must
keep its statement, and a definition its statement and its body. Comparison is up to
renaming of bound variables. -/
def matchesStencil (sheet submission : Environment) (r : Name) : Bool :=
  match sheet.find? r, submission.find? r with
  | some (.thmInfo s), some (.thmInfo t) => s.type == t.type
  | some (.defnInfo s), some (.defnInfo t) => s.type == t.type && s.value == t.value
  | some s, some t => s.type == t.type && s.isAxiom == t.isAxiom
  | _, _ => false

/-- The nearest prefix of `n`, including `n` itself, that the submission declares at the top
level. Elaboration names auxiliary constants after the declaration that produced them
(`helper._proof_1`, `helper.match_1`), so this maps each one back to the source it came
from. -/
def declRoot? (declCmds : Std.HashMap Name Syntax) : Name → Option Name
  | .anonymous => none
  | n@(.str p _) => if declCmds.contains n then some n else declRoot? declCmds p
  | n@(.num p _) => if declCmds.contains n then some n else declRoot? declCmds p

/-- Whether some proper prefix of `n` names an imported declaration. -/
def hasImportedPrefix (env : Environment) : Name → Bool
  | .str p _ | .num p _ => (env.getModuleIdxFor? p).isSome || hasImportedPrefix env p
  | .anonymous => false

/-- Whether `n` is a lemma Lean generated, inside the submission, for an imported
declaration: `choose.eq_3`, say, which Lean creates the first time a proof unfolds the
imported `choose`. Such a lemma is part of the library's definition, not the student's
work, yet it is not imported and matches no declaration in the file. Two conditions
together keep this from excusing anything a student wrote: the name must be one Lean
reserves for lemmas it generates, which a student cannot declare, and it must extend
the name of an imported declaration. -/
def generatedForImport (env : Environment) (n : Name) : Bool :=
  isReservedName env n && hasImportedPrefix env n

/-- The student's own top-level declarations that the proof of `exercise` depends on, with
their syntax. `.error d` means the proof depends on a constant defined in the submission that
could not be traced to any declaration in its source -- one produced by a `namespace`,
an anonymous `instance`, or anything else this cannot see into -- and is refused rather
than assumed harmless. -/
def helperDeps (sheet submission : Environment) (declCmds : Std.HashMap Name Syntax)
    (exercise : Name) : Except Name (Array (Name × Syntax)) := Id.run do
  let mut seen : NameSet := NameSet.empty.insert exercise
  let mut todo : Array Name := #[exercise]
  let mut helpers : Array (Name × Syntax) := #[]
  while !todo.isEmpty do
    let c := todo.back!
    todo := todo.pop
    let some v := (submission.find? c).bind constValue? | continue
    for d in v.getUsedConstants do
      if seen.contains d then continue
      seen := seen.insert d
      -- Imported from the course prelude or from core: not the student's to check.
      if (submission.getModuleIdxFor? d).isSome then continue
      match declRoot? declCmds d with
      | none =>
        if generatedForImport submission d then continue
        return .error d
      | some r =>
        -- Declared by the stencil too: another exercise, or a definition the stencil
        -- supplies. Checked elsewhere, so stop here.
        if r != exercise && matchesStencil sheet submission r then continue
        if r != exercise && !helpers.any (·.1 == r) then
          if let some cmd := declCmds[r]? then
            helpers := helpers.push (r, cmd)
        todo := todo.push d
  return .ok helpers

/-- Student-facing explanation of a tactic violation inside a lemma the proof relies on. -/
def helperViolationMessage (helper : Name) (bad allowed : Array String) : String :=
  let list (a : Array String) := String.intercalate ", " (a.toList.map (s!"`{·}`"))
  s!"This exercise restricts which tactics you may use.\nYour proof relies on `{helper}`, "
    ++ s!"a lemma defined in your file, which uses {list bad}; "
    ++ (if bad.size == 1 then "that is" else "those are")
    ++ " not permitted here.\nAnything your proof depends on must use only this exercise's "
    ++ s!"permitted tactics: {list allowed}."

/-- Student-facing explanation of a tactic violation. It names both what was used and
what was permitted, so the student can correct the proof rather than guess. -/
def tacticViolationMessage (bad allowed : Array String) : String :=
  let list (a : Array String) := String.intercalate ", " (a.toList.map (s!"`{·}`"))
  s!"This exercise restricts which tactics you may use.\nYour proof uses "
    ++ s!"{list bad}, which " ++ (if bad.size == 1 then "is" else "are")
    ++ " not permitted here.\nPermitted tactics for this exercise: "
    ++ s!"{list allowed}."

/-! ### Audit line for graders

Not a check: nothing here changes a verdict. For each exercise the submission answers, the
grader prints to the staff-only output which tactics its proof used and which theorems it
cited, so a shortcut -- `exact irrational_sqrt_two`, a helper lemma doing all the work, a
library lemma that happens to be the whole exercise -- stands out to the person reading
it, without the grader having to decide in advance what counts as one.

"Theorems cited" means library theorems the elaborated proof depends on *whose name the
student wrote*. The proof term alone would bury the signal: a single `rewrite` pulls in
`congrArg`, `Eq.mpr` and the like, which no student typed. Intersecting with the
identifiers in the source keeps exactly what was named, followed through the student's own
helper lemmas. -/

/-- Every identifier written anywhere in `stx`, except the field after a dot: in
`(Nat.Prime.dvd_mul hp).mp` the `mp` names a projection, not a theorem the student cited,
and counting it would match `Iff.mp`. `h.mp` is one identifier and never matched, so this
treats both spellings alike. -/
partial def identsIn (stx : Syntax) (acc : Array Name := #[]) : Array Name :=
  if stx.getKind == ``Lean.Parser.Term.proj then identsIn stx[0] acc else
  let acc := if stx.isIdent then acc.push stx.getId else acc
  stx.getArgs.foldl (fun a c => identsIn c a) acc

/-- The distinct tactic keywords used in `stx`, in source order. -/
def tacticNamesIn (kinds : PersistentHashMap SyntaxNodeKind Unit) (stx : Syntax) :
    Array String :=
  (collectTactics kinds stx).foldl (init := #[]) fun acc s =>
    let n := tacticDisplayName s
    if acc.contains n then acc else acc.push n

/-- What the proof of an exercise rests on: the student's own declarations (`own`), the
problem set's theorems it uses (`sheet`: other exercises and provided lemmas), and the
library theorems it cites (`cited`). -/
structure ProofDeps where
  own : Array Name
  sheet : Array Name
  cited : Array Name

def proofDeps (sheet submission : Environment) (declCmds : Std.HashMap Name Syntax)
    (exercise : Name) : ProofDeps := Id.run do
  -- Walk the elaborated proof, as `helperDeps` does, collecting the student's own
  -- declarations it relies on and the library theorems it reaches directly.
  let mut seen : NameSet := NameSet.empty.insert exercise
  let mut todo : Array Name := #[exercise]
  let mut own : Array Name := #[]
  let mut sheetThms : Array Name := #[]
  let mut library : Array Name := #[]
  while !todo.isEmpty do
    let c := todo.back!
    todo := todo.pop
    let some v := (submission.find? c).bind constValue? | continue
    for d in v.getUsedConstants do
      if seen.contains d then continue
      seen := seen.insert d
      if (submission.getModuleIdxFor? d).isSome then
        if let some (.thmInfo _) := submission.find? d then
          if !d.isInternal then library := library.push d
        continue
      match declRoot? declCmds d with
      | none => continue
      | some r =>
        if r != exercise && matchesStencil sheet submission r then
          if let some (.thmInfo _) := sheet.find? r then
            if !sheetThms.contains r then sheetThms := sheetThms.push r
          continue
        if r != exercise && !own.contains r then own := own.push r
        todo := todo.push d
  -- Syntax: the exercise's own proof, then each helper's.
  let cmds := (declCmds[exercise]?.toArray) ++ own.filterMap (declCmds[·]?)
  let idents := cmds.foldl (fun acc c => identsIn c acc) #[]
  let named (c : Name) : Bool := idents.any fun n =>
    c == n || c.toString.endsWith ("." ++ n.toString)
  let cited := (library.filter named).qsort (·.toString < ·.toString)
  return { own, sheet := sheetThms, cited }

/-- One line for the staff-only output describing how `exercise` was proved. -/
def auditLine (sheet submission : Environment) (declCmds : Std.HashMap Name Syntax)
    (kinds : PersistentHashMap SyntaxNodeKind Unit) (exercise : Name) : String := Id.run do
  let { own, sheet := sheetThms, cited } := proofDeps sheet submission declCmds exercise
  let list (a : Array String) := if a.isEmpty then "none" else String.intercalate ", " a.toList
  let tactics := match declCmds[exercise]? with
    | some c => list (tacticNamesIn kinds c)
    | none => "(could not parse)"
  let ownDescr := own.map fun h =>
    let kind := match submission.find? h with
      | some (.axiomInfo _) => "axiom"
      | _ => match declCmds[h]? with
        | some c => s!"tactics: {list (tacticNamesIn kinds c)}"
        | none => "?"
    let kind := if (sheet.find? h).isSome then s!"CHANGED from the problem set; {kind}" else kind
    s!"{h} ({kind})"
  let mut line := s!"[audit] {exercise}  tactics: {tactics}"
  line := line ++ s!"  |  theorems cited: {list (cited.map toString)}"
  unless own.isEmpty do line := line ++ s!"  |  own lemmas: {list ownDescr}"
  unless sheetThms.isEmpty do
    line := line ++ s!"  |  problem-set theorems used: {list (sheetThms.map toString)}"
  return line

/-- Student-facing explanation of a theorem violation. -/
def theoremViolationMessage (bad : Array Name) (allowed : Array String) : String :=
  let list (a : Array String) := String.intercalate ", " (a.toList.map (s!"`{·}`"))
  s!"This exercise restricts which theorems you may use.\nYour proof, counting any lemmas "
    ++ s!"of your own it relies on, uses {list (bad.map toString)}, which "
    ++ (if bad.size == 1 then "is" else "are")
    ++ s!" not permitted here.\nPermitted theorems for this exercise: {list allowed}."

/-- `some message` when `@[allowedTheorems]` on `exercise` rules out its proof: the proof
cites a theorem off the list, or cannot be fully seen, in which case it fails closed as the
tactic check does. A theorem matches a listed name or a namespaced version of it. -/
def theoremVerdict (sheet submission : Environment) (declCmds : Std.HashMap Name Syntax)
    (exercise : Name) : Option String :=
  match allowedTheoremsAttr.getParam? sheet exercise with
  | none => none
  | some allowed =>
    match declCmds[exercise]?, helperDeps sheet submission declCmds exercise with
    | none, _ =>
      some ("Your proof of this exercise could not be checked against its "
        ++ "permitted-theorem list, so it cannot be awarded credit.\nSubmit the proof "
        ++ "directly, as an ordinary theorem, rather than generating it.")
    | _, .error d =>
      some (s!"Your proof of this exercise relies on `{d}`, which could not be traced to "
        ++ "a declaration in your file, so it could not be checked against the "
        ++ "permitted-theorem list.\nDefine helper lemmas as ordinary top-level theorems, "
        ++ "outside any namespace.")
    | some cmd, .ok helpers =>
      if containsMissing cmd || helpers.any (containsMissing ·.2) then
        some ("Your proof uses syntax that is not available for this assignment, so it "
          ++ "could not be checked against the permitted-theorem list.\nDo not define "
          ++ "your own notation or tactics.")
      else
        let bad := (proofDeps sheet submission declCmds exercise).cited.filter fun c =>
          !allowed.any (·.toName.isSuffixOf c)
        if bad.isEmpty then none else some (theoremViolationMessage bad allowed)

/-- Student-facing explanation of an `allowedLemmas` violation. -/
def lemmaViolationMessage (bad : Array Name) (allowed : Array String) : String :=
  let list (a : Array String) := String.intercalate ", " (a.toList.map (s!"`{·}`"))
  s!"This exercise restricts which results from the problem set you may use.\nYour proof, "
    ++ s!"counting any lemmas of your own it relies on, uses {list (bad.map toString)}, which "
    ++ (if bad.size == 1 then "is" else "are") ++ " not permitted here.\n"
    ++ (if allowed.isEmpty then "This exercise may not use any exercise or lemma from the problem set."
        else s!"Results from the problem set you may use here: {list allowed}.")

/-- `some message` when `@[allowedLemmas]` on `exercise` rules out its proof: the proof uses
a problem-set theorem off the list, directly or through a lemma of the student's own. A use
hidden in a declaration that cannot be traced fails closed, as the other checks do. -/
def lemmaVerdict (sheet submission : Environment) (declCmds : Std.HashMap Name Syntax)
    (exercise : Name) : Option String :=
  match allowedLemmasAttr.getParam? sheet exercise with
  | none => none
  | some allowed =>
    match declCmds[exercise]?, helperDeps sheet submission declCmds exercise with
    | none, _ =>
      some ("Your proof of this exercise could not be checked against the results it may "
        ++ "use, so it cannot be awarded credit.\nSubmit the proof directly, as an ordinary "
        ++ "theorem, rather than generating it.")
    | _, .error d =>
      some (s!"Your proof of this exercise relies on `{d}`, which could not be traced to "
        ++ "a declaration in your file, so it could not be checked against the results it "
        ++ "may use.\nDefine helper lemmas as ordinary top-level theorems, outside any "
        ++ "namespace.")
    | some _, .ok _ =>
      let bad := (proofDeps sheet submission declCmds exercise).sheet.filter fun c =>
        !allowed.any (·.toName == c)
      if bad.isEmpty then none else some (lemmaViolationMessage bad allowed)

/-! ### Grading a file with errors in it

Comparator rebuilds the submission from source, and any error in the file fails that
rebuild, so one broken problem used to fail every problem in the file. Lean itself does
better: it elaborates each command on its own, and a command that fails leaves the rest
intact. `cleanSubmission` hands Comparator the file as Lean salvaged it. A command whose
errors all lie in its proof keeps its statement, with the proof replaced by `sorry`, so
whatever uses it still compiles; any other command with an error is removed. Whatever
used a removed declaration is cut back the same way, since it would now fail in turn,
and so are commands that only report (`#check`, `#eval`, `example`), which grade nothing
and could refer to something removed. Line numbers are preserved. A file without errors
goes to Comparator untouched.

Nothing here can award a mark Lean would not: every problem Comparator is asked about
must still match the stencil and be proved without `sorry` in the cleaned file, and a
problem relying on a declaration that had an error is failed before it gets there. -/

/-- Each error in a submission: where it is, as a byte offset, and what it says. -/
abbrev ErrorSites := Array (String.Pos.Raw × String)

/-- The `:= ...` part of a declaration: its proof or definition body. -/
partial def declValOf? (stx : Syntax) : Option Syntax :=
  if stx.getKind == ``Lean.Parser.Command.declValSimple
      || stx.getKind == ``Lean.Parser.Command.declValEqns
      || stx.getKind == ``Lean.Parser.Command.whereStructInst then some stx
  else stx.getArgs.findSome? declValOf?

structure CleanedSubmission where
  /-- The file to give Comparator. -/
  contents : String
  /-- Declarations that had errors, with the errors. -/
  broken : Std.HashMap Name (Array String) := ∅
  /-- Declarations cut back because they use a dropped one, with the one they use. -/
  usesBroken : Std.HashMap Name Name := ∅

/-- A command that only reports -- `#check`, `#eval`, `example` and the like -- and so can
be left out of what Comparator builds without changing any grade. -/
def isReportCommand (cmd : Syntax) : Bool :=
  [``Lean.Parser.Command.check, ``Lean.Parser.Command.eval,
    ``Lean.Parser.Command.print].contains cmd.getKind
  || (cmd.getKind == ``Lean.Parser.Command.declaration
      && cmd[1].getKind == ``Lean.Parser.Command.example)

def cleanSubmission (submission : Environment) (contents : String) (cmds : Array Syntax)
    (errors : ErrorSites) : CleanedSubmission := Id.run do
  if errors.isEmpty then return { contents }
  let located := cmds.filterMap fun c => c.getPos?.map (c, ·.byteIdx)
  let endOf (i : Nat) : Nat :=
    if h : i + 1 < located.size then located[i + 1].2 else contents.utf8ByteSize
  -- Each error belongs to the last command starting at or before it.
  let mut errs : Std.HashMap Nat (Array (Nat × String)) := ∅
  for (pos, msg) in errors do
    let mut owner : Option Nat := none
    for i in [0:located.size] do
      if located[i]!.2 ≤ pos.byteIdx then owner := some i
    if let some i := owner then
      errs := errs.insert i ((errs.getD i #[]).push (pos.byteIdx, msg))
  -- For each command cut back, the byte offset from which it is cut: its start if it is
  -- dropped whole, the start of its `:=` if only its proof goes.
  let proofStart (cmd : Syntax) : Option Nat := (declValOf? cmd).bind (·.getPos?) |>.map (·.byteIdx)
  let mut cut : Std.HashMap Nat Nat := ∅
  let mut broken : Std.HashMap Name (Array String) := ∅
  for i in [0:located.size] do
    let (cmd, start) := located[i]!
    if let some es := errs[i]? then
      -- Keep the statement when every error is in the proof; otherwise drop the command.
      let from_ := match proofStart cmd with
        | some v => if es.all (·.1 ≥ v) then v else start
        | none => start
      cut := cut.insert i from_
      if let some n := declNameOf? cmd then broken := broken.insert n (es.map (·.2))
    else if isReportCommand cmd then
      cut := cut.insert i start
  -- What uses a dropped declaration would fail in the cleaned file: cut it back too,
  -- repeatedly, since that can drop more. A use is found in what the student wrote as
  -- well as in what Lean elaborated: where Lean could not make sense of a call to a
  -- broken declaration it quietly put `sorry` in its place, and the elaborated proof no
  -- longer mentions it at all.
  -- A name the library already has still means the library's declaration elsewhere in
  -- the file, so dropping the student's broken copy of it breaks nothing.
  let ownName (n : Name) : Bool := (submission.getModuleIdxFor? n).isNone
  let mut dropped : Array Name := #[]
  for i in [0:located.size] do
    if cut[i]? == some located[i]!.2 then
      if let some n := declNameOf? located[i]!.1 then
        if ownName n then dropped := dropped.push n
  let mut usesBroken : Std.HashMap Name Name := ∅
  let mut changed := true
  while changed do
    changed := false
    for i in [0:located.size] do
      let (cmd, start) := located[i]!
      if cut[i]? == some start then continue
      let name? := declNameOf? cmd
      let ci? := name?.bind submission.find?
      let written := identsIn cmd
      let writtenInProof := ((declValOf? cmd).map identsIn).getD #[]
      let count (ids : Array Name) (d : Name) := (ids.filter (· == d)).size
      -- The dropped declaration it uses in its statement, if any, else in its proof.
      let inStatement := dropped.find? fun d =>
        count written d > count writtenInProof d
          || ((ci?.map (·.type.getUsedConstants.contains d)).getD false)
      let inProof := dropped.find? fun d =>
        writtenInProof.contains d
          || ((ci?.bind constValue?).map (·.getUsedConstants.contains d)).getD false
      if let some d := inStatement then
        cut := cut.insert i start
        if let some n := name? then
          if ownName n then dropped := dropped.push n
          usesBroken := usesBroken.insert n d
        changed := true
      else if let some d := inProof then
        if cut[i]?.isNone then
          match proofStart cmd with
          | some v => cut := cut.insert i v
          | none =>
            cut := cut.insert i start
            if let some n := name? then if ownName n then dropped := dropped.push n
          if let some n := name? then usesBroken := usesBroken.insert n d
          changed := true
  let mut out := ""
  let mut cursor := 0
  for i in [0:located.size] do
    let some from_ := cut[i]? | continue
    let stop := endOf i
    let removed := String.Pos.Raw.extract contents ⟨from_⟩ ⟨stop⟩
    out := out ++ String.Pos.Raw.extract contents ⟨cursor⟩ ⟨from_⟩
      ++ (if from_ == located[i]!.2 then "" else ":= sorry")
      ++ "".pushn '\n' ((removed.splitOn "\n").length - 1)
    cursor := stop
  out := out ++ String.Pos.Raw.extract contents ⟨cursor⟩ ⟨contents.utf8ByteSize⟩
  return { contents := out, broken, usesBroken }

/-- A problem's own errors, for its failure message: the first few, since one mistake
early in a proof tends to set off more. -/
def brokenMessage (errors : Array String) : String :=
  let shown := errors.toList.take 3
  "This problem has an error in it, so it was not graded:\n\n"
    ++ String.intercalate "\n\n" shown
    ++ (if errors.size > 3 then s!"\n\n({errors.size - 3} more)" else "")

/-- Whether `name`'s proof, or any declaration of the submission's own it relies on,
contains `sorry`. Lean also fills in `sorry` where it recovered from an error, so this
covers a declaration that failed to elaborate as well. -/
def usesSorry (submission : Environment) (name : Name) : Bool := Id.run do
  let mut seen : NameSet := {}
  let mut todo := #[name]
  while !todo.isEmpty do
    let c := todo.back!
    todo := todo.pop
    if seen.contains c then continue
    seen := seen.insert c
    let some v := (submission.find? c).bind constValue? | continue
    for d in v.getUsedConstants do
      if d == ``sorryAx then return true
      if (submission.getModuleIdxFor? d).isNone then todo := todo.push d
  return false

/-- A problem marked `@[gradedByHand]`, as the student wrote it, with a line of facts
above it for the grader. -/
def handGradedText (submission : Environment) (contents : String)
    (declCmds : Std.HashMap Name Syntax) (kinds : PersistentHashMap SyntaxNodeKind Unit)
    (name : Name) : String :=
  match declCmds[name]? with
  | none => s!"The submission has no `{name}`, or it could not be read."
  | some cmd =>
    let status := match submission.find? name with
      | none => "did not compile"
      | some _ => if usesSorry submission name then "contains sorry or an error"
                  else "compiles, no sorry"
    let tactics := tacticNamesIn kinds cmd
    let tactics := if tactics.isEmpty then "none" else String.intercalate ", " tactics.toList
    let text := match cmd.getPos?, cmd.getTailPos? with
      | some b, some e => String.Pos.Raw.extract contents b e
      | _, _ => "(source unavailable)"
    s!"{status}; tactics: {tactics}\n\n{text}"

/-- A results entry worth no points, for reading rather than scoring: a hand-graded
problem as the student wrote it.

It is visible to students, deliberately. Gradescope withholds a student's total score
whenever any entry is hidden from them -- "If test cases are hidden, students will not be
able to see their total score" -- so a hidden entry here blanked every student's
autograder score. Nothing in these entries is private: each shows the student their own
work. -/
def infoEntry (name output : String) : Json :=
  Json.mkObj [("name", toJson name), ("output", toJson output),
    ("score", toJson (0 : Float)), ("max_score", toJson (0 : Float)),
    ("visibility", toJson "visible")]

/-- Appends the reading entries after the graded ones, so graders reach them last. -/
def withInfoEntries (results : Json) (info : Array Json) : Json :=
  match results.getObjVal? "tests" with
  | .ok (.arr tests) => results.setObjVal! "tests" (.arr (tests ++ info))
  | _ => results

/-- Grades every exercise. Returns the results in stencil order; the entries to follow
them, each `@[gradedByHand]` problem as the student wrote it; and the proof summary, one
audit line per exercise, which goes to the output hidden from students rather than into
an entry -- a hidden entry would hide the student's total (see `infoEntry`). -/
def gradeSubmission (sheet submission : Environment)
    (sheetContents submissionContents : String) (errors : ErrorSites) :
    IO (Array ExerciseResult × Array Json × String) := do
  writeComparatorRef sheetContents

  let mut proofExercises : Array (Name × Float) := #[]
  let mut pinTargets : Array (Nat × PinTarget × Float) := #[]
  let mut immediateResults : Array ExerciseResult := #[]
  let mut nextIdx := 0

  -- Parse the submission once, up front, for `@[allowedTactics]` checking. This is a
  -- parse only: none of the submission's code runs, and the syntax in scope comes from
  -- the sheet, not the submission. Indexed by declared name so each exercise can be
  -- checked against the declaration that actually claims to answer it.
  let kinds := tacticKinds sheet
  let submissionCmds ← parseCommandsOnly sheet submissionContents submissionFileName
  let mut declCmds : Std.HashMap Name Syntax := ∅
  for cmd in submissionCmds do
    if let some n := declNameOf? cmd then
      declCmds := declCmds.insert n cmd
  -- A syntax extension anywhere in the file defeats both allowlists for every exercise,
  -- so it is found once and refused for each restricted exercise: see `syntaxExtension?`.
  -- One the problem set itself declares is the instructor's, and is left alone.
  let sheetCmds ← parseCommandsOnly sheet sheetContents sheetFileName
  let sheetExtensions := (syntaxExtensions sheetContents sheetCmds).map (·.2)
  let extension? :=
    ((syntaxExtensions submissionContents submissionCmds).find?
      (fun e => !sheetExtensions.contains e.2)).map (·.1)
  let extensionVerdict (name : Name) : Option String :=
    if (allowedTacticsAttr.getParam? sheet name).isNone
        && (allowedTheoremsAttr.getParam? sheet name).isNone then none
    else extension?.map fun cmd =>
      s!"Your file uses `{cmd}` to define new notation or change what a tactic means.\n"
        ++ "That hides which tactics and theorems your proof really uses, so this "
        ++ "exercise cannot be checked against its permitted lists.\n"
        ++ "Prove it with the tactics and theorems the assignment gives you, without "
        ++ "defining syntax of your own."
  -- See `cleanSubmission`: errors in one problem no longer sink the others.
  let cleaned := cleanSubmission submission submissionContents submissionCmds errors
  writeComparatorSolution cleaned.contents
  -- Why a problem cannot be graded because of an error, if it cannot.
  let brokenVerdict (name : Name) : Option String :=
    let reliesOn (h : Name) :=
      s!"Your proof relies on `{h}`, a lemma in your file that has an error in it, "
        ++ "so this problem was not graded."
    match cleaned.broken[name]?, cleaned.usesBroken[name]? with
    | some es, _ => some (brokenMessage es)
    | none, some h => some (reliesOn h)
    | none, none =>
      ((proofDeps sheet submission declCmds name).own.find? cleaned.broken.contains).map reliesOn

  let mut audits : Array (Name × String) := #[]
  let mut handGraded : Array Name := #[]
  for (name, constInfo) in sheet.constants.toList do
    if gradedByHandAttr.hasTag sheet name then handGraded := handGraded.push name
    if let some pts := autogradedProofAttr.getParam? sheet name then
      if not name.isInternal then
        if (submission.find? name).isSome then
          -- For the proof summary, before any verdict: see `auditLine`.
          let line := auditLine sheet submission declCmds kinds name
          IO.println line
          (← IO.getStdout).flush
          audits := audits.push (name, line)
          -- A tactic violation fails the exercise outright, before Comparator is
          -- consulted: the proof may well be valid, but it is not the proof this
          -- exercise asked for, so there is nothing for verification to settle.
          let tacticVerdict : Option String :=
            match allowedTacticsAttr.getParam? sheet name with
            | none => none
            | some allowed =>
              -- Every branch here fails closed: anything this check cannot fully see
              -- through is refused, never waved on.
              match declCmds[name]? with
              | none =>
                -- Elaboration found the declaration but our parse did not, so we have
                -- nothing to inspect.
                some ("Your proof of this exercise could not be checked against its "
                  ++ "permitted-tactic list, so it cannot be awarded credit.\nSubmit the "
                  ++ "proof directly, as an ordinary theorem, rather than generating it.")
              | some cmd =>
                if containsMissing cmd then
                  some ("Your proof of this exercise uses syntax that is not available "
                    ++ "for this assignment, so it could not be checked against the "
                    ++ "permitted-tactic list.\nDo not define your own tactics or import "
                    ++ "libraries beyond the ones the assignment provides.")
                else if !containsByBlock cmd then
                  some ("This exercise must be solved with a tactic proof (`:= by ...`), "
                    ++ "using only its permitted tactics.\nWriting the proof term "
                    ++ "directly is not accepted here.")
                else
                  let bad := disallowedTactics kinds allowed cmd
                  if !bad.isEmpty then some (tacticViolationMessage bad allowed)
                  else
                    -- The graded proof itself is clean; now everything of the student's
                    -- it leans on. See `helperDeps`.
                    match helperDeps sheet submission declCmds name with
                    | .error d =>
                      some (s!"Your proof of this exercise relies on `{d}`, which could "
                        ++ "not be traced to a declaration in your file, so it could not "
                        ++ "be checked against the permitted-tactic list.\nDefine helper "
                        ++ "lemmas as ordinary top-level theorems, outside any namespace.")
                    | .ok helpers =>
                      helpers.findSome? fun (h, hcmd) =>
                        if containsMissing hcmd then
                          some (s!"Your proof relies on `{h}`, a lemma defined in your "
                            ++ "file, which uses syntax not available for this "
                            ++ "assignment.\nDo not define your own tactics.")
                        else
                          let hbad := disallowedTactics kinds allowed hcmd
                          if hbad.isEmpty then none
                          else some (helperViolationMessage h hbad allowed)
          let verdict := extensionVerdict name <|> brokenVerdict name <|> tacticVerdict
            <|> theoremVerdict sheet submission declCmds name
            <|> lemmaVerdict sheet submission declCmds name
          match verdict with
          | none => proofExercises := proofExercises.push (name, pts)
          | some output =>
            immediateResults := immediateResults.push
              { name, score := 0.0, status := "failed", output }
        else
          immediateResults := immediateResults.push
            { name, score := 0.0, status := "failed",
              output := (brokenVerdict name).getD "Declaration not found in submission" }
    else if let some pts := autogradedDefAttr.getParam? sheet name then
      if not name.isInternal then
        if let some subConstInfo := submission.find? name then
          if let some failure := defQuickCheck name name subConstInfo then
            immediateResults := immediateResults.push failure.toExerciseResult
          else
            let target : PinTarget :=
              { subName := name, refName := name,
                refTypeText := ← renderType sheet constInfo.type,
                safetyKeyword := safetyKeywordFor constInfo }
            let i := nextIdx
            nextIdx := nextIdx + 1
            writeComparatorPin i target (combinedTacticBlock sheetContents (tacticsFor sheet name))
            pinTargets := pinTargets.push (i, target, pts)
        else
          immediateResults := immediateResults.push
            { name, score := 0.0, status := "failed",
              output := "Declaration not found in submission" }

  -- Per-exercise timings, printed to stdout (which Gradescope shows in an
  -- assignment's debug output). Comparator is invoked once per exercise and each
  -- invocation rebuilds and re-imports from scratch, so this is where grading time
  -- actually goes -- and it is the number to look at when a submission is slow in a
  -- container but fast locally, since the split between fixed startup and per-exercise
  -- cost is what says whether the problem is the assignment's size or the container.
  let mut results := immediateResults
  for (name, pts) in proofExercises do
    let t0 ← IO.monoMsNow
    let r ← verifyProofViaComparator name name pts sheet
    let t1 ← IO.monoMsNow
    phase s!"timing proof {name}: {t1 - t0} ms"
    results := results.push r.toExerciseResult
  for (i, target, pts) in pinTargets do
    let t0 ← IO.monoMsNow
    let r ← verifyDefViaComparator i target pts sheet
    let t1 ← IO.monoMsNow
    phase s!"timing def {target.subName}: {t1 - t0} ms"
    results := results.push r.toExerciseResult

  -- Gradescope will not accept an empty tests list, and this most likely
  -- indicates a misconfiguration anyway
  if results.size == 0 then
    exitWithError <| "The autograder is unable to grade your submission "
        ++ "because no exercises have been marked as graded by your "
        ++ "instructor. Please notify your instructor of this error and "
        ++ "provide them with a link to this submission."
  -- Report exercises in the order the stencil states them. Grading order follows the
  -- environment's internal hash order, which puts, say, problem_3b before problem_2b.
  let order : Std.HashMap Name Nat :=
    sheetCmds.foldl (init := ∅) fun m cmd =>
      match declNameOf? cmd with
      | some n => if m.contains n then m else m.insert n m.size
      | none => m
  let rank (n : Name) : Nat := order.getD n order.size
  let byRank {α} (key : α → Name) (a : Array α) := a.qsort (fun x y => rank (key x) < rank (key y))
  let mut info : Array Json := #[]
  for name in byRank id handGraded do
    info := info.push <| infoEntry s!"{name} (graded by hand)"
      (handGradedText submission submissionContents declCmds kinds name)
  -- Which build graded this: the commit line of the stamp make_autograder.sh writes.
  let stamp ← try IO.FS.readFile "build_stamp.txt" catch _ => pure ""
  let commit := (stamp.splitOn "\n").filter (·.startsWith "commit:")
  let summary := String.intercalate "\n" ((byRank (·.1) audits).toList.map (·.2) ++ commit)
  return (byRank (·.name) results, info, summary)

def testGradeSubmission (sheet submission : Environment)
    (sheetContents submissionContents : String) : IO (Array ExerciseResultDebug) := do
  writeComparatorRef sheetContents
  writeComparatorSolution submissionContents

  let mut defPinTargets : Array (Nat × PinTarget × Float × String) := #[]
  let mut results : Array ExerciseResultDebug := #[]
  let mut nextIdx := 0

  -- Proof candidates are handled separately below: Comparator looks up the
  -- challenge's theorem `name` by that same name in the solution, so testing
  -- multiple candidates against the same `name` can't share one
  -- `theorem name := candidate` alias in a single `Solution.lean` -- each needs
  -- its own rewrite-and-rebuild.
  let mut proofCandidates : Array (Name × Name × Float × String × String) := #[]

  for (name, constInfo) in sheet.constants.toList do
    if let some pts := autogradedProofAttr.getParam? sheet name then
      if not name.isInternal then
        for (subName, _) in submission.constants.toList do
          if let some (sheetName, expectedStatus) := autograderTestAttr.getParam? submission subName then
            if name == sheetName then
              let typeText ← renderType sheet constInfo.type
              proofCandidates := proofCandidates.push (name, subName, pts, expectedStatus, typeText)
    else if let some pts := autogradedDefAttr.getParam? sheet name then
      if not name.isInternal then
        for (subName, subConstInfo) in submission.constants.toList do
          if let some (sheetName, expectedStatus) := autograderTestAttr.getParam? submission subName then
            if name == sheetName then
              if let some failure := defQuickCheck subName name subConstInfo then
                results := results.push { failure with expected_status := expectedStatus }
              else
                let target : PinTarget :=
                  { subName, refName := name,
                    refTypeText := ← renderType sheet constInfo.type,
                    safetyKeyword := safetyKeywordFor constInfo }
                let i := nextIdx
                nextIdx := nextIdx + 1
                writeComparatorPin i target (combinedTacticBlock sheetContents (tacticsFor sheet name))
                defPinTargets := defPinTargets.push (i, target, pts, expectedStatus)

  for (i, target, pts, expectedStatus) in defPinTargets do
    let r ← verifyDefViaComparator i target pts sheet
    results := results.push { r with expected_status := expectedStatus }

  for (name, subName, pts, expectedStatus, typeText) in proofCandidates do
    writeComparatorSolution (submissionContents ++ s!"\ntheorem {name} : {typeText} := {subName}\n")
    let r ← verifyProofViaComparator name subName pts sheet
    results := results.push { r with expected_status := expectedStatus }

  -- Gradescope will not accept an empty tests list, and this most likely
  -- indicates a misconfiguration anyway
  if results.size == 0 then
    exitWithError <| "The autograder is unable to grade your submission "
        ++ "because no exercises have been marked as graded by your "
        ++ "instructor. Please notify your instructor of this error and "
        ++ "provide them with a link to this submission."

  return results

-- Returns a tuple of (fileName, outputMessage)
def moveFilesIntoPlace (localSubmission : Option String) : IO (String × String) := do
  match localSubmission with
  | none =>
    -- Copy the student's submission to the autograder directory. They should only
    -- have uploaded one Lean file; if they submitted more, we pick the first
    let submittedFiles ← submissionUploadDir.readDir
    let leanFiles := submittedFiles.filter
      (λ f => f.path.extension == some "lean")
    let some leanFile := leanFiles[0]?
      | exitWithError <| "Your submission was not graded because it did not "
          ++ "contain a Lean file. Make sure to upload a single .lean file "
          ++ "containing your solutions."
    IO.FS.writeFile submissionFileName (← IO.FS.readFile leanFile.path)
    let output :=
      if leanFiles.size > 1
      then "Warning: You submitted multiple Lean files. The autograder expects "
        ++ "you to submit a single Lean file containing your solutions, and it "
        ++ s!"will only grade a single file. It has picked {leanFile.fileName} "
        ++ "to grade; this may not be the file you intended to be graded.\n\n"
      else ""
    pure (leanFile.fileName, output)
  | some path =>
    IO.FS.writeFile submissionFileName (← IO.FS.readFile path)
    pure (path, "")

def moveTemplateIntoPlace (localTemplate : Option String) : IO Unit := do
  let assignmentPath ←
    match localTemplate with
    | none =>
      let configRaw ← IO.FS.readFile "config.json"
      let studentErrorText :=
        "The autograder failed to run because it is incorrectly configured. Please "
          ++ "notify your instructor of this error and provide them with a link to "
          ++ "your submission."
      let config ←
        try
          IO.ofExcept <| Json.parse configRaw
        catch _ =>
          exitWithError studentErrorText "Invalid JSON in autograder.json"
      if ← sheetFile.pathExists then FS.removeFile sheetFile
      IO.ofExcept <| config.getObjValAs? String "assignment_path"

    | some path => pure path
  IO.FS.writeFile sheetFile (← IO.FS.readFile assignmentPath)

def compileAutograder : IO Unit := do
  -- Compile the autograder so we get all our deps, even if the sheet itself
  -- fails to compile. Also ensures `comparator`/`lean4export` are built ahead of
  -- grading time.
  let compileArgs : Process.SpawnArgs := {
    cmd := ← lakeCmd
    args := #["build", "autograder", solutionDirName, "comparator", "lean4export"]
  }
  let out ← IO.Process.output compileArgs
  if out.exitCode != 0 then
    IO.println <| "WARNING: The autograder failed to compile. Note that this "
      ++ "may not be an error if your assignment template contains errors. "
      ++ "Compilation errors are printed below:\n"
      ++ out.stderr

/-- The modules a header imports, in order, leaving out `AutograderLib`: only the stencil
needs it, so a submission may omit it. -/
def importedModules (header : HeaderSyntax) : Array Name :=
  (headerToImports header (includeInit := false)).map (·.module)
    |>.filter (· != `AutograderLib)

/-- Whether two headers import the same modules, ignoring order and repetition. -/
def sameImports (a b : HeaderSyntax) : Bool :=
  let norm (h : HeaderSyntax) := (importedModules h).toList.map toString |>.eraseDups
  let (x, y) := (norm a, norm b)
  x.all y.contains && y.all x.contains

/-- What a student who changed the import lines is told to put back. -/
def importsChangedMessage (sheetHeader : HeaderSyntax) : String :=
  "Your file's import lines were changed from the assignment's.\n"
    ++ "Change them back to exactly:\n\n"
    ++ String.intercalate "\n" ((importedModules sheetHeader).toList.map (s!"import {·}"))
    ++ "\n\nand resubmit."

def getErrorsStr (ml : MessageLog) : IO String := do
  let errorMsgs := ml.toList.filter (λ m => m.severity == .error)
  let errors ← errorMsgs.mapM (λ m => m.toString)
  let errorTxt := errors.foldl (λ acc e => acc ++ "\n" ++ e) ""
  return errorTxt

structure ConfigData where
  test            : Bool
  localRun        : Bool
  localSubmission : Option String
  localTemplate   : Option String
  deriving Repr

def parseArgsAux : ConfigData → List String → IO ConfigData
| cd, [] => pure cd
| cd, "--test"::rest => parseArgsAux { cd with test := true } rest
| cd, "--local"::submission::template::rest => parseArgsAux { cd with localRun := true, localSubmission := some submission, localTemplate := some template } rest
| _, s => exitWithError s!"Unknown argument: {s}"

def parseArgs : List String → IO ConfigData :=
  parseArgsAux ⟨false, false, none, none⟩

unsafe def main (args : List String) : IO Unit := do
  let startMs ← IO.monoMsNow
  let cfg ← parseArgs args
  localRunRef.set cfg.localRun

  -- Get files into their appropriate locations
  phase "start"
  let (studentFileName, output) ← moveFilesIntoPlace cfg.localSubmission
  phase "submission copied into place"
  moveTemplateIntoPlace cfg.localTemplate
  phase "problem set copied into place"
  -- We need to compile the AutograderTests directory to ensure that any
  -- libraries on which we depend get compiled (even if the sheet itself fails
  -- to compile)

  if !cfg.localRun then compileAutograder
  phase "lake build finished"

  -- Import the sheet (i.e., template/stencil)
  let sheetContents ← IO.FS.readFile sheetFile
  let sheetCtx := Parser.mkInputContext sheetContents sheetFileName
  let (sheetHeader, sheetParState, sheetMsgs) ← Parser.parseHeader sheetCtx

  enableInitializersExecution
  initSearchPath (← findSysroot)

  let (sheetHeadEnv, sheetMsgs)
    ← processHeader sheetHeader {} sheetMsgs sheetCtx

  if sheetMsgs.hasErrors then
    exitWithError (instructorInfo := (← getErrorsStr sheetMsgs)) <|
      "There was an error processing the assignment template's imports. This "
        ++ "error is unexpected. Please notify your instructor and provide a "
        ++ "link to your submission."

  let sheetCmdState : Command.State := Command.mkState sheetHeadEnv sheetMsgs {}
  phase "elaborating problem set"
  let sheetFrontEndState
    ← IO.processCommands sheetCtx sheetParState sheetCmdState
  let sheet := sheetFrontEndState.commandState.env
  phase "problem set elaborated"


  -- Grade the student submission
  -- Source: https://github.com/adamtopaz/lean_grader/blob/master/Main.lean
  let submissionContents ← IO.FS.readFile submissionFileName
  let inputCtx := Parser.mkInputContext submissionContents studentFileName
  let (header, parserState, messages) ← Parser.parseHeader inputCtx

  -- Enable initializers again before processing the submission's header: calling
  -- `processHeader` disables initializer execution as a side effect, and (unlike
  -- with older toolchains) it must be re-enabled before the second call.
  enableInitializersExecution
  let (headerEnv, messages) ← processHeader header {} messages inputCtx

  if messages.hasErrors && !sameImports header sheetHeader then
    exitWithError (instructorInfo := (← getErrorsStr messages)) <|
      "Your file could not be graded.\n" ++ importsChangedMessage sheetHeader
  -- `sameImports` above is consulted only when the header failed to load, so a submission
  -- that compiles while importing something extra was accepted in silence. An extra import
  -- can strengthen a tactic the exercise permits -- a `norm_num` or `simp` extension, say --
  -- so it is refused whether or not the file compiles. Leaving one out is not refused: that
  -- can only take things out of scope, never add them, and a student who drops an import
  -- their proof never needed should not lose the assignment for it.
  let sheetModules := importedModules sheetHeader
  let extraImports := (importedModules header).filter (!sheetModules.contains ·)
  unless extraImports.isEmpty do
    exitWithError <|
      s!"Your file imports {String.intercalate ", " (extraImports.toList.map (s!"`{·}`"))}, "
        ++ "which this assignment does not.\n" ++ importsChangedMessage sheetHeader
  if messages.hasErrors then
    exitWithError <|
      "Your Lean file could not be processed because its header contains "
      ++ "errors. This is likely because you are attempting to import a module "
      ++ "that does not exist. A log of these errors is provided below; please "
      ++ "correct them and resubmit:\n\n"
      ++ (← getErrorsStr messages)

  phase "elaborating submission"
  let cmdState : Command.State := Command.mkState headerEnv messages {}
  let frontEndState ← IO.processCommands inputCtx parserState cmdState
  let messages := frontEndState.commandState.messages
  let submissionEnv := frontEndState.commandState.env

  let err ← getErrorsStr messages
  let output := output ++
    (if messages.hasErrors && !sameImports header sheetHeader
     then importsChangedMessage sheetHeader ++ "\n\n" else "") ++
    if messages.hasErrors
    then "Warning: Your submission contains one or more errors, which are "
          ++ "listed below. You should attempt to correct these errors prior "
          ++ "to your final submission. Any responses with errors will be "
          ++ "treated by the autograder as containing \"sorry.\"\n"
          ++ err
    else ""

  -- Provide debug info for staff
  IO.println "Submission compilation output:"
  let os ← messages.toList.mapM (λ m => m.toString)
  IO.println <| os.foldl (·++·) ""

  phase s!"timing setup + elaboration: {(← IO.monoMsNow) - startMs} ms"

  if cfg.test then
    let tests : Array ExerciseResultDebug ←
      testGradeSubmission sheet submissionEnv sheetContents submissionContents
    let mut map : Std.HashMap _ _ := ∅
    if cfg.localRun then
      println "Results:"
      -- Store exercise results in a map ⟨sheet_name, [results]⟩
      for er in tests do
        if let some ers := map[er.sheet_name]? then
          map := map.insert er.sheet_name (ers ++ [er])
        else
          map := map.insert er.sheet_name [er]
      -- Print results
      -- TODO: sort by name
      for (name, ers) in map.toList do
        IO.println s!"{name}"
        let mut correct := 0
        let mut total := 0
        for er in ers do
          er.print
          if er.status == er.expected_status then correct := correct + 1
          total := total + 1
        IO.println s!"Passed {correct}/{total} test cases!"
        IO.println ""
    else
      IO.FS.writeFile resultsJsonPath (toJson (tests.map fun exdbg => exdbg.toExerciseResult)).pretty
  else
    let errorSites : ErrorSites ←
      (messages.toList.filter (·.severity == .error)).toArray.mapM fun m => do
        return (inputCtx.fileMap.ofPosition m.pos, s!"Line {m.pos.line}: {← m.data.toString}")
    let (tests, info, summary) ←
      gradeSubmission sheet submissionEnv sheetContents submissionContents errorSites
    let results : GradingResults := { tests, output }
    if cfg.localRun then
      results.print
      for entry in info do
        IO.println s!"── {(entry.getObjValAs? String "name").toOption.getD ""} (no points) ──"
        IO.println s!"{(entry.getObjValAs? String "output").toOption.getD ""}\n"
      IO.println s!"── Proof summary (hidden from students) ──\n{summary}"
    else
      IO.FS.writeFile resultsJsonPath (withInfoEntries (toJson results) info).pretty
      IO.FS.writeFile proofSummaryPath (summary ++ "\n")

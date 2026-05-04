# Code/Test Sync Checklist

## Change Scan
- Identify all changed files in affected modules.
- List modified interfaces/functions/methods and behavior impact.
- Confirm whether API/output shape changed.

## Coverage Scan
- Check for existing test file(s) for each changed component in that module.
- Verify assertions include:
- Happy path.
- Invalid input handling.
- Boundary/index/range behavior.
- Empty/null data behavior when applicable.

## Command Detection
- Check for explicit project test entrypoints first (`make test`, `just test`, task runner targets, package scripts).
- If absent, infer by module markers (`go.mod`, `package.json`, `pyproject.toml`, `Cargo.toml`, `pom.xml`, `build.gradle*`, `CMakeLists.txt`).
- For multi-module changes, select and run commands per module before any root aggregate command.

## Required Actions
- Add missing tests for uncovered changed behavior.
- Update outdated assertions to match intended behavior.
- Remove or rewrite flaky test logic.

## Final Gate
- Auto-detected module-native test command(s) pass (for example `go test ./...`, `pytest`, `npm test`, `ctest`).
- Every behavior change has at least one direct unit-test assertion.
- No unresolved mismatch remains between implementation and tests.

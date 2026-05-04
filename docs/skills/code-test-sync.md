# Code Test Sync

- Skill ID: `code-test-sync`
- SKILL gốc: [skills/code-test-sync/SKILL.md](../../skills/code-test-sync/SKILL.md)
- Agent config: [skills/code-test-sync/agents/openai.yaml](../../skills/code-test-sync/agents/openai.yaml)
- Thư mục references: [skills/code-test-sync/references](../../skills/code-test-sync/references)

## Description / Mô tả

### EN
- Core purpose: Synchronize implementation and unit tests after repository changes. Use when code updates may introduce behavior drift and tests are missing or outdated.
- Scope of work:
  - Inspect related implementation, configuration, tests, and documentation.
  - Identify mismatches between expected behavior and current state.
  - Apply focused, low-risk updates that are easy to review and roll back.
- Expected outputs:
  - A concrete set of changed files aligned with the skill objective.
  - Validation evidence, residual risks, and follow-up recommendations.

### VI
- Mục tiêu cốt lõi: Nâng độ chính xác, ổn định và khả năng bảo trì cho nhóm thay đổi thuộc phạm vi kỹ năng này.
- Phạm vi thực hiện:
  - Rà soát mã nguồn, cấu hình, kiểm thử và tài liệu liên quan.
  - Phát hiện điểm lệch giữa hành vi kỳ vọng và trạng thái hiện tại.
  - Cập nhật có kiểm soát, phạm vi nhỏ, dễ rà soát và có thể hoàn tác an toàn.
- Kết quả mong đợi:
  - Danh sách thay đổi rõ ràng, bám sát mục tiêu của kỹ năng.
  - Bằng chứng xác minh, rủi ro còn lại và đề xuất bước tiếp theo.

## Detailed Features / Tính năng chi tiết



Keep implementation and tests synchronized across modules and languages so behavior changes are covered by automated checks.

## Trigger
Use this skill when:
- Code changed in any module (for example `services/*`, `packages/*`, `src/*`, `cmd/*`).
- A bug fix or feature was added but no matching test exists.
- Existing tests assert outdated behavior.

## Workflow
1. Inventory changed logic:
- Identify modified interfaces/functions/methods, edge-case handling, and return/output shapes.
2. Map to test coverage:
- Find corresponding test files in the same module using local conventions (for example `*_test.go`, `test_*.py`, `*.spec.ts`, `*_test.c`).
- Mark uncovered scenarios as required additions.
3. Auto-detect test command per affected module:
- Prefer explicit repo scripts/targets first (for example `make test`, `just test`, `task test`, `npm test`).
- If no project wrapper exists, infer by module markers:
  - `go.mod` -> `go test ./...`
  - `package.json` -> `npm test` (or project-defined test script)
  - `pyproject.toml` / `pytest.ini` -> `pytest`
  - `Cargo.toml` -> `cargo test`
  - `pom.xml` / `build.gradle*` -> module-native test command
  - `CMakeLists.txt` -> `ctest` (after build/test setup)
- If multiple modules changed, run each module test command first, then run root-level aggregate tests when available.
4. Patch tests first where possible:
- Add or update tests to mirror module boundaries and naming conventions.
- Cover happy path, boundary cases, and invalid input handling.
5. Patch implementation only if test failures reveal defects:
- Keep fixes minimal and tied to failing assertions.
6. Validate:
- Run the auto-detected module test command(s) (examples: `go test ./...`, `pytest`, `npm test`, `ctest`).
- Ensure new tests fail before fix and pass after fix when feasible.
7. Report:
- List changed code paths and the exact tests that now cover them.

## Repository Rules
- If implementation behavior changes, unit tests must be updated in the same change.
- If no test update is needed, explicitly state why the existing coverage already applies.
- Prefer deterministic tests without external I/O or time dependence.
- Prefer per-module test runs first, then broader project test runs when available.
- When auto-detection is ambiguous, prefer explicit project scripts/Make targets over framework defaults.

## Missing Coverage Policy
- If a changed behavior has no unit test, add one before finalizing.
- If the codebase has no existing test file for that component, create one in the same module using that language's naming convention.

## Reference
Use checklist: `references/sync-checklist.md`.

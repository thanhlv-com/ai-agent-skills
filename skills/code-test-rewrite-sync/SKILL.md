---
name: code-test-rewrite-sync
description: Rewrite or update tests to match current intended code logic after behavior changes, while preserving meaningful coverage and preventing false failures.
---

# Code Test Rewrite Sync

Rewrite tests when implementation logic has intentionally changed, so the suite reflects current behavior instead of legacy assumptions.

## Trigger
Use this skill when:
- Existing tests fail after code changes and assertions are based on old logic.
- Refactors change output shape, error handling, ordering, or boundary behavior.
- Multiple modules changed and test drift is larger than simple assertion tweaks.

## Workflow
1. Confirm intent of code changes:
- Identify which behavior changed intentionally vs. which regressions are accidental.
- Treat current implementation as source of truth unless product/spec docs say otherwise.
2. Detect stale tests:
- Locate failing or brittle tests in affected modules.
- Mark assertions tied to removed side effects, old return formats, or outdated error messages.
3. Rewrite tests by behavior contract:
- Keep coverage for happy path, boundary conditions, and invalid input.
- Replace implementation-detail assertions with contract-level assertions.
- Update fixtures/mocks to match current data flow and module boundaries.
4. Add missing cases introduced by new logic:
- Add direct tests for new branches and edge cases.
- Remove or replace tests for behavior that no longer exists intentionally.
5. Validate:
- Run module-native test commands first, then aggregate test command if available.
- Ensure rewritten tests fail on old behavior and pass on current intended behavior when feasible.
6. Report:
- List rewritten test files, dropped legacy assumptions, and newly covered branches.

## Repository Rules
- If behavior changed intentionally, tests must be rewritten in the same change.
- Do not silently weaken assertions; make expected behavior explicit.
- Prefer deterministic tests without real network/time/filesystem dependencies unless required.

## Reference
Use checklist: `references/rewrite-checklist.md`.

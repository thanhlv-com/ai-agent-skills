---
name: sql-injection-defense
description: Eliminate SQL injection risks in data access code.
---

# SQL Injection Defense

Use this skill to harden query construction and validate attack-path tests.

## Trigger
Use this skill when:
- Related changes affect correctness, reliability, or maintainability in this area.
- Existing tests/docs/process are outdated for the current implementation.
- A release-risk or regression risk needs proactive mitigation.

## Workflow
1. Scope and intent:
- Identify affected modules, interfaces, and expected behavior.
2. Gap analysis:
- Detect drift between current implementation and expected outcomes.
3. Implementation:
- Apply focused changes with minimal blast radius.
4. Validation:
- Run module-native checks/tests and verify no regression.
5. Report:
- Summarize changed files, risk decisions, and follow-up actions.

## Repository Rules
- Keep changes scoped and reversible.
- Update tests/docs in the same change when behavior is modified.
- Prefer deterministic checks and explicit acceptance criteria.

## Reference
Use checklist: `references/checklist.md`.

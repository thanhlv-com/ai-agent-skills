---
name: git-commit-rationale
description: Create high-signal git commits with complete rationale, implementation detail, and risk context.
---

# Git Commit Rationale

Use this skill when preparing a commit so the commit message explains not only what changed, but also why the change was required, how it was implemented, and what tradeoffs were accepted.

## Trigger
Use this skill when:
- A change spans multiple files or behavior-sensitive logic.
- Future maintainers may not understand intent from diff-only context.
- You need audit-quality commit history for incidents, refactors, or production fixes.

## Workflow
1. Collect change context:
- Run `git status --short` and `git diff --staged` (or `git diff` before staging).
- Group changed files by purpose (bug fix, refactor, docs, tests, infra).
- Identify user/business impact and technical impact.

2. Extract rationale before writing message:
- Problem: what concrete issue existed before the change.
- Cause: why the issue happened (root cause, constraint, or drift).
- Decision: why this solution was chosen over alternatives.
- Method: how the solution was implemented (key mechanisms and boundaries).
- Risk: what could still go wrong and how risk is contained.

3. Prepare commit scope:
- Keep one logical concern per commit where possible.
- Separate pure formatting/noise from behavioral changes.
- Ensure tests/docs updates needed by this behavior are included in the same commit.

4. Write a structured commit message:
- Subject line: imperative summary of outcome.
- Body sections (recommended):
  - `Context`: background and symptoms.
  - `Root Cause`: why the previous behavior failed.
  - `Change`: precise implementation details and touched areas.
  - `Why This Approach`: reasons and tradeoffs.
  - `Validation`: tests/checks and manual verification done.
  - `Risk / Rollback`: residual risks and rollback strategy.

5. Commit and verify:
- Use multi-line commit command for clarity.
- Re-read with `git show --stat --pretty=fuller <commit>` and ensure body matches diff.
- If body omits intent or risk, amend before sharing.

## Commit Message Template
Use this template (adapt as needed):

```text
<type>(<scope>): <short imperative summary>

Context:
- <what was happening>
- <who/what was impacted>

Root Cause:
- <technical or process cause>

Change:
- <key code/path change 1>
- <key code/path change 2>
- <non-obvious implementation detail>

Why This Approach:
- <decision rationale>
- <tradeoff accepted and reason>

Validation:
- <automated tests/checks run>
- <manual verification and result>

Risk / Rollback:
- <remaining risk>
- <rollback or mitigation plan>
```

## Repository Rules
- Do not claim validation that was not executed.
- Reference file paths and behavior, not vague statements.
- Prefer factual, reproducible wording over narrative.
- If skipping tests, explain exactly why and expected follow-up.

## Reference
Use checklist: `references/checklist.md`.

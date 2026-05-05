---
name: pull-request-rationale
description: Create pull requests with clear title and detailed description that explain context, root cause, implementation, rationale, impact, validation, and risk/rollback notes.
---

# Pull Request Rationale

Use this skill when creating or polishing a pull request so reviewers can quickly understand what changed, why it changed, and how safe the rollout is.

## Trigger
Use this skill when:
- The PR touches behavior, contracts, or user-visible flows.
- Reviewers need clear context and decision rationale, not only a diff.
- You want to reduce back-and-forth by providing complete validation and risk notes upfront.

## Workflow
1. Collect PR context before writing:
- Set source branch as the current checked-out branch: `git rev-parse --abbrev-ref HEAD`.
- Ask user to provide target branch (`main`, `dev`, or any branch).
- Build diff context with target branch:
  - `git diff --name-status <target-branch>...<source-branch>`
  - `git log --oneline <target-branch>..<source-branch>`
- Capture problem statement, affected users/systems, and urgency.
- Note rollout constraints, dependencies, or known limitations.

2. Define a high-signal PR title:
- Keep title short and outcome-focused.
- Use action + scope + expected result.
- Avoid vague titles like `update`, `fix stuff`, or `misc changes`.

3. Build a structured PR description:
- `Context`: background and operational/business scenario.
- `Problem`: concrete symptom before this change.
- `Root Cause`: why the old behavior failed.
- `Change`: what was implemented, by area/path.
- `Why This Approach`: decision logic and tradeoffs.
- `Impact`: user impact, API impact, performance/security impact.
- `Validation`: tests/checks/manual verification with outcomes.
- `Risk / Rollback`: residual risks, detection signal, rollback plan.

4. Explain rationale and alternatives explicitly:
- State why this approach was chosen.
- Mention alternatives considered and why they were not selected.
- Clarify constraints that affected the decision (time, compatibility, infra, policy).

5. Quality-check PR content:
- Ensure each claim maps to actual code or verification.
- Ensure title and description stay consistent with final diff.
- Remove ambiguous wording and replace with reproducible facts.

## PR Template
Use this template (adapt as needed):

```text
<type>(<scope>): <short outcome-focused summary>

## Branches
- Source branch: <current checked-out branch>
- Target branch: <main | dev | any>

## Context
- <business/technical background>
- <who or what is impacted>

## Problem
- <observable issue before change>

## Root Cause
- <why previous behavior failed>

## Change
- <key implementation change 1>
- <key implementation change 2>
- <non-obvious detail reviewers should know>

## Why This Approach
- <why this solution was selected>
- <tradeoff accepted and reason>
- <alternative considered and why rejected>

## Impact
- <user impact>
- <API/schema/contract impact>
- <performance/security/operational impact>

## Validation
- <automated tests/checks and result>
- <manual verification and result>

## Risk / Rollback
- <remaining risks and detection signals>
- <rollback or mitigation steps>
```

## PR Writing Rules
- Always state source and target branch in the PR body.
- Do not claim tests/checks you did not run.
- Prefer concrete evidence (file paths, metrics, logs) over generic statements.
- Keep terminology consistent with code and domain language.
- If something is intentionally deferred, state owner and follow-up plan.

## Reference
Use checklist: `references/checklist.md`.

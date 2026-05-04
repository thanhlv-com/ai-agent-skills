---
name: request-analysis-planning
description: For new requests, analyze context and create an execution plan before implementation.
---

# Request Analysis Planning

Use this skill when a new request arrives and execution should start only after analysis and planning.

## Trigger
Use this skill when:
- The request introduces new scope, new files, or non-trivial changes.
- The expected behavior, risks, or dependencies are not fully explicit.
- Work involves multiple steps that need ordering.

## Workflow
1. Analyze request:
- Restate objective, scope, constraints, and expected outcome.
- List assumptions and unknowns.
2. Baseline discovery:
- Inspect current code/docs/process relevant to the request.
- Identify impacted modules, interfaces, and artifacts.
3. Plan before execution:
- Define ordered steps, validation strategy, and rollback idea.
- Highlight risk points and decision gates.
4. Execute plan:
- Implement in small, scoped changes aligned to the plan.
- Update the plan if new findings require adjustment.
5. Validate and report:
- Run targeted checks/tests.
- Summarize final changes, deviations from plan, and residual risks.

## Repository Rules
- Do not skip analysis and planning for non-trivial requests.
- Keep plan steps testable and observable.
- Keep implementation aligned with the latest agreed plan.

## Reference
Use checklist: `references/checklist.md`.

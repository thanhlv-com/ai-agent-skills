---
name: request-analysis-planning
description: For every request, analyze context and create an execution plan before implementation.
---

# Request Analysis Planning

Use this skill for every incoming request. Execution should start only after analysis and planning.

## Trigger
Use this skill on all requests:
- Always perform a brief analysis and plan before execution.
- Use a compact plan for simple tasks.
- Use a detailed plan for non-trivial, risky, or multi-step changes.

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
- Do not skip analysis and planning for any request.
- Keep plan steps testable and observable.
- Keep implementation aligned with the latest agreed plan.

## Reference
Use checklist: `references/checklist.md`.

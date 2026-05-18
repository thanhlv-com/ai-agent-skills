---
name: request-planning
description: Plan execution before taking action for incoming requests. Use when the user asks to plan first, or when any request needs clear goals, constraints, assumptions, ordered steps, risk checks, and validation checkpoints before implementation.
---

# Request Planning

Create an execution plan before performing edits, commands, or recommendations.

## Planning Depth
Choose depth based on task complexity:

- `micro`: one-step or low-risk requests. Produce 1 to 2 concise steps.
- `standard`: typical implementation tasks. Produce 3 to 6 ordered steps.
- `deep`: ambiguous or high-risk tasks. Add dependencies, fallback paths, and explicit decision gates.

## Workflow
1. Capture request intent:
- Restate target outcome in one sentence.
- Extract explicit constraints (time, tools, scope, environment).
- Identify required deliverables.

2. Define success criteria:
- List concrete completion conditions.
- Separate mandatory outcomes from optional improvements.

3. Declare assumptions and unknowns:
- Mark assumptions clearly.
- Flag blocking unknowns that can change implementation direction.

4. Build action plan:
- Create ordered steps from discovery to delivery.
- Include validation points after meaningful changes.
- Keep exactly one active step at a time.

5. Execute and adjust:
- Start with the first step immediately after planning.
- Revise the plan when new evidence appears.
- Report what changed and why.

## Decision Rules
- Ask a concise clarifying question only when uncertainty is blocking or high risk.
- Otherwise make the safest reasonable assumption and continue.
- Never perform destructive actions without explicit user approval.
- Keep progress updates short and tied to the active step.

## Output Rules
- Keep plan items actionable and verifiable.
- Prefer concrete commands/paths over abstract statements.
- Include validation strategy and residual risks in the final summary.

## Reference
Use checklist: `references/checklist.md`.

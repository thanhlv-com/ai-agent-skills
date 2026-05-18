# Request Planning

- Skill ID: `request-planning`
- SKILL gốc: [skills/request-planning/SKILL.md](../../skills/request-planning/SKILL.md)
- Agent config: [skills/request-planning/agents/openai.yaml](../../skills/request-planning/agents/openai.yaml)
- Thư mục references: [skills/request-planning/references](../../skills/request-planning/references)

## Description / Mô tả

### EN
- Core purpose: Plan execution before taking action for incoming requests.
- Scope of work:
  - Clarify outcomes, constraints, and required deliverables.
  - Build an ordered plan with assumptions, risks, and validation checkpoints.
  - Execute with continuous plan updates when new evidence appears.
- Expected outputs:
  - A clear, actionable plan with explicit success criteria.
  - A delivery summary with validation evidence and residual risks.

### VI
- Mục tiêu cốt lõi: Lập kế hoạch trước khi thực thi bất kỳ yêu cầu nào.
- Phạm vi thực hiện:
  - Làm rõ mục tiêu đầu ra, ràng buộc và deliverable cần có.
  - Xây dựng kế hoạch theo thứ tự với giả định, rủi ro và checkpoint xác minh.
  - Cập nhật kế hoạch liên tục khi có thông tin mới trong quá trình thực thi.
- Kết quả mong đợi:
  - Kế hoạch rõ ràng, có thể hành động và kiểm chứng.
  - Tóm tắt kết quả có bằng chứng xác minh và rủi ro còn lại.

## Detailed Features / Tính năng chi tiết

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

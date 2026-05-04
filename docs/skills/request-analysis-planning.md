# Request Analysis Planning

- Skill ID: `request-analysis-planning`
- SKILL gốc: [skills/request-analysis-planning/SKILL.md](../../skills/request-analysis-planning/SKILL.md)
- Agent config: [skills/request-analysis-planning/agents/openai.yaml](../../skills/request-analysis-planning/agents/openai.yaml)
- Thư mục references: [skills/request-analysis-planning/references](../../skills/request-analysis-planning/references)

## Description / Mô tả

### EN
- Core purpose: For every request, analyze context and create an execution plan before implementation.
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

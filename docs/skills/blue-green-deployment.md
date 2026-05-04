# Blue Green Deployment

- Skill ID: `blue-green-deployment`
- SKILL gốc: [skills/blue-green-deployment/SKILL.md](../../skills/blue-green-deployment/SKILL.md)
- Agent config: [skills/blue-green-deployment/agents/openai.yaml](../../skills/blue-green-deployment/agents/openai.yaml)
- Thư mục references: [skills/blue-green-deployment/references](../../skills/blue-green-deployment/references)

## Description / Mô tả

### EN
- Core purpose: Adopt blue-green deployments for low-risk releases.
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



Use this skill to set up blue-green switching and validation checks.

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

# Code Comment Docs

- Skill ID: `code-comment-docs`
- SKILL gốc: [skills/code-comment-docs/SKILL.md](../../skills/code-comment-docs/SKILL.md)
- Agent config: [skills/code-comment-docs/agents/openai.yaml](../../skills/code-comment-docs/agents/openai.yaml)
- Thư mục references: [skills/code-comment-docs/references](../../skills/code-comment-docs/references)

## Description / Mô tả

### EN
- Core purpose: Write and maintain high-signal code comments and inline documentation so future maintainers can understand intent, constraints, and usage quickly.
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



Use this skill to add or improve comments/docstrings that explain intent, invariants, and non-obvious behavior without restating code.

## Trigger
Use this skill when:
- Code is hard to understand without hidden context.
- Complex logic, edge-case handling, or tradeoffs are introduced.
- Public APIs, modules, or classes lack usage-oriented documentation.
- Existing comments are stale, misleading, or noisy.

## Workflow
1. Identify high-value targets:
- Public interfaces, complex functions, cross-module flows, and error/retry logic.
2. Classify documentation level:
- API docs/docstrings for externally consumed behavior.
- Inline comments for non-obvious implementation decisions.
- File/module headers for architecture context when needed.
3. Write high-signal comments:
- Explain why, constraints, assumptions, and failure modes.
- Prefer concise sentences and concrete terminology.
- Avoid narrating obvious lines of code.
4. Synchronize and prune:
- Remove outdated or redundant comments.
- Ensure names, params, return values, and side effects match implementation.
5. Validate:
- Re-read changed code as a new maintainer.
- Confirm comments still hold after tests/checks.

## Repository Rules
- Keep comments close to the code they explain.
- If behavior changes, update related comments/docs in the same change.
- Favor examples for tricky API usage and edge cases.
- Do not keep TODO comments without owner or context.

## Reference
Use checklist: `references/checklist.md`.

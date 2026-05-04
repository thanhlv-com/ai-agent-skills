# Code Test Rewrite Sync

- Skill ID: `code-test-rewrite-sync`
- SKILL gốc: [skills/code-test-rewrite-sync/SKILL.md](../../skills/code-test-rewrite-sync/SKILL.md)
- Agent config: [skills/code-test-rewrite-sync/agents/openai.yaml](../../skills/code-test-rewrite-sync/agents/openai.yaml)
- Thư mục references: [skills/code-test-rewrite-sync/references](../../skills/code-test-rewrite-sync/references)

## Description / Mô tả

### EN
- Core purpose: Rewrite or update tests to match current intended code logic after behavior changes, while preserving meaningful coverage and preventing false failures.
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



Rewrite tests when implementation logic has intentionally changed, so the suite reflects current behavior instead of legacy assumptions.

## Trigger
Use this skill when:
- Existing tests fail after code changes and assertions are based on old logic.
- Refactors change output shape, error handling, ordering, or boundary behavior.
- Multiple modules changed and test drift is larger than simple assertion tweaks.

## Workflow
1. Confirm intent of code changes:
- Identify which behavior changed intentionally vs. which regressions are accidental.
- Treat current implementation as source of truth unless product/spec docs say otherwise.
2. Detect stale tests:
- Locate failing or brittle tests in affected modules.
- Mark assertions tied to removed side effects, old return formats, or outdated error messages.
3. Rewrite tests by behavior contract:
- Keep coverage for happy path, boundary conditions, and invalid input.
- Replace implementation-detail assertions with contract-level assertions.
- Update fixtures/mocks to match current data flow and module boundaries.
4. Add missing cases introduced by new logic:
- Add direct tests for new branches and edge cases.
- Remove or replace tests for behavior that no longer exists intentionally.
5. Validate:
- Run module-native test commands first, then aggregate test command if available.
- Ensure rewritten tests fail on old behavior and pass on current intended behavior when feasible.
6. Report:
- List rewritten test files, dropped legacy assumptions, and newly covered branches.

## Repository Rules
- If behavior changed intentionally, tests must be rewritten in the same change.
- Do not silently weaken assertions; make expected behavior explicit.
- Prefer deterministic tests without real network/time/filesystem dependencies unless required.

## Reference
Use checklist: `references/rewrite-checklist.md`.

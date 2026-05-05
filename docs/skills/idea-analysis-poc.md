# Idea Analysis POC

- Skill ID: `idea-analysis-poc`
- SKILL gốc: [skills/idea-analysis-poc/SKILL.md](../../skills/idea-analysis-poc/SKILL.md)
- Agent config: [skills/idea-analysis-poc/agents/openai.yaml](../../skills/idea-analysis-poc/agents/openai.yaml)
- Thư mục references: [skills/idea-analysis-poc/references](../../skills/idea-analysis-poc/references)

## Description / Mô tả

### EN
- Core purpose: Transform a raw user idea into a structured concept package by analyzing problem-space, expanding solution options, and producing practical POC artifacts.
- Scope of work:
  - Clarify idea baseline, assumptions, constraints, and success conditions.
  - Explore multiple solution directions with explicit tradeoffs.
  - Build a concrete artifact set to start a focused POC quickly.
- Expected outputs:
  - A recommended POC direction with rationale.
  - A reusable package of planning and validation documents.

### VI
- Mục tiêu cốt lõi: Chuyển một ý tưởng ban đầu thành bộ tài liệu có cấu trúc thông qua phân tích bài toán, mở rộng phương án giải pháp và chuẩn bị đầy đủ đầu ra cho POC.
- Phạm vi thực hiện:
  - Làm rõ ý tưởng gốc, giả định, ràng buộc và điều kiện thành công.
  - Mở rộng nhiều hướng giải pháp và so sánh trade-off rõ ràng.
  - Tạo bộ tài liệu đủ chi tiết để khởi động POC nhanh, có kiểm soát.
- Kết quả mong đợi:
  - Hướng POC được khuyến nghị kèm lý do lựa chọn.
  - Bộ tài liệu lập kế hoạch và xác minh có thể tái sử dụng.

## Detailed Features / Tính năng chi tiết

Use this skill when a user provides an initial idea and asks for deep analysis, expansion, and concrete materials to execute a POC.

## Trigger
Use this skill when:
- The input is still a rough concept and lacks clear scope.
- The user wants structured exploration before implementation.
- The goal is to generate actionable POC documentation and execution assets.

## Workflow
1. Clarify the idea baseline:
- Restate the core idea in one sentence.
- Identify target users, pain points, expected value, and constraints.
- List explicit assumptions and unknowns that must be validated.

2. Analyze opportunity and feasibility:
- Define the problem statement and why existing alternatives are insufficient.
- Evaluate feasibility from product, technical, operational, and business angles.
- Highlight dependencies, major risks, and success conditions.

3. Expand idea into options:
- Generate at least 2 to 3 viable solution directions.
- Compare options using tradeoffs: complexity, time-to-value, risk, scalability.
- Recommend one primary direction and justify choice.

4. Produce POC-ready artifacts:
- Create POC brief: objective, scope, non-goals, hypotheses.
- Create solution outline: architecture sketch, core flow, data/contracts, key components.
- Create execution plan: milestones, deliverables, timeline, ownership.
- Create validation plan: success metrics, test scenarios, experiment method.
- Create risk register and mitigation actions.

5. Final synthesis:
- Summarize recommended POC path and expected learning outcomes.
- List immediate next actions (first 3 to 5 concrete tasks).
- State open questions requiring user or stakeholder decisions.

## Output Rules
- Keep outputs structured, actionable, and implementation-oriented.
- Separate assumptions from verified facts.
- Avoid vague advice; provide concrete artifact sections.
- Use concise templates that can be copied directly into project docs.

## Reference
Use checklist: `references/checklist.md`.

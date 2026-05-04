# Git Commit Rationale Checklist

## Scope Integrity
- Confirm the commit contains one logical concern.
- Split unrelated changes into separate commits.
- Ensure staged files match the intended narrative.

## Rationale Completeness
- State the concrete problem and impact.
- State root cause (technical/process), not only symptoms.
- Explain why this solution was selected over alternatives.
- Document key tradeoffs (performance, complexity, compatibility, delivery speed).

## Implementation Clarity
- Mention critical files/modules touched.
- Describe the mechanism of the fix/change, not only outcomes.
- Call out edge-case handling and explicit non-goals.

## Validation Quality
- List exact checks run (tests, lint, type-check, smoke, manual).
- Record outcomes factually (pass/fail/partial, with limits).
- If validation is deferred, state why, risk level, and owner/follow-up.

## Risk Transparency
- Note residual risk after merge.
- Define rollback strategy or safe fallback.
- Highlight any migration/order-of-operations requirements.

## Final Gate
- Subject line is imperative and specific.
- Commit body sections are present and non-empty.
- Message can be understood without opening external chat/context.

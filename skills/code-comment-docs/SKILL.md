---
name: code-comment-docs
description: Write and maintain high-signal code comments and inline documentation so future maintainers can understand intent, constraints, and usage quickly.
---

# Code Comment Docs

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

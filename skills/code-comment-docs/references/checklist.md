# Code Comment Docs Checklist

## Scope
- Identify code paths that are non-obvious for a new maintainer.
- Prioritize public APIs and complex control flow.

## Comment Quality Gate
- Comment explains why or constraints, not what obvious code already says.
- Terminology matches actual identifiers and domain language.
- No stale behavior claims after recent code changes.

## Docstring Quality Gate
- Inputs, outputs, side effects, and error behavior are documented.
- Preconditions/invariants are explicit when relevant.
- Include short usage example for non-trivial APIs.

## Cleanup Gate
- Remove redundant comments and dead TODO notes.
- Ensure formatting/style is consistent in touched files.

## Final Gate
- A new maintainer can understand intent without external tribal knowledge.
- Comments/docs remain aligned with the final implementation.

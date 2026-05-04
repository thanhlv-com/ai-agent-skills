# Test Rewrite Checklist

## Intent Lock
- Confirm changed logic is intentional (code comments, spec, issue, or maintainer note).
- Separate intentional behavior changes from potential regressions.
- Document the expected behavior contract in 1-3 clear rules before rewriting assertions.

## Stale Test Detection
- Identify failing tests in affected modules.
- Flag assertions tied to old output formats, side effects, or ordering assumptions.
- Flag over-coupled tests that assert internal implementation details.
- Flag tests that pass for the wrong reason (weak assertions, broad mocks, unused fixtures).

## Rewrite Actions
- Rewrite assertions to validate behavior contract, not internals.
- Update fixtures/mocks/builders to current module data flow.
- Add tests for new branches and changed edge cases.
- Remove or replace tests for intentionally removed behavior.

## Functional Coverage Matrix
- Happy path with representative valid inputs.
- Equivalent valid inputs that should produce the same outcome.
- Optional field present vs absent behavior.
- Single-item vs multi-item collection behavior.
- Deterministic ordering/sorting when contract requires stable order.
- Idempotency for repeated calls when operation should be idempotent.

## Input Validation and Negative Cases
- Null/None/nil input where applicable.
- Empty string/empty collection/zero-value inputs.
- Min-1, min, min+1 boundaries.
- Max-1, max, max+1 boundaries.
- Invalid type/shape/schema inputs.
- Malformed payload format (truncated, extra fields, unknown enum value).
- Illegal state transitions (operation called in wrong state).

## Error and Recovery Behavior
- Expected error type/code/message contract.
- Error mapping consistency across code paths.
- Partial failure handling for batch operations.
- Retry-safe behavior (duplicate request, timeout retry).
- Fallback behavior when dependency fails.
- Resource cleanup on error paths.

## State and Side Effects
- Pre-state vs post-state assertions for changed logic.
- No unintended side effects on unrelated state.
- Correct event/log emission only when expected.
- Transactional integrity (all-or-nothing where required).

## Time, Concurrency, and Ordering
- Time-sensitive logic with fixed clock/test doubles.
- Timeout and deadline behavior.
- Concurrent access/race-sensitive scenarios.
- Re-entrancy safety when method is called in parallel.
- Event/order guarantees under concurrent or async execution.

## Data and Compatibility
- Backward compatibility for persisted data and old payload versions.
- Forward-compatible handling of unknown fields.
- Serialization/deserialization round-trip consistency.
- Precision/rounding cases for numeric logic.
- Unicode/locale-sensitive inputs where relevant.

## Security and Trust Boundaries
- Authorization/permission-denied behavior.
- Input sanitization/escaping expectations.
- No sensitive data leakage in errors/logs.
- Safe handling of untrusted external input.

## Integration and Contract Checks
- Upstream/downstream interface contract alignment.
- Mocked dependency behavior matches real contract (status, shape, latency).
- Cross-module boundary behavior where logic moved modules.
- Feature flag on/off behavior for changed paths.

## API-Specific Cases (HTTP/gRPC/GraphQL where applicable)
- Header handling:
- Required headers present vs missing (`Authorization`, `Content-Type`, `Accept`, idempotency keys, trace/correlation IDs).
- Header case-insensitivity and duplicate header behavior.
- Invalid/expired auth token and permission-scope mismatch.
- Params handling:
- Path param format/type validation (UUID/int/slug), missing/invalid path params.
- Query param defaults, optional vs required params, repeated params, unknown params.
- Boundary checks for pagination/filter/sort params (`limit`, `offset`, `page`, `sort`).
- Body handling:
- Valid minimal body vs full body payload.
- Missing required fields, null vs omitted fields, empty body behavior.
- Field type mismatch, nested object validation, enum/domain validation.
- Large payload limits and truncated/malformed JSON behavior.
- Protocol/contract behavior:
- `Content-Type` and `Accept` negotiation, unsupported media type handling.
- Correct status codes/error schema for 2xx/4xx/5xx paths.
- Response schema stability (required fields, backward compatibility).
- Partial update semantics (`PATCH`) and idempotency for `PUT`/`DELETE`.
- API reliability:
- Timeout/cancellation propagation from client to handler.
- Rate limit/throttling responses and retry headers where applicable.
- ETag/If-Match or version-conflict handling for concurrent updates.

## Flakiness Guardrails
- Remove sleeps and timing-dependent assertions.
- Use deterministic seeds and fixed clocks.
- Isolate filesystem/network dependencies unless intentionally tested.
- Keep tests independent and order-agnostic.

## Regression Guard
- Add at least one focused regression test per fixed bug/change.
- Verify old behavior fails under new test when feasible.
- Verify rewritten tests fail if key new logic is reverted.

## Final Gate
- Module-native test command(s) pass.
- Rewritten tests clearly express current expected behavior.
- No failing test remains that depends on legacy logic.
- Each intentional behavior change has direct positive and negative assertions.

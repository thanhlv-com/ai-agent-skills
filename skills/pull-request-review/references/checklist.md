# Pull Request Review Checklist

## Inputs
- Ask the user to provide base branch (`main`, `dev`, or any branch used as PR target).
- Set PR branch as current checked-out branch (`git rev-parse --abbrev-ref HEAD`).
- Confirm repository state is up to date (`git fetch --all --prune` if needed).

## Diff Baseline
- List changed files: `git diff --name-status <base-branch>...<pr-branch>`.
- Review commits: `git log --oneline --left-right <base-branch>...<pr-branch>`.
- Review patch content: `git diff <base-branch>...<pr-branch>`.

## Risk Review
- Correctness: logic, edge cases, state transitions.
- Reliability: retries, timeout handling, error propagation.
- Security: auth/authz, input validation, secret exposure.
- Compatibility: API/schema/public contract breakage.
- Performance: expensive loops/queries, unnecessary network or I/O.

## Quality Gates
- Tests cover changed behavior or clear reason why not.
- Docs/changelog updated when behavior or API changes.
- No dead code or debug artifacts left in patch.

## Findings Format
- Severity: `critical` | `high` | `medium` | `low`.
- Structure each finding as:
  - `Issue`: what is wrong.
  - `Impact`: why it matters.
  - `Evidence`: file path + line reference.
  - `Fix`: minimal remediation direction.

## Final Decision
- `Request changes` when any blocking issue exists.
- `Approve with notes` when only non-blocking improvements remain.
- `Approve` when no findings and risk is acceptable.

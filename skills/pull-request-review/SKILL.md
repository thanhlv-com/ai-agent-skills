---
name: pull-request-review
description: Review pull requests by comparing the current PR branch against a user-provided base branch, identifying correctness and regression risks, validating tests/docs coverage, and producing an actionable findings report with severity and file references. Use when the user asks to review a PR, compare a base branch with the current branch, or request approve/request-changes recommendation.
---

# Pull Request Review

Review the pull request using a risk-first process based on `<base-branch>...<pr-branch>` diff.

## Workflow
1. Define review scope:
- Ask the user to provide base branch name (`main`, `dev`, or any other branch).
- Set PR branch to current checked-out branch (`git rev-parse --abbrev-ref HEAD`).
- Confirm local checkout has both branches/refs available.

2. Build comparison baseline:
- Run `git fetch --all --prune` when refs are stale.
- Use three-dot diff (`<base-branch>...<pr-branch>`) to review only PR-introduced changes.
- Enumerate impacted files with `git diff --name-status <base-branch>...<pr-branch>`.

3. Review high-risk areas first:
- Verify behavior changes against expected outcomes.
- Check data integrity, auth/authz, input validation, and error handling paths.
- Check backward compatibility for APIs/contracts/public interfaces.
- Check test additions/updates for changed behavior.
- Check docs/changelog updates when user-visible behavior changes.

4. Validate findings:
- Reproduce suspicious paths with targeted commands/tests when possible.
- Avoid speculative comments without evidence.
- Mark confidence and impact clearly.

5. Report review result:
- List findings ordered by severity: `critical`, `high`, `medium`, `low`.
- Include exact file references and concise remediation guidance.
- If no findings: explicitly state no blocking issues found and residual risks/testing gaps.

## Command Set
- Current branch (PR branch): `git rev-parse --abbrev-ref HEAD`
- File delta: `git diff --name-status <base-branch>...<pr-branch>`
- Patch review: `git diff <base-branch>...<pr-branch>`
- Commit summary: `git log --oneline --left-right <base-branch>...<pr-branch>`
- Focused file review: `git diff <base-branch>...<pr-branch> -- <path>`

## Review Rules
- Prioritize correctness and regression risk over style preferences.
- Do not block on optional refactors unrelated to the PR objective.
- Keep feedback actionable: state issue, impact, and concrete fix direction.
- Keep output concise, structured, and directly tied to changed lines.

## Reference
Use checklist: `references/checklist.md`.

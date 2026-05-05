# Pull Request Rationale Checklist

## Inputs
- Set source branch as current branch with `git rev-parse --abbrev-ref HEAD`.
- Ask user to enter target branch (`main`, `dev`, or any branch).
- Confirm target branch exists and scope of change is correct.
- Capture key problem statement and impacted users/systems.
- Capture major constraints (timeline, compatibility, infra, policy).

## Title Quality
- Outcome-focused and specific.
- Includes scope or affected area where useful.
- Avoids vague terms (`update`, `fix`, `misc`).

## Description Completeness
- Includes a `Branches` section with source and target branch.
- Includes `Context`, `Problem`, and `Root Cause`.
- Explains `Change` in concrete, reviewable bullets.
- Explains `Why This Approach` with tradeoffs and rejected alternatives.
- Documents `Impact` across user/API/performance/security dimensions.
- Includes `Validation` with exact commands/checks/manual scenarios.
- Includes `Risk / Rollback` with detection signal and mitigation path.

## Evidence Integrity
- Every key claim maps to code or verification results.
- No unverified test claim.
- File paths and technical terms are accurate and consistent.

## Final Gate
- Title and body match final diff and commit set.
- Deferred work is explicitly called out with owner/follow-up.
- Description is clear enough for reviewer to decide with minimal follow-up.

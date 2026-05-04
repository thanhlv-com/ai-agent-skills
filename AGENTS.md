# Repository Guidelines

## Project Structure & Module Organization
This repository stores reusable Codex skills.
- `skills/<skill-name>/SKILL.md`: canonical skill instructions.
- `skills/<skill-name>/agents/openai.yaml`: agent configuration per skill.
- `skills/<skill-name>/references/`: focused checklists or supporting docs.
- `scripts/sync-skills.sh`: links project skills into `~/.codex/skills` for local use.

Keep each skill self-contained in its own directory. Add new skills under `skills/` using a kebab-case folder name (example: `skills/release-notes-sync`).

## Build, Test, and Development Commands
There is no compile/build pipeline in this repo; use lightweight validation.
- `bash scripts/sync-skills.sh`: creates/refreshes symlinks to local Codex skills.
- `bash -n scripts/sync-skills.sh`: syntax-check the Bash script.
- `rg --files skills`: verify expected skill files are present.
- `git status --short`: confirm only intended files changed before commit.

## Coding Style & Naming Conventions
- Markdown: concise, imperative instructions; short sections with `##` headings.
- Bash: start scripts with `#!/usr/bin/env bash` and `set -euo pipefail`.
- Indentation: 2 spaces for Markdown lists, 2 spaces or 4 spaces in shell blocks; keep style consistent within a file.
- Naming:
  - Skill directories: kebab-case.
  - Primary skill doc: always `SKILL.md` (uppercase).
  - Reference docs: kebab-case filenames (example: `sync-checklist.md`).

## Testing Guidelines
No dedicated unit-test framework is currently configured. Validate by:
- Running `bash -n` on any changed script.
- Running `bash scripts/sync-skills.sh` and checking reported linked skill count.
- Reviewing changed Markdown for broken paths and command accuracy.

## Commit & Pull Request Guidelines
Current history uses very short commit subjects (for example, `a`). Prefer clearer, imperative summaries such as `add code-review skill checklist`.

For pull requests:
- State what changed and why.
- List impacted paths (example: `skills/code-doc-sync/SKILL.md`).
- Include manual validation steps and outcomes.
- Link related issues/tasks when available.

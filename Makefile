.PHONY: sync-skills sync-skills-check

sync-skills:
	bash scripts/sync-skills.sh

sync-skills-check:
	bash -n scripts/sync-skills.sh

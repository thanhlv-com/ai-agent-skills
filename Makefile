.PHONY: sync-config sync-config-check sync-skills sync-skills-check

sync-config:
	bash scripts/sync-config.sh

sync-config-check:
	bash -n scripts/sync-config.sh

sync-skills:
	bash scripts/sync-skills.sh

sync-skills-check:
	bash -n scripts/sync-skills.sh

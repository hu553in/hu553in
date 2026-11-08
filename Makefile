.DEFAULT_GOAL := check

PREK ?= prek
ACTIONLINT := bunx github-actionlint

.PHONY: lint
lint:
	bun fmt --check

.PHONY: lint-fix
lint-fix:
	bun fmt

.PHONY: check-config
check-config:
	$(PREK) validate-config prek.toml

.PHONY: check-renovate
check-renovate:
	bunx --package renovate renovate-config-validator --strict --no-global renovate.json

.PHONY: check-workflows
check-workflows:
	$(ACTIONLINT)

.PHONY: check
check: lint check-config check-renovate check-workflows

.PHONY: check-fix
check-fix: lint-fix
	$(MAKE) check

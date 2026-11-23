.DEFAULT_GOAL := check

PREK ?= prek
ACTIONLINT := bunx --minimum-release-age 259200 github-actionlint

.PHONY: lint
lint:
	bun fmt --check

.PHONY: lint-fix
lint-fix:
	bun fmt

.PHONY: check-config
check-config:
	$(PREK) validate-config prek.toml

.PHONY: check-workflows
check-workflows:
	$(ACTIONLINT)

.PHONY: check
check: lint check-config check-workflows

.PHONY: check-fix
check-fix: lint-fix
	$(MAKE) check

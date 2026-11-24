.DEFAULT_GOAL := check

ACTIONLINT := bunx --minimum-release-age 259200 github-actionlint

.PHONY: lint
lint:
	bun fmt --check

.PHONY: lint-fix
lint-fix:
	bun fmt

.PHONY: check-hooks
check-hooks:
	bunx --minimum-release-age 259200 lefthook validate

.PHONY: check-workflows
check-workflows:
	$(ACTIONLINT)

.PHONY: check
check: lint check-hooks check-workflows

.PHONY: check-fix
check-fix: lint-fix
	$(MAKE) check

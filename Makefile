.DEFAULT_GOAL := check

PRETTIER := bunx prettier -u
ACTIONLINT := bunx github-actionlint

.PHONY: lint
lint:
	$(PRETTIER) -c .

.PHONY: lint-fix
lint-fix:
	$(PRETTIER) -w .

.PHONY: check-workflows
check-workflows:
	$(ACTIONLINT)

.PHONY: check
check: lint check-workflows

.PHONY: check-fix
check-fix: lint-fix
	$(MAKE) check

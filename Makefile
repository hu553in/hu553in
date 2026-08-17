.DEFAULT_GOAL := check

PRETTIER := bunx prettier -u
ACTIONLINT := bunx github-actionlint

.PHONY: lint
lint:
	$(PRETTIER) -c .

.PHONY: lint-fix
lint-fix:
	$(PRETTIER) -w .

.PHONY: check-config
check-config:
	git config --file .gitconfig --list >/dev/null

.PHONY: check-workflows
check-workflows:
	$(ACTIONLINT)

.PHONY: check-renovate
check-renovate:
	bunx --package renovate renovate-config-validator --strict --no-global renovate.json

.PHONY: check
check: lint check-config check-renovate check-workflows

.PHONY: check-fix
check-fix: lint-fix
	$(MAKE) check

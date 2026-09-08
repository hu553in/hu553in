# Development

Bun and Git 2.54 or newer are required. After cloning, enable the tracked project-check and
Commitlint hooks once:

```bash
git config --local include.path ../.gitconfig
```

Run `make check` to validate formatting, the Renovate configuration, and GitHub Actions workflows.
Use `make lint-fix` to apply formatting fixes or `make check-fix` to format and rerun the full gate.

## Generated profile assets

The CI workflow generates assets after checks pass on pushes to `main`, the daily schedule, and
manual runs. Pull requests only run checks. Local `make check` does not generate or publish assets.

- The contribution animation is published to `snake-output` using `GITHUB_TOKEN`.
- The ASCII card is published to `ascii-profile-card-output` using the `ASCII_PROFILE_CARD_PAT`
  repository secret. Its content and action inputs live in `.github/workflows/ci.yml`.

The image URLs in `README.md` must match those output branches and filenames.

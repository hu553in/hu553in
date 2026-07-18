# Development

Bun and Git 2.54 or newer are required. After cloning, enable the tracked project-check and
Commitlint hooks once:

```bash
git config --local include.path ../.gitconfig
```

Run `make check` to validate formatting and GitHub Actions workflows.

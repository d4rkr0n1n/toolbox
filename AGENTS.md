# Agent instructions

## Repository overview

This repository contains standalone utilities:

- `pwsh/ChocoUpgrade.ps1` elevates PowerShell and upgrades all Chocolatey packages.
- `pwsh/ChocoSearch.ps1` interactively searches Chocolatey packages.
- `test.sh` checks extraction of the major version from a `v<major>.<minor>.<patch>` string.
- `.github/workflows/Release.yml` creates releases for pushes to `dev` and `main`.

Keep the utilities independent and preserve their existing paths and interactive behavior.

## Validation

There is no formal build, package manager, or lint configuration. Run the repository check with:

```sh
bash test.sh
```

`test.sh` is the only check and has no test selector. It requires a POSIX shell and `awk`.

## Release conventions

Preserve the `v<major>.<minor>.<patch>` tag format and branch-specific versioning in `.github/workflows/Release.yml`: `dev` retains the latest major version, while `main` increments it. Both branches derive the remaining version digits from `github.run_number` and create non-draft, non-prerelease releases.

# Copilot instructions

## Repository overview

This repository is a small collection of standalone system utilities rather than a packaged application:

- `pwsh/ChocoUpgrade.ps1` launches an elevated PowerShell process and upgrades all Chocolatey packages.
- `pwsh/ChocoSearch.ps1` prompts for a package name and searches Chocolatey.
- `test.sh` is a minimal shell check for extracting the major version component from a `v<major>.<minor>.<patch>` string.
- `.github/workflows/Release.yml` creates GitHub releases on pushes to `dev` and `main`.

Keep utilities independent; do not introduce shared runtime infrastructure or dependencies unless the change clearly requires it.

## Build, test, and lint

There is no formal build, package manager, or lint configuration. The repository's only validation script is:

```sh
bash test.sh
```

This is also the single-test invocation because `test.sh` contains the only check and does not accept a test selector. It requires a POSIX shell and `awk`.

For release behavior, inspect `.github/workflows/Release.yml`. The workflow runs on Ubuntu and uses Bash, `git`, `awk`, and `expr`; PowerShell scripts are intended to run on Windows with Chocolatey and elevation available.

## Architecture and release flow

The PowerShell scripts are interactive entry points with no module or application layer. `ChocoUpgrade.ps1` defines the upgrade function inside the command passed to an elevated `pwsh.exe` process, while `ChocoSearch.ps1` runs Chocolatey directly in the current process.

Release versioning is branch-dependent. On `dev`, the workflow keeps the major version from the latest tag and derives the two minor/patch digits from `github.run_number`. On `main`, it increments the latest tag's major version and derives the minor/patch digits from the same run number. Each branch then creates a non-draft, non-prerelease GitHub release using the generated `v<major>.<minor>.<patch>` tag.

## Repository-specific conventions

- Keep script filenames and the `pwsh/` location stable; these files are direct user-facing utilities.
- Preserve the existing `v<major>.<minor>.<patch>` tag format and the branch-specific release rules when changing version logic.
- Shell snippets in the workflow assume GNU/POSIX tooling on `ubuntu-latest`; validate changes against that environment rather than PowerShell syntax.
- Interactive scripts explicitly prompt before exiting where appropriate; preserve that behavior when modifying their user flow.

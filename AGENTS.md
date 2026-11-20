# Agent instructions

## Repository overview

This repository contains standalone utilities:

- `pwsh/toolbox.ps1` launches the interactive toolbox menu for Chocolatey and Windows utilities.
- `pwsh/choco/ChocoUpgrade.ps1` elevates PowerShell and upgrades all Chocolatey packages.
- `pwsh/choco/ChocoSearch.ps1` interactively searches Chocolatey packages.
- `pwsh/choco/InstallPackages.ps1` installs the packages listed in `pwsh/choco/packages.txt` and skips packages already installed.
- `test.sh` checks extraction of the major version from a `v<major>.<minor>.<patch>` string.
- `.github/workflows/Release.yml` creates releases for pushes to `dev` and `main`.

Keep the utilities independent and preserve their existing paths and interactive behavior.

To use the toolbox in a PowerShell session, add its directory to `PATH` and run
the menu:

```powershell
$env:Path += ";E:\Playground\Projects\toolbox\pwsh"
toolbox.ps1
```

The PATH change applies only to the current session.

## KISS

Keep scripts simple: prefer direct commands and pipelines over abstractions,
while retaining only validation that produces a useful error.
See `.github/skills/kiss/SKILL.md` for the reusable KISS skill.

After accepted code changes, review relevant documentation and update affected
commands, paths, behavior, and usage examples. See
`.github/skills/auto-update-docs/SKILL.md`.

Use `.github/skills/ui-ux/SKILL.md` when changing interactive terminal scripts.

## Validation

There is no formal build, package manager, or lint configuration. Run the repository check with:

```sh
bash test.sh
```

`test.sh` is the only check and has no test selector. It requires a POSIX shell and `awk`.

## Release conventions

Preserve the `v<major>.<minor>.<patch>` tag format and branch-specific versioning in `.github/workflows/Release.yml`: `dev` retains the latest major version, while `main` increments it. Both branches derive the remaining version digits from `github.run_number` and create non-draft, non-prerelease releases.

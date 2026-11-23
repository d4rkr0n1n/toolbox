# toolbox

## Use the toolbox in PowerShell

Add the `pwsh` directory to `PATH` for the current PowerShell session, then run
the toolbox menu:

```powershell
$env:Path += ";E:\Playground\Projects\toolbox\pwsh"
toolbox.ps1
```

This PATH change applies only to the current session.

## Python system information

Run the Python utility to display the computer name, operating system, version,
architecture, and Python version:

```powershell
python .\python\toolbox.py
```

## Windows system description

Display the computer name, manufacturer, model, and Windows version details
from the toolbox menu using option `7` or the `description` command:

```powershell
.\pwsh\win\Description.ps1
```

## Chocolatey setup

The package manifest is stored in `pwsh/choco/packages.txt` using one package
name per line. Run the installer from an elevated PowerShell session:

```powershell
.\pwsh\choco\InstallPackages.ps1
```

To use a different manifest:

```powershell
.\pwsh\choco\InstallPackages.ps1 -ManifestPath .\path\to\packages.txt
```

Already installed packages are skipped.
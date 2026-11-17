# toolbox

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
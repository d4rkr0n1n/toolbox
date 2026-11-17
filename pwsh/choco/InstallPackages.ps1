param(
  [string]$ManifestPath = (Join-Path $PSScriptRoot ".\packages.txt")
)

Write-Host ""
Write-Host "========================================" -ForegroundColor DarkCyan
Write-Host "       📦 Chocolatey Package Installer" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor DarkCyan
Write-Host ""

if (-not (Test-Path $ManifestPath)) {
  throw "Package manifest not found: $ManifestPath"
}

Write-Host "🔎 Installing packages from '$ManifestPath'..." -ForegroundColor DarkGray
Write-Host ""

Get-Content $ManifestPath | ForEach-Object {
  $package = $_.Trim()
  if (-not $package -or $package.StartsWith("#")) {
    return
  }

  $installed = & choco list --local-only --exact --limit-output $package
  if ($LASTEXITCODE -ne 0) {
    throw "Failed to check whether $package is installed."
  }

  if ($installed) {
    Write-Host "✅ $package is already installed. Skipping." -ForegroundColor DarkYellow
    return
  }

  Write-Host "📥 Installing $package..." -ForegroundColor Yellow
  & choco install $package -y --no-progress
  if ($LASTEXITCODE -ne 0) {
    throw "Failed to install $package."
  }
}

Write-Host ""
Write-Host "✅ Package installation complete." -ForegroundColor Green

param(
  [string]$ManifestPath = (Join-Path $PSScriptRoot ".\packages.txt")
)

if (-not (Test-Path $ManifestPath)) {
  throw "Package manifest not found: $ManifestPath"
}

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
    Write-Host "$package is already installed. Skipping."
    return
  }

  Write-Host "Installing $package..."
  & choco install $package -y --no-progress
  if ($LASTEXITCODE -ne 0) {
    throw "Failed to install $package."
  }
}

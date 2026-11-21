param(
  [string]$Command
)

$scriptRoot = $PSScriptRoot

function Show-Menu {
  Write-Host ""
  Write-Host "╔════════════════════════════════════════╗" -ForegroundColor Cyan
  Write-Host "║          🧰 TOOLBOX CLI 🧰             ║" -ForegroundColor Cyan
  Write-Host "╚════════════════════════════════════════╝" -ForegroundColor Cyan
  Write-Host ""
  Write-Host "Chocolatey Utilities:" -ForegroundColor Yellow
  Write-Host "  1. 🔄 upgrade    - Upgrade all Chocolatey packages" -ForegroundColor Green
  Write-Host "  2. 🔍 search     - Search Chocolatey packages" -ForegroundColor Green
  Write-Host "  3. 📦 install    - Install packages from packages.txt" -ForegroundColor Green
  Write-Host ""
  Write-Host "System Utilities:" -ForegroundColor Yellow
  Write-Host "  4. 📢 echo       - Echo hello" -ForegroundColor Green
  Write-Host "  5. 🛑 shutdown   - Shutdown system" -ForegroundColor DarkRed
  Write-Host "  6. 🔄 restart    - Restart system" -ForegroundColor DarkRed
  Write-Host "  7. 🖥️ description - Show system description" -ForegroundColor Green
  Write-Host ""
  Write-Host "  0. ❌ exit       - Exit toolbox" -ForegroundColor Gray
  Write-Host ""
}

function Execute-Command {
  param([string]$Command)
  
  switch ($Command.ToLower()) {
    { @("1", "upgrade") -contains $_ } {
      & "$scriptRoot\choco\ChocoUpgrade.ps1"
    }
    { @("2", "search") -contains $_ } {
      & "$scriptRoot\choco\ChocoSearch.ps1"
    }
    { @("3", "install") -contains $_ } {
      & "$scriptRoot\choco\InstallPackages.ps1"
    }
    { @("4", "echo") -contains $_ } {
      & "$scriptRoot\win\Echo.ps1"
    }
    { @("5", "shutdown") -contains $_ } {
      & "$scriptRoot\win\Shutdown.ps1"
    }
    { @("6", "restart") -contains $_ } {
      & "$scriptRoot\win\Restart.ps1"
    }
    { @("7", "description") -contains $_ } {
      & "$scriptRoot\win\Description.ps1"
    }
    { @("0", "exit", "quit") -contains $_ } {
      Write-Host "👋 Exiting toolbox..." -ForegroundColor Cyan
      exit 0
    }
    default {
      Write-Host "❌ Invalid command: '$Command'" -ForegroundColor Red
    }
  }
}

if ($Command) {
  Execute-Command $Command
} else {
  while ($true) {
    Show-Menu
    $input = Read-Host "Enter command (0-7 or name)"
    Execute-Command $input
    Write-Host ""
  }
}

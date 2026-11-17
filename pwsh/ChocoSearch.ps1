Write-Host ""
Write-Host "========================================" -ForegroundColor DarkCyan
Write-Host "        Chocolatey Package Search" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor DarkCyan
Write-Host ""
Write-Host "Enter package name: " -ForegroundColor Yellow -NoNewline
$pacName = Read-Host
Write-Host ""
Write-Host "Searching Chocolatey for '$pacName'..." -ForegroundColor DarkGray
Write-Host ""
choco search $pacName
Write-Host ""
Write-Host "Press Enter to exit" -ForegroundColor Green -NoNewline
Read-Host
Write-Host "Enter package name: " -NoNewline
$pacName = Read-Host
choco search $pacName
Write-Host "Press Enter to Exit 👍 " -NoNewline
Read-Host
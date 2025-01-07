$functionDefinition = {
  function MyFunction {
    Write-Host "Running choco upgrade -y all"
    choco upgrade -y all
    Write-Host "Press Enter to Exit 👍 " -NoNewline
    Read-Host
  }
}

Start-Process pwsh.exe -Verb RunAs -ArgumentList "-NoProfile", "-Command", "& {$functionDefinition; MyFunction}"
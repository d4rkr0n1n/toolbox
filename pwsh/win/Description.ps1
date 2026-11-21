Get-ComputerInfo |
  Select-Object CsName, CsManufacturer, CsModel, OsName, OsVersion, OsBuildNumber, OsArchitecture |
  Format-List
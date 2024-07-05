get-childitem "./" | % {
  Write-Output $_.FullName
}

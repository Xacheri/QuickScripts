get-childitem "./" -recurse | % {
  Write-Output $_.FullName
}

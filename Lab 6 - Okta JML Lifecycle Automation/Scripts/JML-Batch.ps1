# Lab 6 - JML Batch Runner
# Reads jml-batch.csv and executes Joiner/Mover/Leaver with validation

$CsvPath = "$PSScriptRoot\jml-batch.csv"

if (-not (Test-Path $CsvPath)) {
  Write-Error "CSV not found: $CsvPath"
  exit 1
}

# Validate CSV parsing before any AD changes
Write-Host "Validating CSV..." -ForegroundColor Cyan
$csv = Import-Csv $CsvPath
$csv | Format-Table Action,SamAccountName,Group,Email -AutoSize

# Basic validation
foreach ($row in $csv) {
  if ([string]::IsNullOrWhiteSpace($row.SamAccountName) -or [string]::IsNullOrWhiteSpace($row.Action)) {
    Write-Error "Invalid row: Action or SamAccountName empty -> $($row | Out-String)"
    exit 1
  }
  if ($row.SamAccountName -match "\s") {
    Write-Error "Invalid SamAccountName with space: $($row.SamAccountName)"
    exit 1
  }
}

Write-Host "CSV validation passed - Executing..." -ForegroundColor Green

foreach ($item in $csv) {
  switch ($item.Action) {
    "Joiner" {
      .\Joiner.ps1 -SamAccountName $item.SamAccountName -FirstName $item.FirstName -LastName $item.LastName -Department $item.Department -Title $item.Title -Group $item.Group -Email $item.Email
    }
    "Mover" {
      .\Mover.ps1 -SamAccountName $item.SamAccountName -NewGroup $item.Group -NewDepartment $item.Department -NewTitle $item.Title
    }
    "Leaver" {
      .\Leaver.ps1 -SamAccountName $item.SamAccountName
    }
    default {
      Write-Warning "Unknown Action $($item.Action) for $($item.SamAccountName)"
    }
  }
}

# Final verification
Write-Host "`n=== Final State ===" -ForegroundColor Cyan
Get-ADUser -Filter * -SearchBase "OU=_Users,DC=allenlab,DC=local" | Format-Table SamAccountName,Enabled,Department
Get-ADUser -Filter * -SearchBase "OU=_DisabledUsers,DC=allenlab,DC=local" | Format-Table SamAccountName,Enabled
Write-Host "Run Full Import in Okta: Directory -> AD -> Import -> Full Import -> Confirm Unassigned" -ForegroundColor Yellow

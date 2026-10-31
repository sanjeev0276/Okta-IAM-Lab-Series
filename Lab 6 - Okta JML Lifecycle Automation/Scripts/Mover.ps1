# Lab 6 - Mover Role Change Script
# Moves user from old group to new group and updates Dept/Title

param(
  [Parameter(Mandatory=$true)][string]$SamAccountName,
  [Parameter(Mandatory=$true)][string]$NewGroup,
  [Parameter(Mandatory=$true)][string]$NewDepartment,
  [Parameter(Mandatory=$true)][string]$NewTitle
)

try {
  Write-Host "Mover $SamAccountName -> $NewGroup ..." -ForegroundColor Cyan
  $oldGroups = Get-ADUser $SamAccountName -Properties MemberOf | Select-Object -ExpandProperty MemberOf
  foreach ($g in $oldGroups) {
    # Skip primary Domain Users, remove others
    if ($g -notlike "*Domain Users*") {
      Remove-ADGroupMember -Identity $g -Members $SamAccountName -Confirm:$false -ErrorAction SilentlyContinue
    }
  }
  Add-ADGroupMember -Identity $NewGroup -Members $SamAccountName -ErrorAction Stop
  Set-ADUser -Identity $SamAccountName -Department $NewDepartment -Title $NewTitle -ErrorAction Stop
  Write-Host "Mover $SamAccountName -> $NewGroup Dept:$NewDepartment Title:$NewTitle SUCCESS" -ForegroundColor Green
  Get-ADUser $SamAccountName -Properties MemberOf,Department,Title | Format-List SamAccountName,Department,Title,MemberOf
}
catch {
  Write-Error "Mover failed: $_"
}

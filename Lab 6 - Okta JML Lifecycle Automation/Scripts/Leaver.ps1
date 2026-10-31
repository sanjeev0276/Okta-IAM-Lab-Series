# Lab 6 - Leaver Offboarding Script
# Disables account, moves to _DisabledUsers, strips groups

param(
  [Parameter(Mandatory=$true)][string]$SamAccountName
)

$DisabledOU = "OU=_DisabledUsers,DC=allenlab,DC=local"

try {
  Write-Host "Leaver $SamAccountName - Disabling..." -ForegroundColor Yellow
  Disable-ADAccount -Identity $SamAccountName -ErrorAction Stop
  
  $dn = (Get-ADUser $SamAccountName).DistinguishedName
  Move-ADObject -Identity $dn -TargetPath $DisabledOU -ErrorAction Stop
  Write-Host "Moved to $DisabledOU" -ForegroundColor Cyan

  # Strip all group memberships
  $oldGroups = Get-ADUser $SamAccountName -Properties MemberOf | Select-Object -ExpandProperty MemberOf
  foreach ($g in $oldGroups) {
    Remove-ADGroupMember -Identity $g -Members $SamAccountName -Confirm:$false -ErrorAction SilentlyContinue
  }
  Write-Host "Leaver $SamAccountName Disabled + Stripped SUCCESS" -ForegroundColor Green
  Get-ADUser $SamAccountName -Properties MemberOf,Enabled,DistinguishedName | Format-List SamAccountName,Enabled,DistinguishedName,MemberOf
}
catch {
  Write-Error "Leaver failed: $_"
}

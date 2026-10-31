# Lab 6 - Joiner Onboarding Script
# Domain: allenlab.local (lab)
# OU: OU=_Users,DC=allenlab,DC=local
# Pattern: sAMAccountName no-dot, lower case

param(
  [Parameter(Mandatory=$true)][string]$SamAccountName,
  [Parameter(Mandatory=$true)][string]$FirstName,
  [Parameter(Mandatory=$true)][string]$LastName,
  [Parameter(Mandatory=$true)][string]$Department,
  [Parameter(Mandatory=$true)][string]$Title,
  [Parameter(Mandatory=$true)][string]$Group,
  [Parameter(Mandatory=$true)][string]$Email
)

# Secure password prompt - never hardcode in prod
$SecurePass = Read-Host "Enter initial password" -AsSecureString

try {
  Write-Host "Creating user $SamAccountName..." -ForegroundColor Cyan
  New-ADUser -Name "$FirstName $LastName" `
    -GivenName $FirstName -Surname $LastName `
    -SamAccountName $SamAccountName `
    -UserPrincipalName "$SamAccountName@allenlab.local" `
    -Path "OU=_Users,DC=allenlab,DC=local" `
    -Department $Department -Title $Title `
    -Enabled $true `
    -AccountPassword $SecurePass `
    -ChangePasswordAtLogon $false `
    -EmailAddress $Email `
    -DisplayName "$FirstName $LastName" `
    -ErrorAction Stop

  Add-ADGroupMember -Identity $Group -Members $SamAccountName -ErrorAction Stop
  Write-Host "Joiner $SamAccountName -> $Group SUCCESS" -ForegroundColor Green
  Get-ADUser $SamAccountName -Properties MemberOf, Department, Enabled | Format-List SamAccountName,Enabled,Department,MemberOf
}
catch {
  Write-Error "Joiner failed: $_"
}

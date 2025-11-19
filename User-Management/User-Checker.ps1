# User-Checker.ps1
# Checks if specific users exist and their status

param(
    [string]$UsernameToCheck
)

if (-not $UsernameToCheck) {
    $UsernameToCheck = Read-Host "Enter username to check"
}

try {
    $user = Get-LocalUser -Name $UsernameToCheck -ErrorAction Stop
    
    Write-Host "`nUser Account Details:" -ForegroundColor Cyan
    Write-Host "Username: $($user.Name)"
    Write-Host "Enabled: $($user.Enabled)"
    Write-Host "Last Logon: $($user.LastLogon)"
    Write-Host "SID: $($user.SID)"
    
    if ($user.Enabled) {
        Write-Host "Status: ACTIVE" -ForegroundColor Green
    }
    else {
        Write-Host "Status: DISABLED" -ForegroundColor Red
    }
}
catch {
    Write-Host "User '$UsernameToCheck' not found on this system." -ForegroundColor Yellow
}
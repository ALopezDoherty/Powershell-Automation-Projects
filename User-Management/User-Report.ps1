# User-Report.ps1
# Generates a comprehensive report of local users

# Get all local users
$localUsers = Get-LocalUser

# Create report header
$report = @"
LOCAL USER ACCOUNT REPORT
Generated on: $(Get-Date)
Computer: $env:COMPUTERNAME
=====================================

"@

# Process each user
foreach ($user in $localUsers) {
    $userInfo = @"
Username: $($user.Name)
Enabled: $($user.Enabled)
Last Logon: $($user.LastLogon)
Account Created: $(($user | Get-LocalUser).Description)
SID: $($user.SID)
-------------------------------------

"@
    $report += $userInfo
}

# Export to file and display
$reportPath = "LocalUserReport_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
$report | Out-File -FilePath $reportPath -Encoding UTF8

Write-Host "Report generated: $reportPath" -ForegroundColor Green
Write-Host $report
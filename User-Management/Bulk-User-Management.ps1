# Bulk-User-Management.ps1
# Creates multiple users from CSV file

# Create sample CSV if it doesn't exist
$sampleCSV = @"
Username,FullName,Description,Password
testuser1,Test User One,Development Account,Passw0rd!
testuser2,Test User Two,Testing Account,Passw0rd!
"@

$sampleCSV | Out-File -FilePath "users-to-create.csv" -Encoding UTF8

Write-Host "Sample CSV created. Edit 'users-to-create.csv' and run this script again." -ForegroundColor Yellow
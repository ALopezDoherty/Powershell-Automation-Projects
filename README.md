# Local User Management Scripts

A collection of PowerShell scripts for managing and reporting on local user accounts in Windows environments.

## Scripts Overview

### 1. Bulk-User-Management.ps1

**Purpose**: Creates multiple local user accounts from a CSV file.

**Features**:

- Automatically generates a sample CSV template if one doesn't exist
- Bulk creates user accounts with specified attributes
- Simple CSV format for easy user management

**Usage**:

```powershell
.\Bulk-User-Management.ps1
```

**CSV Format**:

```csv
Username,FullName,Description,Password
testuser1,Test User One,Development Account,Passw0rd!
testuser2,Test User Two,Testing Account,Passw0rd!
```

### 2. User-Checker.ps1

**Purpose**: Checks the status and details of specific local user accounts.

**Features**:

- Interactive username prompt if no parameter provided
- Displays comprehensive user account information
- Shows account status (Active/Disabled)
- Handles non-existent users gracefully

**Usage**:

```powershell
# Interactive mode
.\User-Checker.ps1

# Direct check
.\User-Checker.ps1 -UsernameToCheck "targetusername"
```

**Output Includes**:

- Username
- Account enabled status
- Last logon time
- Security Identifier (SID)
- Account status indicator

### 3. User-Report.ps1

**Purpose**: Generates comprehensive reports of all local user accounts.

**Features**:

- Creates detailed reports with timestamp and computer name
- Automatically saves reports to text files
- Displays report in console and exports to file
- Includes all local users with key account information

**Usage**:

```powershell
.\User-Report.ps1
```

**Report Contents**:

- Report generation timestamp
- Computer name
- For each user:
  - Username
  - Enabled status
  - Last logon time
  - Account creation description
  - SID

## Requirements

- Windows PowerShell 5.1 or later
- Administrative privileges (for user creation)
- Execution policy allowing script execution

## Setup Instructions

1. **Enable Script Execution** (if required):

   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

2. **First-time Setup**:
   - Run `Bulk-User-Management.ps1` to generate the sample CSV template
   - Edit `users-to-create.csv` with your user data
   - Re-run the script to create users

## File Outputs

- `users-to-create.csv` - Template for bulk user creation (auto-generated)
- `LocalUserReport_YYYYMMDD_HHMMSS.txt` - Timestamped user reports

## Security Notes

- Passwords in CSV are stored in plain text - handle with care
- Administrative rights required for user creation operations
- Recommended to remove or secure CSV files after use
- Consider using secure strings for production environments

## Usage Examples

**Bulk User Creation**:

```powershell
.\Bulk-User-Management.ps1
```

**Check Specific User**:

```powershell
.\User-Checker.ps1 -UsernameToCheck "adminuser"
```

**Generate System Report**:

```powershell
.\User-Report.ps1
```

## Error Handling

- All scripts include basic error handling
- User-Checker gracefully handles non-existent users
- Bulk creation will stop on individual user creation failures
- Reports continue processing even if individual user data is unavailable

## Compatibility

- Tested on Windows 10/11 and Windows Server 2016+
- Requires PowerShell 5.1 or newer
- Local system operations only (not for domain users)

---

_Note: These scripts are designed for local user management and should be used in appropriate testing or administrative environments._

<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Wisdom Oke Eke
    LinkedIn        : linkedin.com/in/wisdom-oke-eke
    GitHub          : github.com/Wisemanwiz
    Date Created    : 2026-24-09
    Last Modified   : 2026-24-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-AU-000500).ps1 
#>

# YOUR CODE GOES HERE$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application'

# Create the registry key if it does not already exist
New-Item -Path $Path -Force | Out-Null

# Set MaxSize to 32768 (0x8000) as REG_DWORD
New-ItemProperty `
    -Path $Path `
    -Name 'MaxSize' `
    -PropertyType DWord `
    -Value 0x8000 `
    -Force | Out-Null

<#
.SYNOPSIS
    This PowerShell script ensures that the machine inactivity limit must be set to 15 minutes, locking the system with the screensaver.

.NOTES
    Author          : Wisdom Oke Eke
    LinkedIn        : linkedin.com/in/wisdom-oke-eke
    GitHub          : github.com/Wisemanwiz
    Date Created    : 2026-03-10
    Last Modified   : 2026-03-10
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000070
    Documentation   :https://stigaview.com/products/win11/v2r8/WN11-SO-000070/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID- WN11-SO-000070).ps1 
#>

$Path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
$Value = 900

# Create the registry key if it does not exist
New-Item -Path $Path -Force | Out-Null

# Set InactivityTimeoutSecs to REG_DWORD = 900
New-ItemProperty `
    -Path $Path `
    -Name 'InactivityTimeoutSecs' `
    -PropertyType DWord `
    -Value $Value `
    -Force | Out-Null

Write-Host "InactivityTimeoutSecs set to $Value seconds (15 minutes)." -ForegroundColor Green

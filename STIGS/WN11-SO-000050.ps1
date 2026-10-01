<#
.SYNOPSIS
    This PowerShell script ensures that the computer account password must not be prevented from being reset.

.NOTES
    Author          : Wisdom Oke Eke
    LinkedIn        : linkedin.com/in/wisdom-oke-eke
    GitHub          : github.com/Wisemanwiz
    Date Created    : 2026-30-09
    Last Modified   : 2026-30-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :WN11-SO-000050

    Documentation   :https://stigaview.com/products/win11/v2r8/WN11-SO-000050/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000050).ps1 
#>

$Path = 'HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters'

# Create the registry key if it does not exist
New-Item -Path $Path -Force | Out-Null

# Set DisablePasswordChange to REG_DWORD = 0
New-ItemProperty `
    -Path $Path `
    -Name 'DisablePasswordChange' `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

Write-Host 'Registry setting applied successfully.' -ForegroundColor Green

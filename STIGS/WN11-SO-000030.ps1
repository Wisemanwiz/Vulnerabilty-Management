<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Wisdom Oke Eke
    LinkedIn        : linkedin.com/in/wisdom-oke-eke
    GitHub          : github.com/Wisemanwiz
    Date Created    : 2026-27-09
    Last Modified   : 2026-27-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :WN11-SO-000030
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-SO-000030/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000030).ps1 
#>

$Path = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa'

# Create the registry key if it does not exist
New-Item -Path $Path -Force | Out-Null

# Set SCENoApplyLegacyAuditPolicy to REG_DWORD = 1
New-ItemProperty `
    -Path $Path `
    -Name 'SCENoApplyLegacyAuditPolicy' `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

Write-Host 'Registry setting applied successfully.' -ForegroundColor Green

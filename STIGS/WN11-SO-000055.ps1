<#
.SYNOPSIS
    This PowerShell script ensures that the maximum age for machine account must be configured to 30 days or less.NOTES
    Author          : Wisdom Oke Eke
    LinkedIn        : linkedin.com/in/wisdom-oke-eke
    GitHub          : github.com/Wisemanwiz
    Date Created    : 2026-01-10
    Last Modified   : 2026-01-10
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :WN11-SO-000055

    Documentation   :https://stigaview.com/products/win11/v2r8/WN11-SO-000055/
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000055).ps1 
#>

$Path = 'HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters'
$Value = 30

# Create the registry key if it does not exist
New-Item -Path $Path -Force | Out-Null

# Set MaximumPasswordAge to REG_DWORD = 30
New-ItemProperty `
    -Path $Path `
    -Name 'MaximumPasswordAge' `
    -PropertyType DWord `
    -Value $Value `
    -Force | Out-Null

Write-Host "MaximumPasswordAge set to $Value days." -ForegroundColor Green

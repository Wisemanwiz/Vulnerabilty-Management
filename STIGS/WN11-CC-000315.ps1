<#
.SYNOPSIS
    This PowerShell script ensures that the Windows Installer feature "Always install with elevated privileges" must be disabled.

.NOTES
    Author          : Wisdom Oke Eke
    LinkedIn        : linkedin.com/in/wisdom-oke-eke
    GitHub          : github.com/Wisemanwiz
    Date Created    : 2026-02-10
    Last Modified   : 2026-02-10
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :WN11-CC-000315

    Documentation   :https://stigaview.com/products/win11/v2r3/WN11-CC-000315/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000315).ps1 
#>


$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer'

# Create the registry key if it does not exist
New-Item -Path $Path -Force | Out-Null

# Set AlwaysInstallElevated to REG_DWORD = 0
New-ItemProperty `
    -Path $Path `
    -Name 'AlwaysInstallElevated' `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

Write-Host 'AlwaysInstallElevated set to 0.' -ForegroundColor Green

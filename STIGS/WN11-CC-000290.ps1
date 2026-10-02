    <#
.SYNOPSIS
    This PowerShell script ensures that remote desktop services must be configured with the client connection encryption set to the required level.

.NOTES
    Author          : Wisdom Oke Eke
    LinkedIn        : linkedin.com/in/wisdom-oke-eke
    GitHub          : github.com/Wisemanwiz
    Date Created    : 2026-26-09
    Last Modified   : 2026-26-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :WN11-CC-000290

    Documentation   :https://stigaview.com/products/win11/v2r3/WN11-CC-000290/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000290).ps1 
#>


$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'

# Create the registry key if it does not exist
New-Item -Path $Path -Force | Out-Null

# Set MinEncryptionLevel to REG_DWORD = 3
New-ItemProperty `
    -Path $Path `
    -Name 'MinEncryptionLevel' `
    -PropertyType DWord `
    -Value 3 `
    -Force | Out-Null

Write-Host 'Registry setting applied successfully.' -ForegroundColor Green

# Copyright (c) STC STORB. All rights reserved.
# Licensed under the MIT License.


<#
.Synopsis
    Visual Studio Cache Cleanup
.Description
    Clear the Visual Studio Cache.
#>
function Clear-VSCache
{
    $BaseDir = "$($HOME)\AppData\Local\Microsoft\VisualStudio"
    $NameToFind = "ComponentModelCache"

    $items = Get-ChildItem $BaseDir -Recurse | Where-Object { $_.PSIsContainer -and $_.Name.EndsWith($NameToFind)}

    foreach($item in $items) {
        Write-Host "$($item.FullName)\*.*"
        Remove-Item "$($item.FullName)\*.*"
    }
}

<#
.Synopsis
    Get my settings.
.Description
    Read a JSON configuration file as a PowerShell object.
#>
function Get-MySettings
{
	[CmdletBinding()]
	Param(
		[Parameter(Mandatory=$False, Position = 0)]
		[string] $FileName="mysettings.config"
    )
    $MySettingsFile = "$([Environment]::GetFolderPath("ApplicationData"))\$FileName"
    if(!(Test-Path -Path $MySettingsFile))
    {
        '{ "devVm01": { "computerName": "VM01" } }' | Out-File -FilePath $MySettingsFile -Force
    }
    $MySettings=Get-Content -Path $MySettingsFile | ConvertFrom-Json
    return $MySettings
}

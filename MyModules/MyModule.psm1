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

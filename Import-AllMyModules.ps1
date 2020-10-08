# Copyright (c) STC STORB. All rights reserved.
# Licensed under the MIT License.

$TargetDir = "$([Environment]::GetFolderPath("MyDocuments"))\WindowsPowerShell\Modules\MyModules"
if(!(Test-Path -Path $TargetDir))
{
    New-Item -ItemType "directory" -Path $TargetDir -Force
}
$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
Write-Host "Copying files from $($ScriptDir)\MyModules\*.* to $($TargetDir)"
Copy-Item "$($ScriptDir)\MyModules\*.*" $TargetDir 

$PowerShellProfileCurrentUserCurrentHost = "$([Environment]::GetFolderPath("MyDocuments"))\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
if (!(Test-Path -Path $PowerShellProfileCurrentUserCurrentHost)) {
  New-Item -ItemType File -Path $PowerShellProfileCurrentUserCurrentHost -Force
}
$Find = "Import-Module -Name $($TargetDir)\MyModule.psm1 -Verbose"
if(Select-String -Path $PowerShellProfileCurrentUserCurrentHost -Pattern $Find -SimpleMatch -quiet){
    Write-Host "found"
}else{
    Write-Host "not found"
    Add-Content -Path $PowerShellProfileCurrentUserCurrentHost -Value $Find
}

$PowerShellISEProfileCurrentUserCurrentHost = "$([Environment]::GetFolderPath("MyDocuments"))\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1"
if (!(Test-Path -Path $PowerShellISEProfileCurrentUserCurrentHost)) {
  New-Item -ItemType File -Path $PowerShellISEProfileCurrentUserCurrentHost -Force
}
if(Select-String -Path $PowerShellISEProfileCurrentUserCurrentHost -Pattern $Find -SimpleMatch -quiet){
    Write-Host "found"
}else{
    Write-Host "not found"
    Add-Content -Path $PowerShellISEProfileCurrentUserCurrentHost -Value $Find
}

$PowerShellNuGetProfileCurrentUserCurrentHost = "$([Environment]::GetFolderPath("MyDocuments"))\WindowsPowerShell\NuGet_profile.ps1"
if (!(Test-Path -Path $PowerShellNuGetProfileCurrentUserCurrentHost)) {
  New-Item -ItemType File -Path $PowerShellNuGetProfileCurrentUserCurrentHost -Force
}
if(Select-String -Path $PowerShellNuGetProfileCurrentUserCurrentHost -Pattern $Find -SimpleMatch -quiet){
    Write-Host "found"
}else{
    Write-Host "not found"
    Add-Content -Path $PowerShellNuGetProfileCurrentUserCurrentHost -Value $Find
}

# Copyright (c) STC STORB. All rights reserved.
# Licensed under the MIT License.

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
Install-Module -Name  "$($ScriptDir)\MyModules\MyModule.psm1" -Verbose -Scope CurrentUser
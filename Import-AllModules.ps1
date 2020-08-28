# Copyright (c) STC STORB. All rights reserved.
# Licensed under the MIT License.

$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
Import-Module -Name  "$($ScriptDir)\Modules\MyModule.psm1" -Verbose
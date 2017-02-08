Param(
    [Parameter(Position=1, Mandatory=$true)]
    [int]$version
)
Import-Module -Name .\VSSetup
$vs = Get-VSSetupInstance -All | Select-VSSetupInstance -Require 'Microsoft.VisualStudio.Workload.NativeDesktop' -Version "[$version.0,$($version+1).0)" -Latest
if (-Not $vs) {
    exit 1
}
$vs.InstallationPath + "\VC\Auxiliary\Build\vcvarsall.bat"
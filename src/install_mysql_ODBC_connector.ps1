# Powershell 2.0

# Stop and fail script when a command fails.
$errorActionPreference = "Stop"

# load library functions
$rsLibDstDirPath = "$env:rs_sandbox_home\RightScript\lib"
. "$rsLibDstDirPath\tools\ResolveError.ps1"
. "$rsLibDstDirPath\win\Version.ps1"

write-host "Install mysqlConnectorOdbcWinx64 and mysqlConnectorOdbcWin32..."
$parameters = "/qn /i " + $env:RS_ATTACH_DIR + "\mysqlConnectorODBC32.msi"
$installStatement = [System.Diagnostics.Process]::Start( "msiexec", $parameters )

$parameters = "/qn /i " + $env:RS_ATTACH_DIR + "\mysqlConnectorODBC64.msi"
$installStatement = [System.Diagnostics.Process]::Start( "msiexec", $parameters )

write-host "Installation complete"
$installStatement.WaitForExit()

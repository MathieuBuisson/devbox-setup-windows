Function Install-ChocolateyPackage {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    $Env:Path = [Environment]::GetEnvironmentVariable('Path','Machine') + [Environment]::GetEnvironmentVariable('Path','User')
    Write-ConsoleLog "Installing Chocolatey package [$Name]"
    choco.exe install -y $Name
}

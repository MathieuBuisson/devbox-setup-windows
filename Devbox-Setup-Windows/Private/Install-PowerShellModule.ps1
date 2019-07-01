Function Install-PowerShellModule {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    $InstallParams = @{
        Name          = $Name
        Repository    = 'PSGallery'
        Scope         = 'AllUsers'
        Force         = $True
    }
    If ( $Name -ieq 'Pester' ) {
        $InstallParams.Add('SkipPublisherCheck', $True)
    }
    If ( $Name -ieq 'Az' ) {
        $InstallParams.Add('AllowClobber', $True)
    }

    Write-ConsoleLog "Starting installation of PowerShell module [$Name]"
    Install-Module @InstallParams
}

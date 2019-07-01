Function Invoke-DevboxSetup {
    [CmdletBinding()]
    Param(

    )

    Begin {
        $ErrorActionPreference = 'Stop'
        $SetupStartTime = [System.DateTime]::Now
        $ConfirmPreference = 'None'
        Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
    }
    Process {
        $Config = Import-PowerShellDataFile -Path "$PSScriptRoot\..\Config.psd1"
        Set-FileExplorer

        # Enable developer mode
        Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock' -Name 'AllowDevelopmentWithoutDevLicense' -Value 1

        Install-Chocolatey
        Foreach ( $Package in $Config.ChocoPackages ) {
            Install-ChocolateyPackage -Name $Package
        }

        Foreach ( $Extension in $Config.VsCodeExtensions ) {
            Install-VsCodeExtension -Name $Extension
        }

        # Copy Visual Studio Code user settings
        Copy-VsCodeUserSettings
    }
    End {
        Write-ConsoleLog 'Setup complete.'
        $SetupEndTime = [System.DateTime]::Now
        $SetupDuration = $SetupEndTime - $SetupStartTime
        Write-ConsoleLog ('Setup run duration : {0:mm} minutes {0:ss} seconds' -f $SetupDuration)
    }
}

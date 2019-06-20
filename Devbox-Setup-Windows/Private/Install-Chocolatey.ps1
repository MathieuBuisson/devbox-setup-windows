Function Install-Chocolatey {
    [CmdletBinding()]
    Param(
    )

    $ScriptUrl = 'https://chocolatey.org/install.ps1'
    $WebClient = New-Object -TypeName 'System.Net.WebClient'

    Write-ConsoleLog 'Downloading Chocolatey installation script'
    $ScriptContent = $WebClient.DownloadString($ScriptUrl)

    Write-ConsoleLog 'Executing Chocolatey installation script'
    Invoke-Expression $ScriptContent
}

Function Install-VsCodeExtension {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    $CodeBinPath = 'C:\Program Files\Microsoft VS Code\bin\code'
    Write-ConsoleLog "Installing VsCode extension [$Name]"
    & $CodeBinPath @('--install-extension', $Name)

    # Giving a bit of time for VsCode to complete the installation
    Start-Sleep -Seconds 15
}

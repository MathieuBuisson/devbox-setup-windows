Function Copy-VsCodeUserSettings {
    [CmdletBinding()]
    Param()

    $UserSettingsFilePath = Join-Path -Path $env:APPDATA -ChildPath 'Code\User\settings.json'
    $ExistingFile = Get-ChildItem -Path $UserSettingsFilePath -ErrorAction SilentlyContinue

    If ( $ExistingFile ) {
        $BackupFileName = '{0}.bak' -f $ExistingFile.Name
        Write-ConsoleLog "A settings file is present in [$($ExistingFile.DirectoryName)], renaming it to [$BackupFileName]"
        Rename-Item -Path $ExistingFile.FullName -NewName $BackupFileName -Confirm:$False -Force
    }
    $SourceFilePath = (Resolve-Path "$PSScriptRoot\..\Assets\settings.json").Path
    Copy-Item -Path $SourceFilePath -Destination $UserSettingsFilePath -Force

    Write-ConsoleLog "VS Code settings copied to [$UserSettingsFilePath]"
}

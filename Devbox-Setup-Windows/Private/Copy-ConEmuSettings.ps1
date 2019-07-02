Function Copy-ConEmuSettings {
    [CmdletBinding()]
    Param()

    $SettingsPath = Join-Path -Path $env:ProgramFiles -ChildPath 'ConEmu\ConEmu.xml'
    $ExistingFile = Get-ChildItem -Path $SettingsPath -ErrorAction SilentlyContinue

    If ( $ExistingFile ) {
        $BackupFileName = '{0}.bak' -f $ExistingFile.Name
        Write-ConsoleLog "A settings file is present in [$($ExistingFile.DirectoryName)], renaming it to [$BackupFileName]"
        Rename-Item -Path $ExistingFile.FullName -NewName $BackupFileName -Confirm:$False -Force
    }
    $SourceFilePath = (Resolve-Path "$PSScriptRoot\..\Assets\ConEmu.xml").Path
    Copy-Item -Path $SourceFilePath -Destination $SettingsPath -Force

    Write-ConsoleLog "ConEmu settings profile copied to [$SettingsPath]"
}

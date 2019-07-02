Function Copy-PowerShellProfile {
    [CmdletBinding()]
    Param()

    $ProfilePath = Join-Path -Path $env:USERPROFILE -ChildPath 'Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1'
    $ExistingFile = Get-ChildItem -Path $ProfilePath -ErrorAction SilentlyContinue

    If ( $ExistingFile ) {
        $BackupFileName = '{0}.bak' -f $ExistingFile.Name
        Write-ConsoleLog "A profile file is present in [$($ExistingFile.DirectoryName)], renaming it to [$BackupFileName]"
        Rename-Item -Path $ExistingFile.FullName -NewName $BackupFileName -Confirm:$False -Force
    }
    $SourceFilePath = (Resolve-Path "$PSScriptRoot\..\Assets\Microsoft.PowerShell_profile.ps1").Path
    Copy-Item -Path $SourceFilePath -Destination $ProfilePath -Force

    Write-ConsoleLog "PowerShell profile copied to [$ProfilePath]"
}

Function Set-FileExplorer {
    [CmdletBinding()]
    Param(
    )

    $ExplorerKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer'
    $AdvancedKey = '{0}\Advanced' -f $ExplorerKey
    $CabinetStateKey = '{0}\CabinetState' -f $ExplorerKey

    Write-ConsoleLog 'Setting Windows Explorer options'

    # Show hidden items
    Set-ItemProperty -Path $AdvancedKey -Name 'Hidden' -Value 1

    # Show file extensions
    Set-ItemProperty -Path $AdvancedKey -Name 'HideFileExt' -Value 0

    # Hide the task view button from the taskbar
    Set-ItemProperty -Path $AdvancedKey -Name 'ShowTaskViewButton' -Value 0

    # Open Computer view when opening Windows Explorer
    Set-ItemProperty -Path $AdvancedKey -Name 'LaunchTo' -Value 1

    # Show full path in the title bar
    Set-ItemProperty -Path $CabinetStateKey -Name 'FullPath' -Value 1
}

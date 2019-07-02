Import-Module -Name 'PSReadline'

function prompt {
    $origLastExitCode = $LastExitCode
    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower())) {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }
    Write-Host $curPath -NoNewline -ForegroundColor Black -BackgroundColor DarkGreen
    Write-Host "$([char]57520) " -NoNewline -ForegroundColor DarkGreen

    Write-VcsStatus
    "`n$('>' * ($nestedPromptLevel + 1)) "
    $LastExitCode = $origLastExitCode
}

Import-Module -Name 'posh-git'

# Background colors
$baseBackgroundColor = 'DarkBlue'
$GitPromptSettings.AfterStashBackgroundColor = $baseBackgroundColor
$GitPromptSettings.BeforeBackgroundColor = $baseBackgroundColor
$GitPromptSettings.BeforeIndexBackgroundColor = $baseBackgroundColor
$GitPromptSettings.BeforeStashBackgroundColor = $baseBackgroundColor
$GitPromptSettings.BranchAheadStatusBackgroundColor = $baseBackgroundColor
$GitPromptSettings.BranchBackgroundColor = $baseBackgroundColor
$GitPromptSettings.BranchBehindAndAheadStatusBackgroundColor = $baseBackgroundColor
$GitPromptSettings.BranchBehindStatusBackgroundColor = $baseBackgroundColor
$GitPromptSettings.BranchGoneStatusBackgroundColor = $baseBackgroundColor
$GitPromptSettings.BranchIdenticalStatusToBackgroundColor = $baseBackgroundColor
$GitPromptSettings.DelimBackgroundColor = $baseBackgroundColor
$GitPromptSettings.IndexBackgroundColor = $baseBackgroundColor
$GitPromptSettings.ErrorBackgroundColor = $baseBackgroundColor
$GitPromptSettings.LocalDefaultStatusBackgroundColor = $baseBackgroundColor
$GitPromptSettings.LocalStagedStatusBackgroundColor = $baseBackgroundColor
$GitPromptSettings.LocalWorkingStatusBackgroundColor = $baseBackgroundColor
$GitPromptSettings.StashBackgroundColor = $baseBackgroundColor
$GitPromptSettings.WorkingBackgroundColor = $baseBackgroundColor

# Foreground colors
$GitPromptSettings.AfterForegroundColor = $baseBackgroundColor
$GitPromptSettings.BeforeForegroundColor = "Black"
$GitPromptSettings.BranchForegroundColor = "Blue"
$GitPromptSettings.BranchGoneStatusForegroundColor = "Blue"
$GitPromptSettings.BranchIdenticalStatusToForegroundColor = "DarkYellow"
$GitPromptSettings.DefaultForegroundColor = "Gray"
$GitPromptSettings.DelimForegroundColor = "Blue"
$GitPromptSettings.IndexForegroundColor = "Green"

# Prompt shape
$GitPromptSettings.BeforeText = "$([char]57520)"
$GitPromptSettings.AfterText = "$([char]57520) "
$GitPromptSettings.DelimText = " ॥"
$GitPromptSettings.ShowStatusWhenZero = $False

# Aliases for common git commands

function ga {
    & git add --all
}

function gd {
    & git diff --staged
}

function glp {
    & git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold green)(%cr) %C(bold yellow)<%an>%Creset' --abbrev-commit
}

function gpc {
    & git commit -m $args
}

function gpr {
    & git pull --rebase
}

function gst {
    & git status
}

function gp {
    # Pass in the branch name
    & git push origin $args
}

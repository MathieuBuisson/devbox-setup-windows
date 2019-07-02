Import-Module -Name 'PSReadline'
Import-Module -Name 'posh-git'

function Prompt {

    Try {
        $history = Get-History -ErrorAction Ignore -Count 1
        If ($history) {
            Write-Host "[" -NoNewline -ForegroundColor Black -BackgroundColor DarkGreen
            $ts = New-TimeSpan $history.StartExecutionTime $history.EndExecutionTime
            Switch ($ts) {
                {$_.TotalSeconds -lt 1} {
                    [int]$d = $_.TotalMilliseconds
                    '{0}ms' -f ($d) | Write-Host -NoNewline -ForegroundColor Black -BackgroundColor DarkGreen
                    break
                }
                {$_.totalminutes -lt 1} {
                    [int]$d = $_.TotalSeconds
                    '{0}s' -f ($d) | Write-Host -NoNewline -ForegroundColor Black -BackgroundColor DarkGreen
                    break
                }
                {$_.totalminutes -ge 1} {
                    "{0:HH:mm:ss}" -f ([datetime]$ts.Ticks) | Write-Host -NoNewline
                    break
                }
            }
            Write-Host "]" -NoNewline -ForegroundColor Black -BackgroundColor DarkGreen
        }

        $SplitPath = $PWD.Path.Split('\')
        $PathToWrite = If ($SplitPath.Count -gt 3) {' {0}\...\{1}\{2}' -f $SplitPath[0], $SplitPath[-2], $SplitPath[-1]} Else {" $($PWD.Path)"}

        Write-Host $PathToWrite -NoNewline

        If (Get-Module -Name 'posh-git') {
            Write-VcsStatus
        }
    }
    Catch { }

    "`n$('>' * ($nestedPromptLevel + 1)) "
}

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

Set-Location -Path 'C:\git'
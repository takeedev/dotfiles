$DotfilesCommandNames = @(
  "gs", "gsh", "ga", "gaa", "gc", "gcm", "gcam", "gca", "gp", "gpf",
  "gl", "gpr", "gup", "gb", "gco", "gsw", "gcb", "gd", "gds", "gf",
  "glog", "gll", "gm", "grb", "gcp", "gst", "gstp", "gstl", "grst",
  "grh", "ll", "la", "l", "c", "mkdirp", "reload", "path", "idea"
)

foreach ($Name in $DotfilesCommandNames) {
  if (Test-Path -LiteralPath "Alias:$Name") {
    Remove-Item -LiteralPath "Alias:$Name" -Force -ErrorAction SilentlyContinue
  }
}

# git
function global:gs { git status @args }
function global:gsh { git status --short @args }
function global:ga { git add @args }
function global:gaa { git add --all @args }
function global:gc { git commit @args }
function global:gcm { git commit -m @args }
function global:gcam { git commit -am @args }
function global:gca { git commit --amend @args }
function global:gp { git push @args }
function global:gpf { git push --force-with-lease @args }
function global:gl { git pull @args }
function global:gpr { git pull --rebase @args }
function global:gup { git pull --rebase --autostash @args }
function global:gb { git branch @args }
function global:gco { git checkout @args }
function global:gsw { git switch @args }
function global:gcb { git checkout -b @args }
function global:gd { git diff @args }
function global:gds { git diff --staged @args }
function global:gf { git fetch @args }
function global:glog { git log --oneline --graph --decorate @args }
function global:gll { git log --oneline --graph --decorate --all @args }
function global:gm { git merge @args }
function global:grb { git rebase @args }
function global:gcp { git cherry-pick @args }
function global:gst { git stash @args }
function global:gstp { git stash pop @args }
function global:gstl { git stash list @args }
function global:grst { git restore --staged @args }
function global:grh { git reset --hard @args }

# files and navigation
function global:ll { Get-ChildItem -Force @args }
function global:la { Get-ChildItem -Force @args }
function global:l { Get-ChildItem @args }
function global:.. { Set-Location .. }
function global:... { Set-Location ..\.. }
function global:.... { Set-Location ..\..\.. }
function global:c { Clear-Host }
function global:mkdirp {
  param([Parameter(ValueFromRemainingArguments = $true)][string[]] $Path)

  if (-not $Path) {
    Write-Error "mkdirp requires a path."
    return
  }

  New-Item -ItemType Directory -Force -Path $Path | Out-Null
}
function global:reload { . $PROFILE.CurrentUserAllHosts }
function global:path { $env:PATH -split [IO.Path]::PathSeparator }

# IDE
function global:idea {
  param([string] $Target = ".")

  $Launchers = Get-Command idea64.exe, idea.exe, idea.cmd -CommandType Application, ExternalScript -ErrorAction SilentlyContinue
  $Launcher = @($Launchers)[0]

  if (-not $Launcher) {
    Write-Error "IntelliJ IDEA command-line launcher not found. Add idea64.exe, idea.exe, or idea.cmd to PATH."
    return
  }

  Start-Process -FilePath $Launcher.Source -ArgumentList $Target
}


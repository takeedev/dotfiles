# dotfiles

Personal configuration files.

## Shell aliases

Aliases and helper functions are stored in `shell/aliases.zsh` for Zsh and `shell/aliases.ps1` for PowerShell.

### Git

| Alias | Command |
| --- | --- |
| `gs` | `git status` |
| `gsh` | `git status --short` |
| `ga` | `git add` |
| `gaa` | `git add --all` |
| `gc` | `git commit` |
| `gcm` | `git commit -m` |
| `gcam` | `git commit -am` |
| `gca` | `git commit --amend` |
| `gp` | `git push` |
| `gpf` | `git push --force-with-lease` |
| `gl` | `git pull` |
| `gpr` | `git pull --rebase` |
| `gup` | `git pull --rebase --autostash` |
| `gb` | `git branch` |
| `gco` | `git checkout` |
| `gsw` | `git switch` |
| `gcb` | `git checkout -b` |
| `gd` | `git diff` |
| `gds` | `git diff --staged` |
| `gf` | `git fetch` |
| `glog` | `git log --oneline --graph --decorate` |
| `gll` | `git log --oneline --graph --decorate --all` |
| `gm` | `git merge` |
| `grb` | `git rebase` |
| `gcp` | `git cherry-pick` |
| `gst` | `git stash` |
| `gstp` | `git stash pop` |
| `gstl` | `git stash list` |
| `grst` | `git restore --staged` |
| `grh` | `git reset --hard` |

### Files and navigation

| Alias | Command |
| --- | --- |
| `ll` | List files, including hidden files |
| `la` | List files, including hidden files |
| `l` | List files |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |
| `c` | `clear` / `Clear-Host` |
| `mkdirp` | Create directories recursively |
| `reload` | Reload shell profile |
| `path` | Print each `PATH` entry on its own line |

### macOS / Linux / Zsh

To install without replacing your existing `~/.zshrc`:

```sh
sh install.sh
```

Or install from GitHub:

```sh
curl -fsSL https://raw.githubusercontent.com/takeedev/dotfiles/main/install.sh | sh
```

The installer appends this line to `~/.zshrc` once:

```sh
. "/path/to/aliases.zsh"
```

To use them for the current terminal session:

```sh
source ~/.zshrc
```

### Windows / PowerShell

To install without replacing your existing PowerShell profile:

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

Or with PowerShell 7:

```powershell
pwsh -ExecutionPolicy Bypass -File .\install.ps1
```

Or install from GitHub:

```powershell
irm https://raw.githubusercontent.com/takeedev/dotfiles/main/install.ps1 | iex
```

The installer appends this line to your current user PowerShell profile once:

```powershell
. "C:\path\to\aliases.ps1"
```

To use them for the current terminal session:

```powershell
. $PROFILE.CurrentUserAllHosts
```

## Open in IntelliJ IDEA

Open the current directory in IntelliJ IDEA:

```sh
idea
```

Or open a specific path:

```sh
idea /path/to/project
```

On Windows PowerShell:

```powershell
idea .
```

## OS support

This project supports Zsh-based shells and PowerShell.

| OS | Status | Notes |
| --- | --- | --- |
| macOS | Supported | `install.sh` updates `~/.zshrc`. The `idea` function uses the IntelliJ IDEA macOS app. |
| Linux | Supported with setup | `install.sh` updates `~/.zshrc`. The `idea` function requires an IntelliJ IDEA launcher such as `idea`, `intellij-idea-ultimate`, or `intellij-idea-community` in `PATH`. |
| Windows | Supported with PowerShell | `install.ps1` updates your PowerShell profile. The `idea` function requires `idea64.exe`, `idea.exe`, or `idea.cmd` in `PATH`. Unix-like shells such as Git Bash, MSYS2, Cygwin, or WSL can still use the Zsh installer when Zsh is installed. |


# dotfiles

Personal configuration files.

## Shell aliases

Aliases and helper functions are stored in `shell/aliases.zsh`.

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
| `ll` | `ls -lah` |
| `la` | `ls -A` |
| `l` | `ls -CF` |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |
| `c` | `clear` |
| `mkdirp` | `mkdir -p` |
| `reload` | `source ~/.zshrc` |
| `path` | Print each `PATH` entry on its own line |

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

## Open in IntelliJ IDEA

Open the current directory in IntelliJ IDEA:

```sh
idea
```

Or open a specific path:

```sh
idea /path/to/project
```

## OS support

This project is designed for Zsh-based shells.

| OS | Status | Notes |
| --- | --- | --- |
| macOS | Supported | `install.sh` updates `~/.zshrc`. The `idea` function uses the IntelliJ IDEA macOS app. |
| Linux | Supported with setup | `install.sh` updates `~/.zshrc`. The `idea` function requires an IntelliJ IDEA launcher such as `idea`, `intellij-idea-ultimate`, or `intellij-idea-community` in `PATH`. |
| Windows | Partial support | Works in Unix-like shells such as Git Bash, MSYS2, Cygwin, or WSL when Zsh is installed. The `idea` function requires `idea64.exe` or `idea.exe` in `PATH`. It is not designed for PowerShell or Command Prompt. |

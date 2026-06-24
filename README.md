# dotfiles

Personal configuration files.

## Shell aliases

Git aliases are stored in `shell/aliases.zsh`:

```sh
alias gs="git status"
alias ga="git add"
alias gaa="git add --all"
```

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

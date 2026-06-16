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

The installer appends this line to `~/.zshrc` once:

```sh
. "/path/to/dotfiles/shell/aliases.zsh"
```

To use them for the current terminal session:

```sh
source ~/.zshrc
```

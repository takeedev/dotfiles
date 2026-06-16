#!/usr/bin/env sh
set -eu

DOTFILES_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
SOURCE_LINE=". \"$DOTFILES_DIR/shell/aliases.zsh\""
ZSHRC="$HOME/.zshrc"

touch "$ZSHRC"

if grep -Fqx "$SOURCE_LINE" "$ZSHRC"; then
  printf 'Already installed: %s\n' "$SOURCE_LINE"
else
  {
    printf '\n'
    printf '# dotfiles aliases\n'
    printf '%s\n' "$SOURCE_LINE"
  } >> "$ZSHRC"
  printf 'Added aliases source line to %s\n' "$ZSHRC"
fi

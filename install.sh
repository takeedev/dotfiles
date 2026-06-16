#!/usr/bin/env sh
set -eu

DOTFILES_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
RAW_BASE_URL="https://raw.githubusercontent.com/takeedev/dotfiles/refs/heads/main"
LOCAL_ALIASES="$DOTFILES_DIR/shell/aliases.zsh"
REMOTE_CONFIG_DIR="$HOME/.config/takeedev-dotfiles"
REMOTE_ALIASES="$REMOTE_CONFIG_DIR/aliases.zsh"
ZSHRC="$HOME/.zshrc"

download() {
  url="$1"
  output="$2"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$url" -o "$output"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$output" "$url"
  else
    printf 'Error: curl or wget is required to download dotfiles.\n' >&2
    exit 1
  fi
}

if [ -f "$LOCAL_ALIASES" ]; then
  ALIASES_FILE="$LOCAL_ALIASES"
else
  mkdir -p "$REMOTE_CONFIG_DIR"
  download "$RAW_BASE_URL/shell/aliases.zsh" "$REMOTE_ALIASES"
  ALIASES_FILE="$REMOTE_ALIASES"
fi

SOURCE_LINE=". \"$ALIASES_FILE\""

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

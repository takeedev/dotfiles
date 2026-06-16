#!/usr/bin/env sh
set -eu

RAW_BASE_URL="https://raw.githubusercontent.com/takeedev/dotfiles/main"
REMOTE_CONFIG_DIR="$HOME/.config/takeedev-dotfiles"
REMOTE_ALIASES="$REMOTE_CONFIG_DIR/aliases.zsh"
ZSHRC="$HOME/.zshrc"

DOTFILES_DIR=""
if [ -f "$0" ]; then
  DOTFILES_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
fi

LOCAL_ALIASES=""
if [ -n "$DOTFILES_DIR" ]; then
  LOCAL_ALIASES="$DOTFILES_DIR/shell/aliases.zsh"
fi

download() {
  url="$1"
  output="$2"

  if command -v curl >/dev/null 2>&1; then
    if ! curl -fsSL "$url" -o "$output"; then
      printf 'Error: failed to download %s\n' "$url" >&2
      exit 1
    fi
  elif command -v wget >/dev/null 2>&1; then
    if ! wget -qO "$output" "$url"; then
      printf 'Error: failed to download %s\n' "$url" >&2
      exit 1
    fi
  else
    printf 'Error: curl or wget is required to download dotfiles.\n' >&2
    exit 1
  fi
}

if [ -n "$LOCAL_ALIASES" ] && [ -f "$LOCAL_ALIASES" ]; then
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

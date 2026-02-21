#!/bin/zsh

echo "[INFO] install claude dependencies"

if [ "$(uname)" = 'Darwin' ]; then
  if ! type deno > /dev/null 2>&1; then
    echo "[INFO] install deno"
    brew install deno
  else
    echo "[INFO] deno is already installed"
  fi

  if ! type terminal-notifier > /dev/null 2>&1; then
    echo "[INFO] install terminal-notifier"
    brew install terminal-notifier
  else
    echo "[INFO] terminal-notifier is already installed"
  fi
else
  echo "[WARN] non-macOS environment: skipping terminal-notifier"
  if ! type deno > /dev/null 2>&1; then
    echo "[INFO] install deno"
    brew install deno
  else
    echo "[INFO] deno is already installed"
  fi
fi

echo "[INFO] deploy claude config files"

mkdir -p ~/.claude/scripts

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

ln -sf "$DOTFILES_DIR/configs/claude/settings.json" ~/.claude/settings.json
echo "[INFO] linked settings.json"

ln -sf "$DOTFILES_DIR/configs/claude/scripts/claude-notify.ts" ~/.claude/scripts/claude-notify.ts
echo "[INFO] linked claude-notify.ts"

echo "[INFO] finished"

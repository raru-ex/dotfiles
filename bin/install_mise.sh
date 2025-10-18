#!/usr/bin/env bash
set -e

# mise がなければインストール
if ! command -v mise &> /dev/null; then
  echo "Installing mise..."
  curl https://mise.run | sh
fi

# mise を初期化
eval "$($HOME/.local/bin/mise activate bash)"

# グローバル設定を適用
echo "Applying global tool versions..."
mise install --yes
mise use --global

echo "mise Setup complete ✅"

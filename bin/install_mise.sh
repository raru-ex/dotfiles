#!/usr/bin/env bash
set -e

# mise がなければインストール
if ! command -v mise &> /dev/null; then
  echo "Installing mise..."
  curl https://mise.run | sh
fi

# mise を初期化
eval "$($HOME/.local/bin/mise activate bash)"

# 設定ディレクトリを作成
mkdir -p ~/.config/mise

# mise.toml のシンボリックリンクを作成
echo "Creating symlink for mise.toml..."
ln -nfs ~/dotfiles/configs/mise/mise.toml ~/.config/mise/config.toml

# グローバル設定を適用
echo "Applying global tool versions..."
mise install --yes

echo "mise Setup complete ✅"

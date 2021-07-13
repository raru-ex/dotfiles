#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

if type brew > /dev/null 2>&1; then
  echo "[INFO] brew is already installed"
else
  echo "[INFO] install homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# 現在のbrewは自動でlua付きのvimを入れる
echo "[INFO] install any tools"
brew install git svn lazygit tree nvim vim ripgrep zsh git-delta golangci-lint jq
echo "[INFO] finished"


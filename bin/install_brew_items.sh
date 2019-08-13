#!/bin/zsh

## sh エミュレーションモード
# emulate -R sh

if !(type brew > /dev/null 2>&1); then
  echo "[INFO] install homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# 現在のbrewは自動でlua付きのvimを入れる
echo "[INFO] install any tools"
brew install lazygit tree nvim
brew install vim
brew install ripgrep
brew install zsh
echo "[INFO] finished"

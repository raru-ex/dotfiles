#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

if type brew > /dev/null 2>&1; then
  echo "[INFO] install Ricty"
  brew tap sanemat/font
  brew install ricty
  cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
  fc-cache -vf
  echo "[INFO] Ricty font install finished"
else
  echo "[WARN] brew is not installed. Please install homebrew"
fi

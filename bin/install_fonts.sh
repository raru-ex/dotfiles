#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

if type brew > /dev/null 2>&1; then
  echo "install Ricty"
  brew tap sanemat/font
  brew install ricty
  cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
  fc-cache -vf
  echo "finished"
else
  echo "brew is not installed. please install homebrew"
fi

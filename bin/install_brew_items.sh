#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

if type brew > /dev/null 2>&1; then
  echo "install any tools"
  brew install tig tree nvim
  brew install vim --with-lua
  echo "finished"
else
  echo "brew is not installed. please install homebrew"
fi

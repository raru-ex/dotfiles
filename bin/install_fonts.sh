#!/bin/zsh

## sh エミュレーションモード
#emulate -R sh

if type brew > /dev/null 2>&1; then

	if [ "$(uname)" = 'Darwin' ]; then
    echo "[INFO] Install Nerdfonts"
    brew tap homebrew/cask-fonts
    brew install --cask font-jetbrains-mono-nerd-font
    echo "[INFO] Finish Nerdfonts"
  elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
    echo "[INFO] Please Install nerdfonts from nerdfonts.com"
  elif [ -n "$(which wslpath)" ]; then
    echo "[INFO] Please Install hakugen or other fonts"
  fi

else
  echo "[WARN] brew is not installed. Please install homebrew"
fi

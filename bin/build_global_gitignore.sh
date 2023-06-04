#!/bin/zsh

## sh エミュレーションモード
# emulate -R sh

echo "[INFO] build global gitignore"
awk 1 ~/dotfiles/configs/git/ignores/* > ~/dotfiles/.config/git/ignore


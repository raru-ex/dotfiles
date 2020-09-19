#!/bin/sh
# vim
echo "[INFO] Create symlink for alacritty"
mkdir -p ~/.config/
ln -nfs ~/dotfiles/.config/alacritty/ ~/.config/
echo "[INFO] finished"

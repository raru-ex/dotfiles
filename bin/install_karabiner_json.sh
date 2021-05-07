#!/bin/sh
# vim
echo "[INFO] Create symlink for karabiner"
mkdir -p ~/.config/
ln -nfs ~/dotfiles/.config/karabiner/ ~/.config

echo "[INFO] finished"

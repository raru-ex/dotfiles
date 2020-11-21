#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

echo "[INFO] Install git-delta"
brew install git-delta

echo "[INFO] Build global gitignore file"
sh ~/dotfiles/bin/build_global_gitignore.sh

echo "[INFO] Create symlink for git"
ln -nfs ~/dotfiles/.config/git ~/.config/
ln -nfs ~/dotfiles/configs/git/.gitconfig ~/.gitconfig




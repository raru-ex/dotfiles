#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

# vim
echo "[INFO] Create symlink for vim"
ln -nfs ~/dotfiles/.vimrc ~/.vimrc
ln -nfs ~/dotfiles/.vim ~/.vim
# nvim
mkdir -p ~/.config/
ln -nfs ~/dotfiles/.vim ~/.config/nvim
ln -nfs ~/dotfiles/.vimrc ~/.config/nvim/init.vim


echo "[INFO] Create vim symlinks finished"

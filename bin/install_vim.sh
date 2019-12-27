#!/bin/sh
# vim
echo "[INFO] Create symlink for vim"
ln -nfs ~/dotfiles/.vimrc ~/.vimrc
ln -nfs ~/dotfiles/.vim ~/.vim
# nvim
mkdir -p ~/.config/
ln -nfs ~/dotfiles/.vim ~/.config/nvim
ln -nfs ~/dotfiles/.vimrc ~/.config/nvim/init.vim

# ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -nfs ~/dotfiles/.ctags ~/.ctags

echo "[INFO] finished"

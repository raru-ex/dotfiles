#!/bin/zsh

## sh エミュレーションモード
# emulate -R sh

if ! type fzf -a type git > /dev/null 2>&1; then
  echo "[INFO] install fzf"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else
  echo "[INFO] skip install fzf"
fi


echo "[INFO] Create zsh symlinks"
ln -nfs ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
echo "[INFO] Create zsh symlinks finished"

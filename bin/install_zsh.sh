#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

if ! type fzf -a type git > /dev/null 2>&1; then
  echo "[INFO] install fzf"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else
  echo "[INFO] skip install fzf"
fi

if ! type nodenv -a type git > /dev/null 2>&1; then
  echo "[INFO] install nodenv"
  git clone git://github.com/nodenv/nodenv.git ~/.nodenv
  mkdir -p ~/.nodenv/plugins
  git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
  git clone https://github.com/nodenv/node-build-update-defs.git ~/.nodenv/plugins/node-build-update-defs
else
  echo "[INFO] skip install nodenv"
fi



echo "[INFO] Create zsh symlinks"
ln -nfs ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
echo "[INFO] Create zsh symlinks finished"

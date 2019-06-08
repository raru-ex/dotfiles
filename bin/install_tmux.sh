#!/bin/sh

if type brew > /dev/null 2>&1; then
  echo "[INFO] install tmux"
  brew install tmux
  echo "[INFO] install tmux plugin manager"
  mkdir -p ~/.tmux/plugins/
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "[INFO] create tmux symlink"
  # tmux
  ln -nfs ~/dotfiles/.tmux.conf ~/.tmux.conf
  echo "[INFO] finished install tmux"
else
  echo "[ERROR] brew is not installed. please install homebrew"
fi

# tmux用のバッテリー表示スクリプトの権限修正
chmod 755 ~/dotfiles/.tmux/battery

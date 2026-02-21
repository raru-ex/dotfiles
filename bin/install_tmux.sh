#!/bin/sh

if type brew > /dev/null 2>&1; then
  echo "[INFO] install tmux"
  brew install tmux
  echo "[INFO] install tmux plugin manager"
  mkdir -p ~/.tmux/plugins/
  if [ -d ~/.tmux/plugins/tpm ]; then
    echo "[INFO] tpm already installed, skipping"
  else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
  echo "[INFO] create tmux symlink"
  ln -nfs ~/dotfiles/.tmux.conf ~/.tmux.conf
  ln -nfs ~/dotfiles/.tmux/bin ~/.tmux/
  echo "[INFO] finished install tmux"
else
  echo "[ERROR] brew is not installed. please install homebrew"
fi

# tmux用のバッテリー表示スクリプトの権限修正
chmod 755 ~/.tmux/bin/battery
chmod 755 ~/.tmux/bin/tmuxpopup

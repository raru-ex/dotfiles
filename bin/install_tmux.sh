#!/bin/sh

if type brew > /dev/null 2>&1; then
  echo "install tmux"
  brew install tmux
  echo "finished"
  echo "create tmux symlink"
  # tmux
  ln -nfs ~/dotfiles/.tmux.conf ~/.tmux.conf
  echo "finish"
else
  echo "brew is not installed. please install homebrew"
fi

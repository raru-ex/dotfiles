#!/bin/zsh

## sh エミュレーションモード
# emulate -R sh

if !(type brew > /dev/null 2>&1); then
  echo "[INFO] Install homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if !(type alacritty > /dev/null 2>&1); then
  echo "[INFO] Install alacritty"
  if [ ! -e ~/tmp/src ]; then
    mkdir -p ~/tmp/src
  fi

  if !(type rustup > /dev/null 2>&1); then
    echo "[INFO] Install rustup"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc
    echo "[INFO] rustup is installed"
    echo "[INFO] Please execute 'source ~/.zshrc'"

    export PATH="$HOME/.cargo/bin:$PATH"

    echo "[INFO] Set rust"
    rustup override set stable
    rustup update stable
  fi

  echo "[INFO] Clone Alacritty repository"
  git clone https://github.com/alacritty/alacritty.git ~/tmp/src
  cd ~/tmp/src
  make app
  echo "[INFO] make alacritty.app"
  cp -r target/release/osx/Alacritty.app /Applications/

  echo "[INFO] Set Alacritty shell completions"
  mkdir -p ${ZDOTDIR:-~}/.zsh_functions
  echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
  cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

else
  echo "[INFO] Alacritty is already installed"
fi



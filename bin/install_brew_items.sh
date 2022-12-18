#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

if [ "$(uname)" == 'Darwin' ]; then
  #Mac OS
  if type brew > /dev/null 2>&1; then
    echo "[INFO] brew is already installed"
  else
    echo "[INFO] install homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # 現在のbrewは自動でlua付きのvimを入れる
  echo "[INFO] install any tools"
  brew install git svn lazygit tree nvim vim ripgrep zsh git-delta golangci-lint jq
  echo "[INFO] finished"

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  #Linux
  if type brew > /dev/null 2>&1; then
    echo "[INFO] brew is already installed"
  else
    echo "[INFO] install homebrew"
    sudo apt update
    sudo apt-get install build-essential curl file git
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "[INFO] check and set PATH"
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bash_profile
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.profile

  fi

  echo "[INFO] install any tools"
  brew install git svn lazygit tree nvim vim ripgrep zsh git-delta golangci-lint jq bat wget
  echo "[INFO] finished"

fi



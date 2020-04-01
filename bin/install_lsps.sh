#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

echo "[INFO] Start set up Metals(scala lsp)"

if !(type /usr/local/bin/coursier > /dev/null 2>&1); then
  echo "[INFO] Install coursier"
  /usr/bin/curl -L -o /usr/local/bin/coursier https://git.io/coursier
  chmod +x /usr/local/bin/coursier
fi

if [ ! -e ~/.config/coc ]; then
  mkdir -p ~/.config/coc/extensions
fi

if [ ! -e ~/.config/efm-langserver ]; then
  mkdir -p ~/.config/efm-langserver
fi

echo "[INFO] Execute coursier for scalafmt"
/usr/local/bin/coursier bootstrap org.scalameta:scalafmt-cli_2.12:2.0.1 \
    -r sonatype:snapshots \
    -o /usr/local/bin/scalafmt --standalone --main org.scalafmt.cli.Cli

echo "[INFO] Install finished"
echo "[INFO] Please export  metals-vim command path to your \$PATH"

echo "[INFO] Start install efm"

if type brew > /dev/null 2>&1; then
  echo "[INFO] Install go and efm"
  brew install go
  echo "export GOPATH=\$HOME/go" >> ~/.zprofile
  echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.zprofile
  go get github.com/mattn/efm-langserver/cmd/efm-langserver

  # lintインストール
  if type pip2 > /dev/null 2>&1; then
    pip2 install vim-vint yamllint
  fi
  if type pip3 > /dev/null 2>&1; then
    pip3 install vim-vint yamllint
  fi

  if type npm > /dev/null 2>&1; then
    npm i -g markdownlint-cli
    mkdir -p ~/.config/efm-langserver
    ln -nfs ~/dotfiles/configs/efm-langserver/config.yaml ~/.config/efm-langserver/config.yaml
  else
    echo "[ERROR] Please install npm"
  fi

  echo "[INFO] finished"
else
  echo "brew is not installed. Please install homebrew"
fi

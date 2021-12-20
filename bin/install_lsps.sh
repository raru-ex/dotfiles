#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

echo "[INFO] Start set up Metals(scala lsp)"


if [ ! -e ~/.config/coc ]; then
  mkdir -p ~/.config/coc/extensions
fi

if [ ! -e ~/.config/efm-langserver ]; then
  mkdir -p ~/.config/efm-langserver
fi

echo "[INFO] Start install efm"

if type brew > /dev/null 2>&1; then
  if !(type go > /dev/null 2>&1); then
    echo "[INFO] Install go"
    brew install go
    echo "export GOPATH=\$HOME/go" >> ~/.zprofile
    echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.zprofile
    echo "[INFO] finished"
  fi

  if !(type efm-langserver > /dev/null 2>&1); then
    echo "[INFO] Install efm"
    go get github.com/mattn/efm-langserver

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
  fi


if !(type terraform-lsp  > /dev/null 2>&1); then
  echo "[INFO] Install terraform lsp"
  mkdir -p ~/tmp/src/
  git clone https://github.com/juliosueiras/terraform-lsp ~/tmp/src/terraform-lsp
  cd ~/tmp/src/terraform-lsp
  GO111MODULE=on go mod download
  echo "[INFO] Start make"
  make
  make copy
  echo "[INFO] set PATH"
  echo 'export PATH=$PATH:~/.bin' >> ~/.zprofile
  \rm -rf ~/tmp/src/terraform-lsp
  cat <<EOS
[INFO] Finished: Please add following settings to your coc-settings.json and source ~/.zprofile
{
	"languageserver": {
		"terraform": {
			"command": "terraform-lsp",
			"filetypes": [
				"terraform",
				"tf"
			],
			"initializationOptions": {},
			"settings": {}
		}
	}
}
EOS
fi

else
  echo "brew is not installed. Please install homebrew"
fi

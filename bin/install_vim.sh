#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

if !(type node > /dev/null 2>&1); then

  if [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    echo "[INFO] install node and nvm"
    sudo apt-get install curl vim-gtk
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
    echo "[INFO] nvm is installed. please check your shell profile path."
    nvm install --lts
    echo "[INFO] install latest node version. please install npm and yarn and, add 'nvm use nodeversion'"
  fi
fi

if ! type nodenv -a type git > /dev/null 2>&1; then
  echo "[INFO] install nodenv"
  git clone https://github.com/nodenv/nodenv.git ~/.nodenv
  mkdir -p ~/.nodenv/plugins
  git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
  git clone https://github.com/nodenv/node-build-update-defs.git ~/.nodenv/plugins/node-build-update-defs
  git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
  echo "[INFO] nodenv is installed. please install, nodejs and install plugin 'https://github.com/nodenv/nodenv-update.git'"
else
  echo "[INFO] skip install nodenv"
fi

# vim
echo "[INFO] Create symlink for vim"
ln -nfs ~/dotfiles/.vimrc ~/.vimrc
ln -nfs ~/dotfiles/.vim ~/.vim
# nvim
mkdir -p ~/.config/
ln -nfs ~/dotfiles/.config/nvim ~/.config/nvim
curl -fLo ~/.local/share/nvim/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim


echo "[INFO] Create vim symlinks finished"

#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

echo "[INFO] Install go"
brew install git svn lazygit tree nvim vim ripgrep zsh git-delta
echo "[INFO] Finished"


echo "[INFO] Install go tools"
go get golang.org/x/tools/cmd/goimports
echo "[INFO] Finished"

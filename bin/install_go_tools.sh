#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

echo "[INFO] Install go"
brew install git svn lazygit tree nvim vim ripgrep zsh git-delta
echo "[INFO] Finished"


echo "[INFO] Install go tools"
go get golang.org/x/tools/cmd/goimports
go get golang.org/x/tools/cmd/godoc
go get golang.org/x/lint/golint
go get github.com/motemen/gore/cmd/gore
go get github.com/mdempsky/gocode
go get github.com/k0kubun/pp
echo "[INFO] Finished"

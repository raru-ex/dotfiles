#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

echo "[INFO] Install go"
brew install git svn lazygit tree nvim vim ripgrep zsh git-delta
echo "[INFO] Finished"


echo "[INFO] Install go tools"
go install golang.org/x/tools/cmd/goimports
go install golang.org/x/tools/cmd/godoc
go install golang.org/x/lint/golint
go install github.com/motemen/gore/cmd/gore
go install github.com/mdempsky/gocode
go install github.com/k0kubun/pp
go install github.com/cweill/gotests/...
echo "[INFO] Finished"

## gotestはシンボリックリンクを辿れないのでコピー
mkdir -p ~/.config/go/templates
cp -r  ~/dotfiles/.config/go/templates/* ~/.config/go/templates/

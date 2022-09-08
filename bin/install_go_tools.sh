#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

echo "[INFO] Install go"
brew install git svn lazygit tree nvim vim ripgrep zsh git-delta
echo "[INFO] Finished"


echo "[INFO] Install go tools"
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/lint/golint@latest
go install github.com/motemen/gore/cmd/gore@latest
go install github.com/mdempsky/gocode@latest
go install github.com/k0kubun/pp@latest
go install github.com/cweill/gotests/...
go install github.com/110y/go-expr-completion@latest
echo "[INFO] Finished"

## gotestはシンボリックリンクを辿れないのでコピー
mkdir -p ~/.config/go/templates
cp -r  ~/dotfiles/.config/go/templates/* ~/.config/go/templates/

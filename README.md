# dotfiles

## Overview

自分用dotfiles  
vim設定とzsh設定  

## Description

vim, nvimで設定  
zshはシンプルにしている  

## Requirement

homebrew  
Vim or NeoVim  
Git  
Svn  

## install for mac

$ brew install vim --with-lua  
$ brew install nvim  

## Install

bin以下にインストール用のシェルを配置してあるため任意に利用  
推奨順番  

1. install_brew_items.sh
1. install_fonts.sh
1. install_vim.sh
1. install_zsh.sh
1. install_tmux.sh
1. install_install_lsps.sh

## CocList

- coc-tsserver
- coc-tslint
- coc-html
- coc-css
- coc-json
- coc-angular
- coc-vetur

## Author

raru  

## tips

### scalaの定義参照がうまくいかない場合

vim-metalsに不正なキャッシュが溜まっているケースがある。  
.metalsフォルダ以下を削除し、再度読み込み直すと動く  

### vim起動時にエラーが起きる場合

以下はrubyでエラーが発生していた例。  
brewのlinkを貼り直すと動いた  
$ brew unlink ruby  
$ brew install ruby  


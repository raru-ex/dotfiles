# dotfiles

## Overview
自分用dotfiles  
主に簡易利用のためのvim設定とzsh設定  

## Description
vim, nvimどちらでも使えるように設定している  
vim利用時は neocomplete を利用するようになっているため lua付きでインストール  
zshはシンプルにしている  

## Requirement
homebrew  
Vim with lua or NeoVim   
Git  
Svn  

##  install for mac
$ brew install vim --with-lua  
$ brew install nvim  
$ pip3 install --upgrade neovim  
$ pip3 install sexpdata websocket-client pynvim # for ensime  

// nvimでは:UpdateRemotePluginsを初期化時や再設定時に実行  

## Install 
bin以下にインストール用のシェルを配置してあるため任意に利用  
※ 中身は単純なシンボリックリンク  

## Author
raru  

## tips

### vim起動時にエラーが起きる場合
以下はrubyでエラーが発生していた例。  
brewのlinkを貼り直すと動いた  
$ brew unlink ruby  
$ brew install ruby  

### UpdateRemotePluginsエラー時
pip3 upgrade後にエラーが発生した場合  
以下のようにキャッシュを無視してインストールすると治る(場合がある)  
$ pip3 --no-cache-dir install -I {libs}  



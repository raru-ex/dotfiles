# dotfiles

## Overview
自分用dotfiles  
主に簡易利用のためのvim設定とzsh設定  

## Description
vim, nvimどちらでも使えるように設定している  
vim利用時は neocomplete を利用するようになっているため lua付きでインストール  
zshはframeworkは利用してない (はず)

## Requirement
homebrew  
Vim with lua or NeoVim   
Git  
Svn  

##  install for mac
$ brew install vim --with-lua  
$ brew install nvim  
$ pip3 install --upgrade neovim  

### vim起動時にエラーが起きる場合
$ brew unlink ruby  
$ brew install ruby  

## Install 
bin以下にインストール用のシェルを配置してあるため任意に利用  
※ 中身は単純なシンボリックリンク  

## Author
raru  

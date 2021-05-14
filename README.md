# dotfiles

## Overview

自分用dotfiles  
vim設定とzsh設定  

## Description

よく使うツールをまとめて入れてるdotfiles。  
キーボードやiterm、karabinerの設定も入ってる。  
vim, nvimで設定  

## Requirement

homebrew  
Node  
Yarn  

## Install

### Mac OS

```sh
$ ./bin/setup_for_mac.sh
```

## CocList

- coc-tsserver
- coc-tslint
- coc-html
- coc-css
- coc-json
- coc-go
- coc-angular
- coc-metals (scala)
- coc-python
- coc-yaml
- coc-solargraph (ruby)
  - required: gem install solargraph
- coc-word (english dictionaly)

## Note

User用のglobalなgitignoreは `configs/git/ignores/` 以下のファイルを編集することで自動的に `~/.config/git/ignore` を更新するようになっている。

## Problem

- install shellでinstallするときにecho >> zshrcしているので、設定が重複しちゃう

## Author

raru  

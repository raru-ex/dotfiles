# dotfiles

## Overview

自分用dotfiles  
vim設定とzsh設定  

## Description

よく使うツールをまとめて入れてるdotfiles。  
キーボードやiterm、karabinerの設定も入ってる。  
vim, nvimどっちも動くけどメインはnvimに移行

## Requirement

homebrew  
Node  
Yarn  

## Install

### Mac OS

```sh
$ ./bin/setup_for_mac.sh
```

## Note

User用のglobalなgitignoreは `configs/git/ignores/` 以下のファイルを編集することで自動的に `~/.config/git/ignore` を更新するようになっている。

## Problem

- install shellでinstallするときにecho >> zshrcしているので、設定が重複しちゃう。2回目以降もいい感じにしたい

## Author

raru  

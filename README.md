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
Vim or NeoVim  
Git  
Svn  
Node  
Yarn  

## install for mac

$ brew install vim  
$ brew install nvim  
$ go get github.com/mattn/efm-langserver

## Install

```sh
$ ./bin/setup_for_mac.sh
```

## CocList

- coc-tsserver
- coc-tslint
- coc-html
- coc-css
- coc-json
- coc-angular
- coc-metals
- coc-python
- coc-yaml

## PlantUML

参照: https://github.com/skanehira/preview-uml.vim

```
// shell
$ docker run -d -p 2525:8080 plantuml/plantuml-server:jetty

// vim
let g:preview_uml_url='http://localhost:2525'
:PreviewUML
```

## Author

raru  

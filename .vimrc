" nvim, vimそれぞれで利用する設定
runtime! vimrcs/common-settings.vim
runtime! vimrcs/default-functions-keymap.vim

runtime! vimrcs/vim-settings.vim

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

"プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
" tomlファイル置き場
let s:dein_toml_dir = s:dein_dir . '/toml'
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
 if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
 endif
 " Required:
 execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein settings
if dein#load_state(s:dein_dir)
  " Required:
  call dein#begin(s:dein_dir)

  " Load toml
  let s:common_toml      = s:dein_toml_dir . '/common.toml'
  let s:common_lazy_toml = s:dein_toml_dir . '/common_lazy.toml'

  let s:vim_toml         = s:dein_toml_dir . '/vim.toml'
  let s:vim_lazy_toml    = s:dein_toml_dir . '/vim_lazy.toml'


  " 共通ライブラリ
  call dein#load_toml(s:common_toml, {'lazy': 0})

  " toml側でif処理をするのが面倒なのでこちら側で処理
  call dein#load_toml(s:vim_toml,       {'lazy': 0})
  call dein#load_toml(s:vim_lazy_toml,  {'lazy': 1})

  call dein#load_toml(s:common_lazy_toml, {'lazy': 1})

  " finalize
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

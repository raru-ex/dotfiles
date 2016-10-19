" マウス選択時visualモードを解除
set mouse=
set modifiable
set write
" 行を強調表示
set cursorline
" TABキーを押した際にタブ文字の代わりにスペースを入れる
set expandtab
set tabstop=4
set shiftwidth=4
" autoindentを解除
" set noautoindent

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.config/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" ---------- add modules ----------
" Unite
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
" NERDTree
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('Xuyuanp/nerdtree-git-plugin')
" vimで差分(+, -)を左側に表示
call dein#add('airblade/vim-gitgutter')
" customize bar
call dein#add('vim-airline/vim-airline')
" color to atom
call dein#add('joshdick/onedark.vim')
" space
call dein#add('bronson/vim-trailing-whitespace')
" scala
call dein#add('derekwyatt/vim-scala')
" 補完
call dein#add('Shougo/neocomplete.vim')
" コメント補完
call dein#add('tomtom/tcomment_vim')
" php
call dein#add('violetyk/neocomplete-php.vim')
call dein#add('thinca/vim-ref')



" ---------- add settings ----------
"  Unite.vim setting
runtime! vimrcs/unite.vim
runtime! vimrcs/nerdtree.vim
runtime! vimrcs/onedark.vim
runtime! vimrcs/filetype.vim
runtime! vimrcs/neocomplete.vim
runtime! vimrcs/neocomplete-php.vim

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable


" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

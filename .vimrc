set mouse=
set modifiable
set write

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/raru/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/raru/.vim/dein')

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
call dein#add('airblade/vim-gitgutter')
" customize bar
call dein#add('vim-airline/vim-airline')
" color to atom
call dein#add('joshdick/onedark.vim')


" ---------- add settings ----------
"  Unite.vim setting
runtime! vimrcs/unite.vim
runtime! vimrcs/nerdtree.vim
runtime! vimrcs/onedark.vim

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

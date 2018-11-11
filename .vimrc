" nvim, vimそれぞれで利用する設定
runtime! vimrcs/common-settings.vim

if has('nvim')
  runtime! vimrcs/nvim-settings.vim
else
  runtime! vimrcs/vim-settings.vim
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

"プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
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

" Required:
call dein#begin('~/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" ---------- add modules ----------
" Unite
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/denite.nvim')
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
call dein#add('tomtom/tcomment_vim')
" typescript
call dein#add('pangloss/vim-javascript')
call dein#add('othree/yajs')
call dein#add('HerringtonDarkholme/yats.vim')
call dein#add('othree/es.next.syntax.vim')
call dein#add('othree/javascript-libraries-syntax.vim')
" pug
call dein#add('digitaltoad/vim-pug')

" ---------- loac settings ----------
runtime! vimrcs/default-functions-keymap.vim
if has('python3')
  runtime! vimrcs/denite.vim
else
  runtime! vimrcs/unite.vim
endif
runtime! vimrcs/nerdtree.vim
runtime! vimrcs/onedark.vim
if has('nvim')
  runtime! vimrcs/deoplete.vim
else
  runtime! vimrcs/neocomplete.vim
endif
runtime! vimrcs/php.vim
runtime! vimrcs/scala.vim
runtime! vimrcs/ruby.vim
runtime! vimrcs/ctags.vim
runtime! vimrcs/typescript.vim
runtime! vimrcs/html-css.vim

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

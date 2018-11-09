" autocmdによる重複読み込み防止用グループ
augroup MyVimrc
  autocmd!
augroup END

" filetypeを明示的に有効化
filetype on

" ========== vim basic settings ==========
" 文字コードセット
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
" 記号等の表示が崩れるものに対応
set ambiwidth=double

" マウス選択時visualモードを解除
set mouse=
" nerdtree上で入力を受け付けるように変更
set modifiable
set write
" 行番号を表示
set number
" 行を強調表示
set cursorline
" TABキーを押した際にタブ文字の代わりにスペースを入れる
set expandtab
set tabstop=2
set shiftwidth=2
" autoindentを解除
" set noautoindent
" 検索結果をハイライト
set hlsearch
" インクリメントサーチ有効
set incsearch


" onedark読み込み前にsyntaxを有効にする
syntax on

" backspaceが効かないのへ対応
set backspace=indent,eol,start

" ファイルを右側で開く
set splitright

" paste時にインデントが崩れないよう設定
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
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
runtime! vimrcs/unite.vim
runtime! vimrcs/nerdtree.vim
runtime! vimrcs/onedark.vim
runtime! vimrcs/neocomplete.vim
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
" syntax enable


" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" 文字コードセット
set encoding=utf-8
" マルチコードに対応
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" autocmdによる重複読み込み防止用グループ
augroup MyVimrc
  autocmd!
augroup END

" filetypeを明示的に有効化
filetype on

" ========== vim basic settings ==========
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
" 折り畳みが嫌いなので無効化
set nofoldenable

" backspaceが効かないのへ対応
set backspace=indent,eol,start

" ファイルを右側で開く
set splitright

" 検索時に小文字入力では大小区別しない
" 大文字入力時には区別する
set ignorecase
set smartcase

syntax on
colorscheme darcula
" vimではこれがあるとcolorが死ぬ
if has('nvim')
  set termguicolors
endif

" yankをクリップボードに
if has('nvim')
  set clipboard=unnamed
endif

" paste時にインデントが崩れないよう設定
" 参照: https://qiita.com/ryoff/items/ad34584e41425362453e
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif

" sqlファイルでC-cがomnifuncとバッティングしているようなのでsqlは外す
" そもそもC-cで戻るのはよくない by Shougoさん
let g:ftplugin_sql_omni_key = '<C-space>'

" fzf
set rtp+=~/.fzf

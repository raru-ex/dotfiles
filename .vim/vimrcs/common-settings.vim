" 文字コードセット
set guifont=JetBrainsMono\ Nerd\ Font
" フォルダアイコンを表示
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

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
runtime! vimrcs/filetypes.vim

" ========== vim basic settings ==========
" 記号等の表示が崩れるものに対応(有効にした方がむしろ崩れるので無効化)
" set ambiwidth=double

" マウス選択時visualモードを解除
set mouse=
" nerdtree上で入力を受け付けるように変更
set modifiable
set write
" 行番号を表示
set number
" 行を強調表示
set cursorline
" 列を強調表示: でっかい画面を使うと死ぬほど重いので削除
" set cursorcolumn
" TABキーを押した際にタブ文字の代わりにスペースを入れる
set expandtab
set tabstop=2
set shiftwidth=2
" mute beep sound
set visualbell
set t_vb=

let mapleader = "\<Space>"

" スクロールするときに余力を残す
augroup MyVimrc
  autocmd BufRead,BufNewFile,WinEnter * execute "setlocal scrolloff=" . str2nr(string(floor((line('w$') - line('w0')) * 0.20)))
augroup End

" fileごとのindent設定
augroup MyVimrc
  autocmd BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4

  autocmd BufRead,BufNewFile *.md  setlocal noexpandtab
  autocmd BufRead,BufNewFile *.mdk setlocal noexpandtab

  autocmd BufRead,BufNewFile *.go setlocal expandtab!
  autocmd BufRead,BufNewFile *.go setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup End

" Windows Subsystem for Linux で、ヤンクでクリップボードにコピー
if system('uname -a | grep Microsoft') != ''
  augroup MyVimrc
  autocmd!
  autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
endif

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

" tabを可視化。他については煩わしいので設定しない
" tab普通に見づらいので消す
" set list
" set listchars=tab:»-

" swapファイルの出力先を変更
set directory=~/.vim/swap

" ビープ音などを消す
set vb t_vb=

" xはヤンクしない
vnoremap x "_x
nnoremap x "_x

syntax on

" colorscheme darcula256
" vimではこれがあるとcolorが死ぬ
if has('nvim')
  " onedark on tmuxだとこれを設定しない方が正しい色になる
  " set termguicolors
endif

" yankをクリップボードに
set clipboard=unnamed

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

" 検索のハイライトを解除
nnoremap <Esc><Esc> :noh<CR>

" 引用: https://qiita.com/kasei-san/items/3a10002b2c60046d8572
" c-gで対応可能だがrgに紐づけているためこちらで
command! CopyRelativePath
 \ let @*=join(remove( split( expand( '%:p' ), "/" ), len( split( getcwd(), "/" ) ), -1 ), "/") | echo "copied"


" gitignoreを分割したものを一つにまとめる自動処理
autocmd MyVimrc BufWritePre *.ignore_partial :!sh ~/dotfiles/bin/build_global_gitignore.sh

" fzf
set rtp+=~/.fzf

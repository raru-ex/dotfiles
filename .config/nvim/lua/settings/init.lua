vim.g.mapleader = ' '
vim.cmd('filetype on')
vim.cmd([[
  augroup my_common
    autocmd!
  augroup END
]])

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.guifont = 'JetBrainsMono Nerd Font'
vim.o.guicursor = 'n-v-c:block,i:ver1'
-- マルチコードに対応
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'utf-8'

--vim.cmd('set mouse=')
vim.o.mouse = ''
-- nerdtree上で入力を受け付けるように変更
vim.o.modifiable = true
vim.o.write = true
-- 行番号を表示
vim.o.number = true
-- 行を強調表示
vim.o.cursorline = true
-- TABキーを押した際にタブ文字の代わりにスペースを入れる
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
-- mute beep sound
vim.o.visualbell = true
vim.o.belloff = 'all'
-- 検索結果をハイライト
vim.o.hlsearch = true
-- インクリメントサーチ有効
vim.o.incsearch = true
-- 折り畳みが嫌いなので無効化
vim.o.foldenable = false
-- backspaceが効かないのへ対応
vim.o.backspace = 'indent,eol,start'

-- ファイルを右側で開く
vim.o.splitright = true

-- 検索時に小文字入力では大小区別しない
-- 大文字入力時には区別する
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.swapfile = false
-- ビープ音を消す
vim.o.visualbell = false
-- yankをクリップボードに
vim.o.clipboard = 'unnamedplus'

-- hoverの判定にかかる時間を制御
vim.opt.updatetime = 400

vim.keymap.set('v', 'x', [["_x]], { noremap = true})
vim.keymap.set('n', 'x', [["_x]], { noremap = true})
-- 検索のハイライトを解除
vim.keymap.set('n', '<Esc><Esc>', [[:noh<CR>]], { noremap = true })

vim.cmd([[command! CopyRelativePath
 \ let @*=join(remove( split( expand( '%:p' ), "/" ), len( split( getcwd(), "/" ) ), -1 ), "/") | echo "copied"]])

-- ubuntusなどでecsしたときに半角入力に切り替える
vim.cmd([[
if executable('fcitx5')
   autocmd InsertLeave * :call system('fcitx5-remote -c')
   autocmd CmdlineLeave * :call system('fcitx5-remote -c')
endif
]])


vim.cmd([[
  augroup my_common
    autocmd BufRead,BufNewFile,WinEnter * execute "setlocal scrolloff=" . str2nr(string(floor((line('w$') - line('w0')) * 0.20)))

    autocmd BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4

    autocmd BufRead,BufNewFile *.md  setlocal noexpandtab
    autocmd BufRead,BufNewFile *.mdk setlocal noexpandtab

    autocmd BufRead,BufNewFile *.go setlocal expandtab!
    autocmd BufRead,BufNewFile *.go setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " gitignoreを分割したものを一つにまとめる自動処理
    autocmd BufWritePre *.ignore_partial :!sh ~/dotfiles/bin/build_global_gitignore.sh
  augroup End
]])


-- runtime! vimrcs/go.vim

require('settings.tab')

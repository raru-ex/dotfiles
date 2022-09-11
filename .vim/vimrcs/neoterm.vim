" :Tnew の場合に挿入モードで開始する
let g:neoterm_autoinsert = 1

" :T {cmd} 実行時に画面スクロールをする
let g:neoterm_autoscroll = 1

" 縦分割する
" let g:neoterm_default_mod='vertical'
" 横分割する
let g:neoterm_default_mod='belowright'
" 起動するwindowのサイズを指定
let g:neoterm_size=20

tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>l <C-\><C-n><C-w>l

augroup MyVimrc
  autocmd!
  autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
augroup End

" :Tnew 実行
nnoremap <silent> <C-t><C-t> :Ttoggle<CR>
" :Tnew 実行(縦分割) power lineが壊れるので使わない
" nnoremap <silent> <C-t><C-s> :vertical Tnew<CR>
" 非ビジュアルモード
nnoremap <silent> <C-t><C-p> :TREPLSendLine<CR>
" ビジュアルモード
vnoremap <silent> <C-t><C-v> V:TREPLSendSelection<CR>
" ファイル送信
nnoremap <silent> <C-t><C-f> :TREPLSendFile<CR>

" :Tnew の場合に挿入モードで開始する
" let g:neoterm_autoinsert = 1

" :T {cmd} 実行時に画面スクロールをする
let g:neoterm_autoscroll = 1

" 縦分割する
" let g:neoterm_default_mod='vertical'
" 横分割する
let g:neoterm_default_mod='belowright'

" :Tnew 実行
nnoremap <silent> <C-t><C-t> :Ttoggle<CR>
" :Tnew 実行(縦分割)
nnoremap <silent> <C-t><C-s> :vertical Tnew<CR>
" 非ビジュアルモード
nnoremap <silent> <C-t><C-e> :TREPLSendLine<CR>
" ビジュアルモード
vnoremap <silent> <C-t><C-e> V:TREPLSendSelection<CR>
" ファイル送信
nnoremap <silent> <C-t><C-f> :TREPLSendFile<CR>

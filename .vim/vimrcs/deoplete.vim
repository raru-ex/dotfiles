" コメント補完
let g:deoplete#enable_at_startup = 1
" 3文字目から補完開始
let g:deoplete#auto_completion_start_length = 3
" popupまでの補完ディレイ(ms)
let g:deoplete#auto_complete_delay = 10
" 大文字小文字は区別しない
let g:deoplete#enable_smart_case = 1
" 候補をtabで選択
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" shift-tabで逆順選択
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" IDE風にでオムニ補完
inoremap <C-space> <C-x><C-o>


" Enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

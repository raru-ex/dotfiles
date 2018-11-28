autocmd MyVimrc BufRead,BufNewFile *.md  set filetype=markdown

" ソースの自動折り畳みを停止
let g:vim_markdown_folding_disabled = 1
" プレビューの自動反映
let g:previm_enable_realtime = 1
" texは使わないので数式は無効
let g:vim_markdown_math = 0

" previm, open-browserが存在する前提
" markdownをpreview
nnoremap <silent> <C-m><C-p> :PrevimOpen<CR>



" ソースの自動折り畳みを停止
let g:vim_markdown_folding_disabled = 1
" プレビューの自動反映
let g:previm_enable_realtime = 1
" texは使わないので数式は無効
let g:vim_markdown_math = 0


" 参照: https://kitagry.hatenablog.com/entry/2019/07/14/231725
function! Mdpdf() abort
  if expand('%:e') != 'md'
    return
  endif
  let l:command = 'mdpdf ' . expand('%:p') . ' --format=A3'
  call system(l:command)
  call system('open ' . expand('%:r') . '.pdf')
endfunction

command! Mdpdf call Mdpdf()

" previm, open-browserが存在する前提
" markdownをpreview
nnoremap <silent> <C-m><C-p> :PrevimOpen<CR>


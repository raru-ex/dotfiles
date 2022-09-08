let test#go#runner = 'gotest'
if has('nvim')
  let test#strategy = "neoterm"
else
  let test#strategy = "vimterminal"
endif

nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tv :TestVisit<CR>




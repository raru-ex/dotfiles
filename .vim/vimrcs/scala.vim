" scalaが拡張子のファイルはファイルタイプをscalaとして読みこむ
autocmd MyVimrc BufNewFile,BufRead *.scala setf scala
autocmd MyVimrc BufRead,BufNewFile *.sbt set filetype=scala

let g:lsc_enable_autocomplete = v:false
let g:lsc_server_commands = {
  \  'scala': {
  \    'command': 'metals-vim',
  \    'log_level': 'Log'
  \  }
  \}

" intellijみたいにしたかったが無理だった
" vimはctrl-shiftができない。
" nnoremap <M-Left> <C-o>
" nnoremap <M-Right> <C-i>
" nnoremap <silent><C-]> :EnDeclaration<CR>
" nnoremap <C-w><C-t> :EnType<CR>
" nnoremap <silent><C-w><C-]> :EnDeclarationSplit v<CR>
" nnoremap <silent><C-w><C-b> :EnDocBrowse<CR>
" nnoremap <C-w><C-s> :EnSearch 
" nnoremap <silent><C-w><C-u> :EnUsages<CR>
" nnoremap <silent><C-w><C-o> :EnOrganizeImports<CR>
" nnoremap <silent><C-w><C-n> :EnRename<CR>


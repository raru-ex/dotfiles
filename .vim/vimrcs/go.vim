augroup GoCmd
  autocmd!
  autocmd BufWritePost *.go :call GoFmt()
augroup End

function! GoFmt()
  call system('go fmt ' . expand('%'))
  edit!
endfunction


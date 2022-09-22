augroup GoCmd
  autocmd!
  autocmd BufWriteCmd *.go :call GoFmt()
augroup End

function! GoFmt()
  call system('go fmt ' . expand('%'))
  edit!
endfunction


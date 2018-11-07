function! EnableJavascript()
  " Setup used libraries
  let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter'
  let b:javascript_lib_use_jquery = 1
  let b:javascript_lib_use_angularjs = 1
  let b:javascript_lib_use_angularui = 1
  let b:javascript_lib_use_angularuirouter = 1
endfunction

function! EnableTypescriptHighlight()
  let g:yats_host_keyword = 1
endfunction

autocmd MyVimrc BufNewFile,BufRead *.{ts} set filetype=typescript
autocmd MyVimrc BufNewFile,BufRead *.{js} set filetype=javascript

autocmd MyVimrc FileType typescript,javascript call EnableJavascript()
autocmd MyVimrc FileType typescriptt call EnableTypescriptHighlight()


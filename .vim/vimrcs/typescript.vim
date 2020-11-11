" 参考: https://qiita.com/park-jh/items/b353319efb1823c36c05
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

autocmd MyVimrc FileType typescript,javascript call EnableJavascript()
autocmd MyVimrc FileType typescriptt call EnableTypescriptHighlight()


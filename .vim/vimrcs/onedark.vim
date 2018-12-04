" onedark読み込み前にsyntaxを有効にする
syntax on
" let g:onedark_termcolors=16
let g:onedark_termcolors=256
" vimではこれがあるとcolorが死ぬ
if has('nvim')
  set termguicolors
endif
" color schemeを有効化
colorscheme onedark

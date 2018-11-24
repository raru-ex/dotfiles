" scalaが拡張子のファイルはファイルタイプをscalaとして読みこむ
autocmd MyVimrc BufNewFile,BufRead *.scala setf scala
" ensimeを有効にする
autocmd MyVimrc BufWritePost *.scala silent :EnTypeCheck

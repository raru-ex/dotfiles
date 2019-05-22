" scalaが拡張子のファイルはファイルタイプをscalaとして読みこむ
autocmd MyVimrc BufNewFile,BufRead *.scala setf scala
autocmd MyVimrc BufRead,BufNewFile *.sbt set filetype=scala



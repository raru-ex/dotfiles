" scalaが拡張子のファイルはファイルタイプをscalaとして読みこむ
autocmd MyVimrc BufNewFile,BufRead *.scala        set filetype=scala
autocmd MyVimrc BufRead,BufNewFile *.sbt          set filetype=scala
autocmd MyVimrc BufRead,BufNewFile *.scala.html   set filetype=twirl
autocmd MyVimrc BufRead,BufNewFile *.conf         set filetype=conf
autocmd MyVimrc BufRead,BufNewFile *routes        set filetype=routes


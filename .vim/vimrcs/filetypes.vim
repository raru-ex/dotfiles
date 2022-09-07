" scalaが拡張子のファイルはファイルタイプをscalaとして読みこむ
autocmd MyVimrc BufRead,BufNewFile *.sbt          set filetype=scala
autocmd MyVimrc BufRead,BufNewFile *.scala.html   set filetype=twirl
autocmd MyVimrc BufRead,BufNewFile *.conf         set filetype=conf
autocmd MyVimrc BufRead,BufNewFile *routes        set filetype=routes


autocmd MyVimrc BufNewFile,BufRead *.uml          set filetype=uml
autocmd MyVimrc BufRead,BufNewFile *.uml          set filetype=uml
autocmd MyVimrc BufNewFile,BufRead *.pu           set filetype=uml

autocmd MyVimrc BufNewFile,BufRead *.slim         set filetype=slim

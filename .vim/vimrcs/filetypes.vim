" set filetypes
autocmd MyVimrc BufNewFile,BufRead *.{pug} set filetype=pug
autocmd MyVimrc BufRead,BufNewFile *.scss  set filetype=scss
autocmd MyVimrc BufNewFile,BufRead *.{ts}  set filetype=typescript
autocmd MyVimrc BufNewFile,BufRead *.{js}  set filetype=javascript

" scalaが拡張子のファイルはファイルタイプをscalaとして読みこむ
autocmd MyVimrc BufNewFile,BufRead *.scala        set filetype=scala
autocmd MyVimrc BufRead,BufNewFile *.sbt          set filetype=scala
autocmd MyVimrc BufRead,BufNewFile *.scala.html   set filetype=twirl
autocmd MyVimrc BufRead,BufNewFile *.conf         set filetype=conf
autocmd MyVimrc BufRead,BufNewFile *routes        set filetype=routes

autocmd MyVimrc BufRead,BufNewFile *.md   set filetype=markdown
autocmd MyVimrc BufNewFile,BufRead *.{ts} set filetype=typescript
autocmd MyVimrc BufNewFile,BufRead *.{js} set filetype=javascript

autocmd MyVimrc BufNewFile,BufRead *.uml         set filetype=uml
autocmd MyVimrc BufRead,BufNewFile *.uml         set filetype=uml
autocmd MyVimrc BufNewFile,BufRead *.pu          set filetype=uml

autocmd MyVimrc BufNewFile,BufRead *.rb,*.rbw        set filetype=ruby



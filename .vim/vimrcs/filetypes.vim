" set filetypes
autocmd MyVimrc BufNewFile,BufRead *.{pug}       setfiletype=pug
autocmd MyVimrc BufRead,BufNewFile *.scss        setfiletype=scss
autocmd MyVimrc BufRead,BufNewFile *.sass        setfiletype=sass
autocmd MyVimrc BufNewFile,BufRead *.{ts}        setfiletype=typescript
autocmd MyVimrc BufNewFile,BufRead *.{js}        setfiletype=javascript

" scalaが拡張子のファイルはファイルタイプをscalaとして読みこむ
autocmd MyVimrc BufNewFile,BufRead *.scala        setfiletype=scala
autocmd MyVimrc BufRead,BufNewFile *.sbt          setfiletype=scala
autocmd MyVimrc BufRead,BufNewFile *.scala.html   setfiletype=twirl
autocmd MyVimrc BufRead,BufNewFile *.conf         setfiletype=conf
autocmd MyVimrc BufRead,BufNewFile *routes        setfiletype=routes

autocmd MyVimrc BufRead,BufNewFile *.md           setfiletype=markdown
autocmd MyVimrc BufNewFile,BufRead *.{ts}         setfiletype=typescript
autocmd MyVimrc BufNewFile,BufRead *.{js}         setfiletype=javascript

autocmd MyVimrc BufNewFile,BufRead *.uml          setfiletype=uml
autocmd MyVimrc BufRead,BufNewFile *.uml          setfiletype=uml
autocmd MyVimrc BufNewFile,BufRead *.pu           setfiletype=uml

autocmd MyVimrc BufNewFile,BufRead *.rb,*.rbw     setfiletype=ruby
autocmd MyVimrc BufNewFile,BufRead *.slim         setfiletype=slim

autocmd MyVimrc BufNewFile,BufRead *.tsx         setfiletype=typescript.tsx
autocmd MyVimrc BufNewFile,BufRead *.jsx         setfiletype=javascript.jsx


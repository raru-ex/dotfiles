" scalaが拡張子のファイルはファイルタイプをscalaとして読みこむ
au BufNewFile,BufRead *.scala setf scala
" phpのファイルで辞書を読み込み
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionaries/php.dict filetype=php


" Denite.vim setting
nnoremap [denite]    <Nop>
nmap     <C-s> [denite]

" プロンプトの左端に表示される文字を指定
call denite#custom#option('default', 'prompt', '>')

" denite/insert モードのときは，C- で移動できるようにする
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')

" tabopen や vsplit のキーバインドを割り当て
call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')

" jj で denite/insert を抜けるようにする
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')

" customize ignore globs
call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy','matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [
      \ '.git/', 'build/', '__pycache__/',
      \ 'node_modules/',
      \ 'repos/',
      \ 'images/', '*.o', '*.make',
      \ '*.min.*',
      \ 'img/', 'fonts/'])

" バッファ一覧
nnoremap <silent> [denite]<C-b> :<C-u>Denite -direction=top buffer<CR>
" grep
nnoremap <silent> [denite]<C-g> :<C-u>Denite -direction=top grep -buffer-name=grep<CR>
" resume
nnoremap <silent> [denite]<C-r> :<C-u>Denite -direction=top -resume<CR>
" resumeした検索結果の次の行の結果へ飛ぶ
nnoremap <silent> [denite]<C-n> :<C-u>Denite -resume -select=+1 -immediately<CR>
" resumeした検索結果の前の行の結果へ飛ぶ
nnoremap <silent> [denite]<C-p> :<C-u>Denite -resume -select=-1 -immediately<CR>
" ファイル一覧
nnoremap <silent> [denite]<C-f> :<C-u>Denite -direction=top -buffer-name=file file<CR>
" 最近使ったファイルの一覧
nnoremap <silent> [denite]<C-h> :<C-u>Denite -direction=top file_old<CR>
" カレントディレクトリ
nnoremap <silent> [denite]<C-d> :<C-u>Denite -direction=top -buffer-name=current file_rec<CR>
" neomru
nnoremap <silent> [denite]<C-m> :<C-u>Denite -direction=top -buffer-name=mru file_mru<CR>


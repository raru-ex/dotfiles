nnoremap <silent><C-e> :NERDTreeToggle<CR>

" ブックマークを初期表示
let g:NERDTreeShowBookmarks=1
" 起動時にNERDTreeを起動
autocmd vimenter * NERDTree

" ディレクトリ記号変更
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

" 不可視ファイルを表示
" let NERDTreeShowHidden = 1

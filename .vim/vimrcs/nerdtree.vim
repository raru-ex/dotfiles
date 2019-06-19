
nnoremap [nerd]   <Nop>
nmap <Space>n [nerd]

" NERDTreeTabsを利用するように変更
nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>

" ブックマークを初期表示
let g:NERDTreeShowBookmarks=1

" 起動時にNERDTreeを起動
" autocmd MyVimrc vimenter * NERDTree

" ディレクトリ記号変更
let g:NERDTreeDirArrows = 1

" 縦分割でファイルを開くのをsからv(vertical)に
let g:NERDTreeMapOpenVSplit = 'v'

" 不可視ファイルを表示 (Shift+i)
let NERDTreeShowHidden = 0

" デフォルトでは開かないようにコメントアウト
" let g:nerdtree_tabs_open_on_console_startup=1

" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd MyVimrc bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


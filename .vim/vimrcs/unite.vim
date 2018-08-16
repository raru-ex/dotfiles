" Unite.vim setting
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]

let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 100

" file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

" 開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> [unite]d :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]g :<c-u>Unite grep<cr>
nnoremap <silent> [unite]a :<c-u>UniteBookmarkAdd<cr>

" Unite起動中のマッピング
autocmd FileType unite call s:unite_opened_settings()
function! s:unite_opened_settings()"{{{
    " Ctrl+cでunite終了
    nmap <buffer> <C-c> <Plug>(unite_exit)
    " Ctrl+iで横に分割で開く
    nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')
    inoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')
    " Ctrl+sで縦に分割して開く
    nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('vsplit')
    inoremap <silent> <buffer> <expr> <C-s> unite#do_action('vsplit')
    " Ctrl+oで横に分割して開く
    nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
    inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}


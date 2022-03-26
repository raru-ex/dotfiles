" よくわからないので一旦公式サイトのなんとなくわかるところだけコピー

let g:coc_global_extensions = [
			\'coc-tsserver',
			\'coc-eslint',
			\'coc-html',
  		\'coc-css',
  		\'coc-json',
  		\'coc-go',
  		\'coc-angular',
  		\'coc-metals',
  		\'coc-python',
  		\'coc-yaml',
  		\'coc-word',
  		\'coc-tailwindcss',
			\]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <Nul> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" coc用の定義
nnoremap [coc]   <Nop>
nmap <Space>g [coc]

" Remap keys for gotos
" intellijに合わせて設定
nmap <silent> [coc]d <Plug>(coc-definition)
nmap <silent> [coc]t <Plug>(coc-type-definition)
nmap <silent> [coc]i <Plug>(coc-implementation)
nmap <silent> [coc]r <Plug>(coc-references)
nmap <silent> [coc]n <Plug>(coc-rename)

" Remap for do action format
nnoremap <silent> [coc]f :call CocAction('format')<CR>

" scalaでは動かない: https://github.com/neoclide/coc-prettier#remap-keys-for-range-format-in-your-initvim-or-vimrc
vmap gf  <Plug>(coc-format-selected)
nmap gf  <Plug>(coc-format-selected)

nnoremap <silent> [coc]l :<C-u>call CocActionAsync('codeLensAction')<CR>

" Remap for do codeAction of current line
" nmap <space>ac <Plug>(coc-codeaction)

" Show all diagnostics(error)
nnoremap <silent> [coc]e  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> [coc]o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> [coc]s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> [coc]j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> [coc]k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> [coc]p  :<C-u>CocListResume<CR>

nnoremap <silent> [coc]h  :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" sbtの再読み込み (coc-metalsにしたので動かない)
" function! SbtReload()
"   call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'build-import' })
" endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Notify coc.nvim that <enter> has been pressed.
" " Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

hi CocHighlightText term=reverse ctermbg=239 guibg=#4e4e4e

" scalaファイルの場合にはbuild.sbtがある場所をroot directoryとして認識させる
autocmd FileType scala let b:coc_root_patterns = ['build.sbt']


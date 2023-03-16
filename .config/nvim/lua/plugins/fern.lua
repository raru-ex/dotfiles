vim.cmd([[
  augroup MyGlyphPalette
    autocmd! *
    autocmd  FileType fern call glyph_palette#apply()
  augroup END
]])

vim.api.nvim_set_var('fern#disable_default_mappings', 1) 
vim.api.nvim_set_var('fern#default_hidden', 1) 
vim.api.nvim_set_var('fern#renderer', 'nerdfont')
vim.api.nvim_set_var('fern#renderer#nerdfont#indent_markers', 1)

vim.cmd([[
let hide_dirs  = '^\%(\.git\|node_modules\|dist\)$'
let hide_files = '\%(\.DS_Store\)\+'

let g:fern#default_exclude = hide_dirs . '\|' . hide_files
]])

vim.keymap.set('n', '<Leader>nf', ':Fern . -drawer -reveal=%<CR>',{ noremap = true, silent = true })
vim.keymap.set('n', '<Leader>fo', ':Fern .<CR>',{ noremap = true, silent = true })
vim.keymap.set('n', '<C-e>', ':Fern . -toggle -drawer<CR>',{ noremap = true, silent = true })

vim.cmd([[
  function! s:init_fern() abort
    set modifiable
    nmap <buffer><silent><expr>
      \ <Plug>(fern-my-open-or-expand-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )
    nmap <buffer> <cr> <Plug>(fern-my-open-or-expand-collapse)
    nmap <buffer> c <Plug>(fern-action-new-path=)
    nmap <buffer> m <Plug>(fern-action-rename:bottom)
    nmap <buffer> d <Plug>(fern-action-trash=)
  
    nmap <buffer> i <Plug>(fern-action-open:split)
    nmap <buffer> v <Plug>(fern-action-open:vsplit)
    nmap <buffer> r <Plug>(fern-action-reload)
  
    nmap <buffer> q :<C-u>quit<CR>
  endfunction

  augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
  augroup END
]])

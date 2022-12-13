
function nerdtree_find_and_highlight()
  vim.cmd([[
    NERDTreeFind
    :setlocal isk+=.
    normal! 0w
    exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
    :setlocal isk-=.
  ]])
end

function nerdtree_highlight()
  nerdtree_find_and_highlight()
  vim.api.nvim_command('wincmd p')
end

vim.keymap.set('n', '<Leader>nf', [[<cmd>lua nerdtree_find_and_highlight()<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>nh', [[<cmd>lua nerdtree_highlight()<CR>]], { noremap = true, silent = true })

-- ブックマークを初期表示
vim.api.nvim_set_var('NERDTreeShowBookmarks', 1)

-- ディレクトリ記号変更
vim.api.nvim_set_var('NERDTreeDirArrows', 1)

-- 縦分割でファイルを開くのをsからv(vertical)に
vim.api.nvim_set_var('NERDTreeMapOpenVSplit', 1)

-- node moduleのloadが重すぎるのでignore
vim.api.nvim_set_var('NERDTreeIgnore', {'^node_modules$'})

-- 不可視ファイルを表示 (Shift+i)
vim.api.nvim_set_var('NERDTreeShowHidden', 0)

vim.cmd([[
  augroup MyNerd
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  augroup END
]])


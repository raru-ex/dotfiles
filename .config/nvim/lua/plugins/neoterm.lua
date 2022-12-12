-- :Tnew の場合に挿入モードで開始する
vim.api.nvim_set_var('neoterm_autoinsert', 1)

-- :T {cmd} 実行時に画面スクロールをする
vim.api.nvim_set_var('neoterm_autoscroll', 1)

-- 縦分割する
-- vim.api.nvim_set_var('neoterm_default_mod', 'vertical')
-- 横分割する
vim.api.nvim_set_var('neoterm_default_mod', 'belowright')

-- 起動するwindowのサイズを指定
vim.api.nvim_set_var('neoterm_size', 20)

-- cocなどのwindowもterminalで、動作がおかしくなるので消す
-- vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>h', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>j', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>k', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-w>l', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

vim.cmd([[
  augroup MyNeoTerm
    autocmd!
    autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
  augroup MyNeoTerm
]])

-- :Tnew 実行
vim.api.nvim_set_keymap('n', '<C-t><C-t>', ':Ttoggle<CR>', { noremap = true, silent = true })
-- :Tnew 実行(縦分割) power lineが壊れるので使わない
-- nnoremap <silent> <C-t><C-s> :vertical Tnew<CR>
-- 非ビジュアルモード
vim.api.nvim_set_keymap('n', '<C-t><C-p>', ':TREPLSendLine<CR>', { noremap = true, silent = true })
-- ビジュアルモード
vim.api.nvim_set_keymap('n', '<C-t><C-v>', ':TREPLSendSelection<CR>', { noremap = true, silent = true })
-- ファイル送信
vim.api.nvim_set_keymap('n', '<C-t><C-f>', ':TREPLSendFile<CR>', { noremap = true, silent = true })

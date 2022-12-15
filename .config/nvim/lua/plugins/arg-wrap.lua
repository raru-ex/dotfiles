vim.api.nvim_set_var('argwrap_tail_comma', 1)
vim.keymap.set('n', '<Leader>ar', [[:ArgWrap<CR>]], { noremap = true, silent = true })

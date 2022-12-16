vim.api.nvim_set_var('test#go#runner', 'gotest')

vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>', { noremap = true, silent = true })



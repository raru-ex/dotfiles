vim.api.nvim_set_var('test#go#runner', 'gotest')
vim.api.nvim_set_var('test#go#gotest#options', '-count=1')
vim.api.nvim_set_var('test#strategy', 'toggleterm')

vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>', { noremap = true, silent = true })



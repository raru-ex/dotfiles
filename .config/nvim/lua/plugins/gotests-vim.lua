-- https://github.com/Magaming/gotests-templates
vim.api.nvim_set_var('gotests_template_dir', vim.fn.expand('~/.config/go/templates/'))

vim.keymap.set('n', '<leader>tg', ':GoTests<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tag', ':GoTestsAll<CR>', { noremap = true, silent = true })


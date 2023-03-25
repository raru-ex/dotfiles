local ok, neotree = pcall(require, 'neo-tree')

if ok then
  neotree.setup({
    close_if_last_window = false,
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      mapping = {
        ["i"] = "open_split",
        ["v"] = "open_vsplit",
      },
    },
    filesystem = {
      window = {
        mappings = {
          ["I"] = "toggle_hidden",
        },
      },
    },
  })

  vim.keymap.set('n', '<Leader>fo', ':Neotree position=current<CR>',{ noremap = true, silent = true })
  vim.keymap.set('n', '<Leader>ff', ':Neotree reveal=true position=current<CR>',{ noremap = true, silent = true })
  vim.keymap.set('n', '<Leader>nf', ':Neotree reveal=true position=left<CR>',{ noremap = true, silent = true })
vim.keymap.set('n', '<C-e>', ':Neotree toggle=true position=left action=show<CR>',{ noremap = true, silent = true })

end

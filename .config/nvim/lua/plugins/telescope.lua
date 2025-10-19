local ok, builtin = pcall(require, 'telescope.builtin')

if ok then
  vim.keymap.set('n', '<C-p>', builtin.find_files, {})
  vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>so', builtin.oldfiles, {})
  vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
  vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
  vim.keymap.set('n', '<leader>ge', builtin.diagnostics, {})

  vim.keymap.set('n', '<Leader>gd', '<cmd>Telescope lsp_definitions<CR>')
  vim.keymap.set('n', '<Leader>gt', '<cmd>Telescope lsp_type_definitions<CR>')
  vim.keymap.set('n', '<Leader>gi', '<cmd>Telescope lsp_implementations<CR>')
  vim.keymap.set('n', '<Leader>gr', '<cmd>Telescope lsp_references<CR>')

  require('telescope').setup{
    defaults = {
      mappings = {
        i = {
          ['<esc>'] = 'close',
          ['<C-i>'] = 'file_split',
          ['<C-f>'] = 'preview_scrolling_down',
          ['<C-b>'] = 'preview_scrolling_up',
          ['<C-j>'] = 'move_selection_next',
          ['<C-k>'] = 'move_selection_previous',
        }
      },
      file_ignore_patterns = {
        '.*/node_modules/.*',
        '%.git/.*',
        '.git',
      },
    },
    pickers = {
      find_files = { hidden = false },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case'
      },
    },
  }

  require('telescope').load_extension('fzf')
end

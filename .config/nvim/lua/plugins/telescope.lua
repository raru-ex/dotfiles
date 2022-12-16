local ok, builtin = pcall(require, 'telescope.builtin')
if ok then
  vim.keymap.set('n', '<C-p>', builtin.find_files, {})
  vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
  vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
  vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})

  require('telescope').setup{
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = 'close',
          ["<C-i>"] = 'file_split',
          ["<C-f>"] = 'preview_scrolling_down',
          ["<C-b>"] = 'preview_scrolling_up',
          ["<C-j>"] = 'move_selection_next',
          ["<C-k>"] = 'move_selection_previous',
        }
      }
    },
    pickers = {
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "ignore_case",
      },
    },
    buffer_previewer_maker = new_maker,
  }

  require('telescope').load_extension('fzf')
end

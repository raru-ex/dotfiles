local ok, snacks = pcall(require, 'snacks')

if not ok then
  return
end

snacks.setup({
  picker = {
    enabled = true,
    -- Window layout - 90% of screen (telescope-style horizontal layout)
    layouts = {
      default = {
        layout = {
          box = "horizontal",
          width = 0.9,
          height = 0.9,
          backdrop = false,
          border = "rounded",
          {
            box = "vertical",
            { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
            { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
          },
          { win = "preview", title = "{preview:Preview}", width = 0.5, border = "rounded", title_pos = "center" },
        },
      },
    },
    -- Matcher configuration (for non-live mode)
    matcher = {
      smartcase = true,  -- Enable smartcase matching (Telescope equivalent)
      frecency = true,   -- Enable frecency (frequency + recency) scoring for better file ranking
    },
    -- Source-specific configurations
    sources = {
      files = {
        exclude = {
          'node_modules/',
          '.git/',
        },
      },
      grep = {
        exclude = {
          'node_modules/',
          '.git/',
        },
      },
    },
    -- Performance optimization
    previewers = {
      git = { enabled = true },
    },
  },
})

-- Customize picker highlight groups
-- Make file paths and filenames use the same color (no distinction)
vim.api.nvim_set_hl(0, 'SnacksPickerDir', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'SnacksPickerFile', { link = 'Normal' })

-- File and content search (moved from telescope)
vim.keymap.set('n', '<C-p>', function() snacks.picker.files() end, { desc = 'Find files' })
vim.keymap.set('n', '<C-g>', function() snacks.picker.grep() end, { desc = 'Live grep' })

-- Buffer and other searches
vim.keymap.set('n', '<leader>sb', function() snacks.picker.buffers() end, { desc = 'Search buffers' })
vim.keymap.set('n', '<leader>so', function() snacks.picker.recent() end, { desc = 'Search old files' })
vim.keymap.set('n', '<leader>sh', function() snacks.picker.help() end, { desc = 'Search help tags' })

-- Git integration
vim.keymap.set('n', '<leader>gs', function() snacks.picker.git_status() end, { desc = 'Git status' })
vim.keymap.set('n', '<leader>gc', function() snacks.picker.git_log() end, { desc = 'Git commits' })

-- LSP integration (moved from telescope)
vim.keymap.set('n', '<Leader>gd', function() snacks.picker.lsp_definitions() end, { desc = 'LSP definitions' })
vim.keymap.set('n', '<Leader>gt', function() snacks.picker.lsp_type_definitions() end, { desc = 'LSP type definitions' })
vim.keymap.set('n', '<Leader>gi', function() snacks.picker.lsp_implementations() end, { desc = 'LSP implementations' })
vim.keymap.set('n', '<Leader>gr', function() snacks.picker.lsp_references({ auto_confirm = false }) end, { desc = 'LSP references' })
vim.keymap.set('n', '<leader>ge', function() snacks.picker.diagnostics({ auto_confirm = false }) end, { desc = 'Diagnostics' })

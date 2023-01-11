local ok, nvimtree = pcall(require, 'nvim-tree')
if ok then
  vim.keymap.set('n', '<Leader>nf', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

  local gwidth = vim.o.columns
  local gheight = vim.o.lines
  local width = math.floor(gwidth  * 0.75)
  local height = math.floor(gheight * 0.75)


  nvimtree.setup({
    sort_by = 'case_sensitive',
    view = {
      adaptive_size = false,
      enable_git_status = true,
      enable_diagnostics = true,
      centralize_selection = true,
      hide_root_folder = false,
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      mappings = {
        custom_only = false,
        list = {
          -- user mappings go here
          { key = '<C-e>', action = 'close' },
          { key = '<Esc>', action = 'close' },
          { key = 'r', action = 'reload' },
          { key = 'v', action = 'vsplit' },
          { key = 'i', action = 'split' },
          { key = 'm', action = 'rename' },
          { key = 'c', action = 'copy' }
        },
      },
      float = {
        enable = false,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = width,
          height = height,
          row = (gheight - height) * 0.5,
          col = (gwidth - width) * 0.5,
        },
      },
    }
  })
end

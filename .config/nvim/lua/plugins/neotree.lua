local ok, neotree = pcall(require, 'neo-tree')

if ok then
  neotree.setup({
    close_if_last_window = false,
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mapping = {
        --  ["i"] = "open_split",
        --  ["v"] = "open_vsplit",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
      },
    },
    filesystem = {
      filtered_items = {
        hide_by_name = {
          "node_modules"
        },
        hide_by_pattern = {
          "*/.git",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db"
        },
        never_show_by_pattern = {
          ".null-ls_*",
        },
      },
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

  vim.cmd([[
    function! s:init_neotree() abort
      set modifiable
    endfunction
  
    augroup neotree-custom
      autocmd! *
      autocmd FileType neo-tree call s:init_neotree()
    augroup END
  ]])
end

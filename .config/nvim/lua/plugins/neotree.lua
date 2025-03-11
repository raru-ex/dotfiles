local ok, neotree = pcall(require, 'neo-tree')

if ok then
  neotree.setup({
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      auto_expand_width = true,
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
        visible = true,
        hide_hidden = true,
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
    event_handlers = {
      {
        event = "neo_tree_window_after_open",
        handler = function()
          vim.cmd("wincmd =")
        end
      },
      {
        event = "neo_tree_window_after_close",
        handler = function()
          vim.cmd("wincmd =")
        end
      }
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

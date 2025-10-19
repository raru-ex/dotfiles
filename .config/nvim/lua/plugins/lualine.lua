local ok, lualine = pcall(require, 'lualine')

if ok then
  local powerline = require'lualine.themes.powerline'

  -- Color for highlights
  local colors = {
    yellow = '#ECBE7B',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67'
  }

  
  lualine.setup({
    options = {
      icons_enabled = true,
      theme = powerline,
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {
        'branch', 
        {
          'diff', 
          colored = true,
          diff_color = {
            add = { fg = colors.green },
            modified = { fg = colors.yellow },
            removed = { fg = colors.red },
          }
        },
        'diagnostics',
      },
      lualine_c = {'filename'},
      lualine_x = {{'encoding', separator = '|'}, {'fileformat', separator = '|'}, {'filetype', separator = '|' } },
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  })

end

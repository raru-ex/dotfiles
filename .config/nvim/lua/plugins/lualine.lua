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
    options = { theme = powerline },
    sections = {
      lualine_c = { 'filename', {
        'lsp_progress',
        display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' }},
        colors = {
          percentage  = colors.cyan,
          title  = colors.cyan,
          message  = colors.cyan,
          lsp_client_name = colors.magenta,
          use = true,
        },
        separators = {
          component = ' ',
          progress = ' | ',
          message = { pre = '(', post = ')'},
          percentage = { pre = '', post = '%% ' },
          title = { pre = '', post = ': ' },
          lsp_client_name = { pre = '[', post = ']' },
          message = { commenced = 'In Progress', completed = 'Completed' },
        },
        display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' } },
        timer = { progress_enddelay = 500, lsp_client_name_enddelay = 1000 },
      }},
    },
  })

end

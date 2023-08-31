local Module = {}
local fmt = string.format

function Module.setup(name)
  return function()
    vim.cmd(fmt([[
      augroup my_scheme
      autocmd VimEnter * nested colorscheme %s
      augroup End
    ]], name))
  end
end

return Module

local Module = {}
local fmt = string.format

function Module.setup(name)
  vim.cmd(fmt([[
  augroup my_scheme
  autocmd VimEnter * nested colorscheme %s
  augroup End
  ]], name))
	require(fmt("plugins.%s", name))
end

return Module

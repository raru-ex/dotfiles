-- 参考: https://wed.dev/blog/posts/neovim-config

local Module = {}
local fmt = string.format

function Module.load(name)
  return function()
	  require(fmt("plugins.%s", name))
  end
end

return Module

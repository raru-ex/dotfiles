-- 参考: https://wed.dev/blog/posts/neovim-config

local Module = {}
local fmt = string.format

function Module.load(name)
	require(fmt("plugins.%s", name))
end

return Module

local ok, indent = pcall(require, 'ibl')

vim.opt.list = true
vim.opt.termguicolors = true
-- vim.opt.listchars:append 'eol:↴'

if ok then
  indent.setup {
    scope = {
      show_start =false,
      show_end =false,
    }
  }
end

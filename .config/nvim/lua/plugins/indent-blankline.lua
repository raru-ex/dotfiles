local ok, indent = pcall(require, 'indent_blankline')

vim.opt.list = true
vim.opt.termguicolors = true
-- vim.opt.listchars:append 'eol:↴'

if ok then
  indent.setup {
    show_end_of_line = true,
  }
end

local ok, indent = pcall(require, 'ibl')

vim.opt.list = true
vim.opt.termguicolors = true
-- vim.opt.listchars:append 'eol:↴'

if ok then
  indent.setup {
    indent = {
      char = "│",
    },
    scope = {
      show_start =false,
      show_end =false,
    },
    whitespace = {
      remove_blankline_trail = false,
    },
    exclude = { filetypes = { "help", "dashboard", "neo-tree", "Trouble", "lazy", "mason" }},
  }
end

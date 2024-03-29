vim.api.nvim_set_var('indent_guides_enable_on_vim_startup', 1)
vim.api.nvim_set_var('indent_guides_exclude_filetypes', {'help', 'nerdtree'})

-- 自分で色を設定する場合には以下を設定
vim.api.nvim_set_var('indent_guides_auto_colors', 0)

-- 奇数インデントのカラー
-- autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#303030 ctermbg=236
vim.cmd([[
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=235
]])

-- 偶数インデントのカラー
-- autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3a3a3a ctermbg=237
vim.cmd([[
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#303030 ctermbg=236
]])

-- colorのヒントが欲しければ以下を入れるのもあり
-- https://github.com/guns/xterm-color-table.vim

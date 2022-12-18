
-- ソースの自動折り畳みを停止
vim.api.nvim_set_var('vim_markdown_folding_disabled', 1)
-- texは使わないので数式は無効
vim.api.nvim_set_var('vim_markdown_math', 0)


-- TODO: to lua
-- 参照: https://kitagry.hatenablog.com/entry/2019/07/14/231725
vim.cmd([[
function! Mdpdf() abort
  if expand('%:e') != 'md'
    return
  endif
  let l:command = 'mdpdf ' . expand('%:p') . ' --format=A3'
  call system(l:command)
  call system('open ' . expand('%:r') . '.pdf')
endfunction

command! Mdpdf call Mdpdf()
]])


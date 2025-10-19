-- =========== Tab表示系機能を設定 ==========

-- タブラインの表示関数
local function my_tabline()
  local s = ''
  local tabcount = vim.fn.tabpagenr('$')

  for i = 1, tabcount do
    local bufnrs = vim.fn.tabpagebuflist(i)
    local bufnr = bufnrs[vim.fn.tabpagewinnr(i)]
    local mod = vim.fn.getbufvar(bufnr, '&modified') == 1 and '!' or ' '
    local title = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':t')
    title = '[' .. title .. ']'

    s = s .. '%' .. i .. 'T'
    s = s .. '%#' .. (i == vim.fn.tabpagenr() and 'TabLineSel' or 'TabLine') .. '#'
    s = s .. i .. ':' .. title
    s = s .. mod
    s = s .. '%#TabLineFill# '
  end

  s = s .. '%#TabLineFill#%T%=%#TabLine#'
  return s
end

-- グローバル関数として登録（vim.o.tablineから参照するため）
_G.my_tabline = my_tabline

-- タブラインの設定
vim.o.tabline = '%!v:lua.my_tabline()'
vim.o.showtabline = 2  -- 常にタブラインを表示

-- タブ操作用のキーマッピング
-- t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n = 1, 9 do
  vim.keymap.set('n', 't' .. n, ':tabnext ' .. n .. '<CR>', { noremap = true, silent = true })
end

-- tc 新しいタブを一番右に作る
vim.keymap.set('n', 'tc', ':tablast <bar> tabnew<CR>', { noremap = true, silent = true })
-- tx タブを閉じる
vim.keymap.set('n', 'tx', ':tabclose<CR>', { noremap = true, silent = true })
-- tn 次のタブ
vim.keymap.set('n', 'tn', ':tabnext<CR>', { noremap = true, silent = true })
-- tp 前のタブ
vim.keymap.set('n', 'tp', ':tabprevious<CR>', { noremap = true, silent = true })

local ok, terminal = pcall(require, 'toggleterm')

if ok then

  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

  terminal.setup({
    direction = 'float',
    float_opts = {
      border = 'curved',
      width = math.floor(vim.o.columns * 0.9),
      height = math.floor(vim.o.lines * 0.9),
    },
  })

  -- ターミナルインスタンスをキャッシュ
  local float_term = nil
  local tab_term = nil

  -- floatingターミナルをトグル
  local function toggle_float_terminal()
    if not float_term then
      local Terminal = require('toggleterm.terminal').Terminal
      float_term = Terminal:new({
        count = 1,
        direction = 'float',
        hidden = true,
        float_opts = {
          border = 'curved',
          width = math.floor(vim.o.columns * 0.9),
          height = math.floor(vim.o.lines * 0.9),
        },
      })
    end
    float_term:toggle()
  end

  -- タブターミナルを開く/フォーカス
  local function open_tab_terminal()
    -- 既存のターミナルタブを探す
    for tabnr = 1, vim.fn.tabpagenr('$') do
      local buflist = vim.fn.tabpagebuflist(tabnr)
      for _, bufnr in ipairs(buflist) do
        local bufname = vim.fn.bufname(bufnr)
        -- toggleterm #2 のバッファを探す
        if bufname:match('toggleterm#2') then
          vim.cmd('tabn ' .. tabnr)
          return
        end
      end
    end

    -- 見つからなければ新規作成
    if not tab_term then
      local Terminal = require('toggleterm.terminal').Terminal
      tab_term = Terminal:new({
        count = 2,
        direction = 'tab',
        hidden = true,
      })
    end
    tab_term:open()
  end

  -- マッピング
  vim.keymap.set('n', '<C-t><C-t>', toggle_float_terminal, opts)
  vim.keymap.set('n', '<C-t><C-n>', open_tab_terminal, opts)

end

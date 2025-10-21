local ok, terminal = pcall(require, 'toggleterm')

if ok then
  local opts = { silent = true }

  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', function() vim.cmd.wincmd('h') end, opts)
  vim.keymap.set('t', '<C-j>', function() vim.cmd.wincmd('j') end, opts)
  vim.keymap.set('t', '<C-k>', function() vim.cmd.wincmd('k') end, opts)
  vim.keymap.set('t', '<C-l>', function() vim.cmd.wincmd('l') end, opts)

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
        on_open = function()
          vim.cmd('startinsert')
        end,
        on_close = function()
          vim.cmd('stopinsert')
        end,
      })
    end
    float_term:toggle()
  end

  -- マッピング
  vim.keymap.set({ 'n', 'i', 't' }, '<C-t><C-t>', toggle_float_terminal, opts)
end

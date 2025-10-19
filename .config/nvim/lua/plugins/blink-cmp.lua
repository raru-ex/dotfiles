local ok, blink = pcall(require, 'blink.cmp')

if ok then
  blink.setup({
    -- 補完ウィンドウの表示設定
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    -- ソースの設定
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },

    -- 補完の挙動設定
    completion = {
      menu = {
        draw = {
          columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = true,
      },
    },

    -- キーマッピング: nvim-cmpと同じ操作感を維持
    keymap = {
      preset = 'none',
      ['<Tab>'] = { 'accept', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Esc>'] = { 'hide', 'fallback' },

      -- スクロール
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    },
  })
end

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
      list = {
        selection = {
          preselect = false,    -- 自動的に最初の候補を選択しない (nvim-cmpのnoselectに相当)
          auto_insert = false   -- 選択時に自動的にテキストを挿入しない
        }
      },
      menu = {
        draw = {
          columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
        },
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
      ['<Esc>'] = {
        function(cmp)
          if cmp.is_visible() then
            cmp.cancel()
            -- nvim_feedkeysをnon-recursiveモードで使用して再帰的マッピングを回避
            vim.api.nvim_feedkeys(
              vim.api.nvim_replace_termcodes('<Esc>', true, false, true),
              'n',  -- 'n' = non-recursive (再帰的マッピングを適用しない)
              false
            )
            return true
          end
        end,
        'fallback'
      },

      -- スクロール
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    },
  })
end

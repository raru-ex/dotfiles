local ok_mason_lsp, mason_lspconfig = pcall(require, 'mason-lspconfig')
local ok_mason, mason = pcall(require, 'mason')
local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')
local ok_cmp, cmp = pcall(require, 'cmp')
local ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if ok_mason and ok_mason_lsp and ok_lspconfig and ok_cmp and ok_cmp_nvim_lsp then

  local function on_attach(client, bufnr)
    -- Reference highlight
    local cap = client.server_capabilities
    if cap.documentHighlightProvider then
      local augroup = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.clear_references()
          vim.lsp.buf.document_highlight()
        end,
      })
    end

    vim.keymap.set('n', '<Leader>gh', vim.lsp.buf.hover)
    vim.keymap.set('n', '<Leader>gf', function() vim.lsp.buf.format { async = true } end)
    vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', '<Leader>gn', vim.lsp.buf.rename)
    vim.keymap.set('n', '<Leader>ge', vim.diagnostic.open_float)
    vim.keymap.set('n', ']c', vim.diagnostic.goto_next)
    vim.keymap.set('n', '[c', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<Leader>ga', vim.lsp.buf.code_action)
    vim.keymap.set('n', '<Leader>gh', vim.lsp.buf.hover)
    -- Telescopeで呼び出す
    -- vim.keymap.set('n', '<Leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    -- vim.keymap.set('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    -- vim.keymap.set('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    -- vim.keymap.set('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
 
    -- LSP handlers
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
    )
  end


  mason.setup()
  mason_lspconfig.setup({
    ensure_installed = {
      'bashls', -- bash
      'cssls',  -- css
      'cssmodules_ls',  -- cssmodule
      'dockerls',  -- docker
      'golangci_lint_ls', -- golang lint
      'gopls',  -- go
      'html',  -- html
      'vtsls',  -- ts
      'lua_ls',  -- lua
      'marksman', -- markdown
      'taplo',  -- toml
      'vimls',  -- vimscript
      'yamlls',  -- yaml
      'sqlls',  -- sql
    },
    automatic_installation = true
  })
  mason_lspconfig.setup_handlers({
    function(server)
      local opt = {
        on_attach = on_attach,
        capabilities = cmp_nvim_lsp.default_capabilities()
      }

      if server == "lua_ls" then
        opt.settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
          }
        }
      end

      lspconfig[server].setup(opt)
    end
  })

  lspconfig.golangci_lint_ls.setup({

  })

  -- cmp
  cmp.setup({
    completion = {
      completeopt = 'menu,menuone,noselect',
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    },
    mapping = {
      ["<S-TAB>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<TAB>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- 現在表示されている候補の数を確認
          local entries = cmp.get_entries()
          if entries and #entries == 1 then
            -- 候補が1つだけの場合は確定
            cmp.confirm({ select = true })
          else
            -- それ以外は次の候補を選択
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          end
        else
          fallback()
        end
      end, { 'i', 's' }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-space>'] = cmp.mapping.complete({ behavior = cmp.SelectBehavior.Select }),
      -- 入力補助を止めるときにnormal modeまで戻す
      ['<ESC>'] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.abort()
            vim.api.nvim_input('<ESC>')
          else
            fallback()
          end
        end),
      ["<CR>"] = cmp.mapping.confirm { select = true },
    },
    experimental = {
      ghost_text = true,
    },
  })
end

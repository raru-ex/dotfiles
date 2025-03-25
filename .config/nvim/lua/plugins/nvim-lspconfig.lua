local ok_mason_lsp, mason_lspconfig = pcall(require, 'mason-lspconfig')
local ok_mason, mason = pcall(require, 'mason')
local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')
local ok_cmp, cmp = pcall(require, 'cmp')
local ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if ok_mason and ok_mason_lsp and ok_lspconfig and ok_cmp and ok_cmp_nvim_lsp then
  local function on_attach_default(client, bufnr)
    -- Reference highlight
    local cap = client.server_capabilities
    if cap.documentHighlightProvider then
      local augroup = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("CursorHold", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.document_highlight()
        end,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.clear_references()
        end,
      })
    end

    vim.keymap.set('n', '<Leader>gf', function() vim.lsp.buf.format { async = true } end)
    vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', '<Leader>gn', vim.lsp.buf.rename)
    vim.keymap.set('n', ']c', vim.diagnostic.goto_next)
    vim.keymap.set('n', '[c', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<Leader>ga', vim.lsp.buf.code_action)
    vim.keymap.set('n', '<Leader>gh', vim.lsp.buf.hover)

    -- カーソルホバー時に自動で診断情報を表示
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
      end
    })
  end

  -- 診断表示の設定
  vim.diagnostic.config({
    virtual_text = false,  -- 行末の仮想テキストを無効化
    signs = true,          -- 行番号の横にアイコンを表示
    underline = true,      -- 問題のある箇所に下線を引く
    update_in_insert = false, -- インサートモード中は更新しない
    severity_sort = true,  -- 深刻度でソート
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
  )

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
      'buf_ls',  -- protobuf
      'typos_lsp', -- typoチェック
    },
    automatic_installation = true
  })
  mason_lspconfig.setup_handlers({
    function(server)
      local opt = {
        on_attach = on_attach_default,
        capabilities = cmp_nvim_lsp.default_capabilities()
      }

      if server == "lua_ls" then
        opt.settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
          }
        }
      end

      if server == "gopls" then
        opt.settings = {
          gopls = {
            ["local"] = "github.com/knowledge-work",
            directoryFilters = { "-**/node_modules", "-**/.git", "-**/vendor" },
          }
        }
      end
      if server == "typos_lsp" then
        opt.init_options = {
          config = '~/.confing/nvim/.typos.toml'
        }
      end

      lspconfig[server].setup(opt)
    end
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
      ["<TAB>"] =  cmp.mapping.confirm { select = true }, -- 無意識だったがtabをCRと同じように使っていたと気づいた
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

  -- goのimport自動設定
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      local params = vim.lsp.util.make_range_params()
      params.context = {only = {"source.organizeImports"}}
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
      for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-8"
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
      vim.lsp.buf.format({async = false})
    end
  })
end

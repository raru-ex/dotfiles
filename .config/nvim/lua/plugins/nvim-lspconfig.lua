local ok_mason_lsp, mason_lspconfig = pcall(require, 'mason-lspconfig')
local ok_mason, mason = pcall(require, 'mason')
local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')
local ok_blink, blink = pcall(require, 'blink.cmp')

if ok_mason and ok_mason_lsp and ok_lspconfig then
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

  mason.setup()

  -- 各LSPサーバーの設定
  local capabilities = ok_blink
    and blink.get_lsp_capabilities()
    or vim.lsp.protocol.make_client_capabilities()

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
    handlers = {
      -- デフォルトハンドラー（全てのLSPサーバーに適用）
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach_default,
          capabilities = capabilities,
        })
      end,
      -- lua_ls専用設定
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          on_attach = on_attach_default,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
            }
          }
        })
      end,
      -- gopls専用設定
      ["gopls"] = function()
        lspconfig.gopls.setup({
          on_attach = on_attach_default,
          capabilities = capabilities,
          settings = {
            gopls = {
              ["local"] = "github.com/knowledge-work",
              directoryFilters = {
                "-**/node_modules",
                "-**/.git", "-**/vendor",
                "-**/content-processing-converter",
                "-**/content-processing-deadletter",
                "-**/content-processing-finalizer",
                "-**/content-processing-initiator",
                "-**/content-processing-processor",
                "-**/content-processing-transcoder",
                "-**/content-processing-transcriptor",
                "-**/content-processing-transcriptor-invoker",
                "-**/content-processing-scanner",
                "-**/content-processing-verifier",
                "-**/contentprocessing",
                "-**/data-generator",
                "-**/dbt",
                "-**/frontend",
                "-**/infra",
                "-**/e2e",
                "-**/terraform",
                "-**/docs",
                "-**/migrate",
                "-**/gateway",
                "-**/z-playground",
              },
            }
          }
        })
      end,
      -- typos_lsp専用設定
      ["typos_lsp"] = function()
        lspconfig.typos_lsp.setup({
          on_attach = on_attach_default,
          capabilities = capabilities,
          init_options = {
            config = '~/.config/nvim/.typos.toml'
          }
        })
      end,
    }
  })

  -- goのimport自動設定
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      -- Import自動整理
      vim.lsp.buf.code_action({
        context = { only = {"source.organizeImports"}, diagnostics = {} },
        apply = true,
      })
      -- フォーマット
      vim.lsp.buf.format({async = false})
    end
  })
end

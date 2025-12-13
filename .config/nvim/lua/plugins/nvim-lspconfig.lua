local ok_mason_lsp, mason_lspconfig = pcall(require, 'mason-lspconfig')
local ok_mason, mason = pcall(require, 'mason')
local ok_blink, blink = pcall(require, 'blink.cmp')

if ok_mason and ok_mason_lsp then
  -- カスタムrenameハンドラー: デフォルト処理 + 自動保存
  local default_rename_handler = vim.lsp.handlers['textDocument/rename']
  vim.lsp.handlers['textDocument/rename'] = function(err, result, ctx, config)
    -- デフォルトハンドラーを呼び出し（workspace editを適用）
    default_rename_handler(err, result, ctx, config)

    -- エラーがなく、resultがある場合のみ保存
    if not err and result then
      -- 変更されたバッファを保存
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf)
           and vim.api.nvim_buf_get_option(buf, 'modified')
           and vim.api.nvim_buf_get_option(buf, 'buftype') == '' then
          vim.api.nvim_buf_call(buf, function()
            vim.cmd('silent! write')
          end)
        end
      end
    end
  end

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

    vim.keymap.set('n', '<Leader>gf', function() vim.lsp.buf.format { async = true } end, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>gn', vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set('n', ']c', vim.diagnostic.goto_next, { buffer = bufnr })
    vim.keymap.set('n', '[c', vim.diagnostic.goto_prev, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>ga', vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>gh', vim.lsp.buf.hover, { buffer = bufnr })

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

  -- Enable semantic tokens support
  capabilities.textDocument.semanticTokens = {
    multilineTokenSupport = true,
  }

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
      'protols',  -- protobuf
      'typos_lsp', -- typoチェック
    },
  })

  -- インストール済みのLSPサーバーを取得して手動でセットアップ
  local installed_servers = mason_lspconfig.get_installed_servers()

  for _, server in ipairs(installed_servers) do
    if server == "lua_ls" then
      vim.lsp.config('lua_ls', {
        on_attach = on_attach_default,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
          }
        }
      })
      vim.lsp.enable('lua_ls')
    elseif server == "gopls" then
      vim.lsp.config('gopls', {
        on_attach = on_attach_default,
        capabilities = capabilities,
        settings = {
          gopls = {
            semanticTokens = true,  -- Enable semantic highlighting
            analyses = {
              shadow = true,  -- Detect variable shadowing
            },
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
      vim.lsp.enable('gopls')
    elseif server == "typos_lsp" then
      vim.lsp.config('typos_lsp', {
        on_attach = on_attach_default,
        capabilities = capabilities,
        init_options = {
          config = '~/.config/nvim/.typos.toml'
        }
      })
      vim.lsp.enable('typos_lsp')
    else
      vim.lsp.config(server, {
        on_attach = on_attach_default,
        capabilities = capabilities,
      })
      vim.lsp.enable(server)
    end
  end

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

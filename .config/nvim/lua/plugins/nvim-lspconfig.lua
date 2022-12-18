local ok_mason_lsp, mason_lspconfig = pcall(require, 'mason-lspconfig')
local ok_mason, mason = pcall(require, 'mason')
local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')
local ok_cmp, cmp = pcall(require, 'cmp')
local ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if ok_mason and ok_mason_lsp and ok_lspconfig and ok_cmp and ok_cmp_nvim_lsp then

  mason.setup()

  mason_lspconfig.setup({
    ensure_installed = {'bashls', 'cssls', 'cssmodules_ls', 'dockerls', 'golangci_lint_ls', 'gopls', 'html', 'tsserver', 'sumneko_lua', 'marksman', 'taplo', 'vimls', 'yamlls', 'sqlls' },
    automatic_installation = true
  })


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
  end
  mason_lspconfig.setup_handlers({
    function(server)
      local opt = {
        on_attach = on_attach,
        capabilities = cmp_nvim_lsp.default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
        )
      }
      lspconfig[server].setup(opt)
    end
  })

  lspconfig.golangci_lint_ls.setup({

  })

  vim.keymap.set('n', '<Leader>gh',  '<cmd>lua vim.lsp.buf.hover()<CR>')
  vim.keymap.set('n', '<Leader>gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  vim.keymap.set('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  vim.keymap.set('n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  vim.keymap.set('n', '<Leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  vim.keymap.set('n', '<Leader>gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  vim.keymap.set('n', '<Leader>ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
  vim.keymap.set('n', ']c', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  vim.keymap.set('n', '[c', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  vim.keymap.set('n', '<Leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  -- Telescopeで呼び出す
  -- vim.keymap.set('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  -- vim.keymap.set('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')

  -- LSP handlers
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
  )

  -- cmp
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    },
    mapping = cmp.mapping.preset.insert({
      ["<S-TAB>"] = cmp.mapping.select_prev_item(),
      ["<TAB>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ['<C-space>'] = cmp.mapping.complete(),
      ['<ESC>'] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm { select = true },
    }),
    experimental = {
      ghost_text = true,
    },
  })
end

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

  mason_lspconfig.setup_handlers({
    function(server)
      local opt = {
        capabilities = cmp_nvim_lsp.default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
        )
      }
      lspconfig[server].setup(opt)
    end
  })

  vim.keymap.set('n', '<Leader>gh',  '<cmd>lua vim.lsp.buf.hover()<CR>')
  vim.keymap.set('n', '<Leader>gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  vim.keymap.set('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  vim.keymap.set('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  vim.keymap.set('n', '<Leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  vim.keymap.set('n', '<Leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  vim.keymap.set('n', '<Leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  vim.keymap.set('n', '<Leader>gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  vim.keymap.set('n', '<Leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  vim.keymap.set('n', '<Leader>ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
  vim.keymap.set('n', ']c', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  vim.keymap.set('n', '[c', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  -- LSP handlers
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
  )

  -- Reference highlight
  vim.cmd([[
  set updatetime=300
  highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
  highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
  highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
  augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
  augroup END
  ]])

  -- cmp
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      -- { name = "buffer" },
      -- { name = "path" },
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

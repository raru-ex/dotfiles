local config = require('libs.config_loader')
local scheme = require('libs.color_scheme')

-- Initialize package manager: Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- color scheme (最優先で読み込む)
  {
    'doums/darcula',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme darcula')
      -- カーソル行のハイライトを調整（構文ハイライトを維持）
      -- 背景色のみを設定し、前景色は継承させる
      vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#323232', blend = 0 })
    end
  },

  -- 共通依存関係（重複を避けるため独立定義）
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'nvim-treesitter/nvim-treesitter',
    config = config.load 'nvim-treesitter',
    build = ':TSUpdate',
  },

  -- LSP/Completion
  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = config.load 'nvim-lspconfig'
  },
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    config = config.load 'blink-cmp',
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },

  -- terminal
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = config.load 'toggleterm'
  },

  -- git
  {
    'sindrets/diffview.nvim',
  },

  -- filer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = config.load 'neotree',
  },

  -- status line
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'arkav/lualine-lsp-progress',
    },
    config = config.load 'lualine',
  },

  -- fizzy finder
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    config = config.load 'snacks',
  },

  -- indent, white space
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = "ibl",
    config = config.load 'indent-blankline'
  },
  {
    'echasnovski/mini.indentscope',
    event = { 'BufReadPost', 'BufNewFile' },
    branch = 'stable',
    config = config.load 'mini-indentscope'
  },

  -- utils
  {
    'FooSoft/vim-argwrap',
    config = config.load 'arg-wrap'
  },

  -- test
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go"
    },
    config = config.load 'neotest',
  },

  -- filetype specific
  { 'plasticboy/vim-markdown', config = config.load 'markdown', ft = { 'md', 'mkd', 'markdown' } },
  { '110y/vim-go-expr-completion', config = config.load 'go-expr-completion', ft = { 'go' } },
  { 'buoto/gotests-vim', config = config.load 'gotests-vim', ft = { 'go' } },

})

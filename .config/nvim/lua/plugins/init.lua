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
  {
    'nvim-treesitter/nvim-treesitter',
    config = config.load 'nvim-treesitter',
    build = ':TSUpdate',
  },

  -- terminal
  { 'akinsho/toggleterm.nvim', version = '*', config = config.load 'toggleterm' },

  -- git
  { 'sindrets/diffview.nvim' },

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
    dependencies = {
      { 'kyazdani42/nvim-web-devicons', opt = true, name = 'status-nvim-web-devicons'},
      { 'arkav/lualine-lsp-progress' },
      { 'hrsh7th/vim-vsnip' }
    },
    config = config.load 'lualine',
  },

  -- color scheme
  -- { 'folke/tokyonight.nvim', config = scheme.setup 'tokyonight' }
  { 'doums/darcula', config = scheme.setup 'darcula' },

  -- indent, white space
  { 'lukas-reineke/indent-blankline.nvim', main = "ibl", config = config.load 'indent-blankline' },
  { 'echasnovski/mini.indentscope', branch = 'stable' , config = config.load 'mini-indentscope'},

  -- utils
  { 'FooSoft/vim-argwrap', config = config.load 'arg-wrap'},

  -- LSP/Completion
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      {'williamboman/mason.nvim'},
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
    },
    config = config.load 'nvim-lspconfig'
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },

  -- AI: claude codeだけあればいいのでいらない
  -- require("plugins.ai"),

  -- fizzy finder
  {
    --  'nvim-telescope/telescope.nvim', tag = '0.1.1',
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = config.load 'telescope',
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require'telescope'.load_extension('frecency')
    end,
    dependencies = {'kkharji/sqlite.lua'},
  },

  -- for any filetype
  { 'plasticboy/vim-markdown', config = config.load 'markdown', ft = { 'md', 'mkd', 'markdown' } },
  { '110y/vim-go-expr-completion', config = config.load 'go-expr-completion', ft = { 'go' } },


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
  { 'buoto/gotests-vim', config = config.load 'gotests-vim', ft = { 'go' } },

  -- obsidian
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see above for full list of optional dependencies ☝️
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
      },

      -- see below for full list of options 👇
    },
    config = config.load 'obsidian'
  },
})


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
  { 'github/copilot.vim', config = config.load 'copilot' },
  { 'neoclide/coc.nvim', branch='release', config = config.load 'coc' },

  -- fizzy finder
  {
   --  'nvim-telescope/telescope.nvim', tag = '0.1.1',
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      -- { '~/.fzf', rtp = 'fzf'}
      -- {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'fannheyward/telescope-coc.nvim' },
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
  { 'mattn/vim-goimports', config = config.load 'go-imports', ft = { 'go' } },
  { '110y/vim-go-expr-completion', config = config.load 'go-expr-completion', ft = { 'go' } },


  -- test
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go"
    },
    config = config.load 'neotest',
  },
  { 'buoto/gotests-vim', config = config.load 'gotests-vim', ft = { 'go' } },

})


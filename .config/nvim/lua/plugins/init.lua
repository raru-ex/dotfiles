local config = require('libs.config_loader')
local scheme = require('libs.color_scheme')

vim.cmd('packadd packer.nvim')
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

-- TODO: 変更候補neoterm, nerdtree
return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }

  -- syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = config.load 'nvim-treesitter'
  }

  -- terminal
  use { 'kassio/neoterm', config = config.load 'neoterm' }

  -- Finder, column effects
  use { 'scrooloose/nerdtree',
    requires = { 'jistr/vim-nerdtree-tabs', config = config.load 'nerdtree-tabs' },
    config = config.load 'nerdtree',
  }
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'ryanoasis/vim-devicons'
  use { 'lewis6991/gitsigns.nvim', config = config.load 'gitsigns' }

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
      { 'arkav/lualine-lsp-progress' },
    },
    config = config.load 'lualine'
  }

  -- color scheme
  -- use { 'folke/tokyonight.nvim', config = scheme.setup 'tokyonight' }
  use { 'doums/darcula', config = scheme.setup 'darcula' }

  -- indent, white space
  use 'bronson/vim-trailing-whitespace'
  use { 'lukas-reineke/indent-blankline.nvim', config = config.load 'indent-blankline' }

  -- utils
  use { 'FooSoft/vim-argwrap', config = config.load 'arg-wrap'}

  -- LSP/Completion
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = config.load 'nvim-lspconfig',
  }

  -- fizzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { '~/.fzf', rtp = 'fzf'}
    },
    config = config.load 'telescope'
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"kkharji/sqlite.lua"}
  }

  -- lazy
  use { 'plasticboy/vim-markdown', config = config.load 'markdown', ft = { 'md', 'mkd', 'markdown' } }
  use { 'mattn/vim-goimports', config = config.load 'go-imports', ft = { 'go' } }
  use { '110y/vim-go-expr-completion', config = config.load 'go-expr-completion', ft = { 'go' } }
  use { 'vim-test/vim-test', config = config.load 'vim-test', ft = { 'go' } }
  use { 'buoto/gotests-vim', config = config.load 'gotests-vim', ft = { 'go' } }

end
)


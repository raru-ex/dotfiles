local config = require('libs.config_loader')
local scheme = require('libs.color_scheme')

vim.cmd('packadd packer.nvim')
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- lua plugins
  use { 'wbthomason/packer.nvim', opt = true}
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = config.load 'nvim-treesitter'
    }

  -- vimrc plugins
  -- TODO: 変更候補neoterm, nerdtree, vim-airline, coc
  use { 'kassio/neoterm', config = config.load 'neoterm'}
  use { 'scrooloose/nerdtree',
    requires = { 'jistr/vim-nerdtree-tabs', config = config.load 'nerdtree-tabs' },
    config = config.load 'nerdtree',
  }
  use { 'Xuyuanp/nerdtree-git-plugin' }
  use 'ryanoasis/vim-devicons'
  use 'airblade/vim-gitgutter'
  use 'vim-airline/vim-airline'
  use 'bronson/vim-trailing-whitespace'
  use {
    'folke/tokyonight.nvim',
    -- config = scheme.setup 'tokyonight',
  }
  use {
    'doums/darcula',
    config = scheme.setup 'darcula'
  }
  use { 'FooSoft/vim-argwrap', config = config.load 'arg-wrap'}
  use { 'nathanaelkane/vim-indent-guides', config = config.load 'indent-guide'}

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    },
    config = config.load 'telescope'
  }

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

  -- lazy
  use { 'plasticboy/vim-markdown', config = config.load 'markdown', ft = { 'md', 'mkd', 'markdown' } }
  use { 'mattn/vim-goimports', config = config.load 'go-imports', ft = { 'go' }}
  use { '110y/vim-go-expr-completion', config = config.load 'go-expr-completion', ft = { 'go' }}
  use { 'vim-test/vim-test', config = config.load 'vim-test', ft = { 'go' }}
  use { 'buoto/gotests-vim', config = config.load 'gotests-vim', ft = { 'go' }}
end)


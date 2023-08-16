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
  use { 'wbthomason/packer.nvim', opt = true }

  -- syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    commit = "3af1220e18034eb2ce7d1c8e77055bc3bf3c1c36",
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = config.load 'nvim-treesitter'
  }

  -- terminal
  use { 'akinsho/toggleterm.nvim', tag = '*', config = config.load 'toggleterm' }

  -- git
  use { 'sindrets/diffview.nvim' }

  -- filer
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = config.load 'neotree',
  }

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
      { 'arkav/lualine-lsp-progress' },
      { 'hrsh7th/vim-vsnip' }
    },
    config = config.load 'lualine',
    wants = { 'vim-vsnip' },
  }

  -- color scheme
  -- use { 'folke/tokyonight.nvim', config = scheme.setup 'tokyonight' }
  use { 'doums/darcula', config = scheme.setup 'darcula' }

  -- indent, white space
  use { 'lukas-reineke/indent-blankline.nvim', config = config.load 'indent-blankline' }
  use { 'echasnovski/mini.indentscope', branch = 'stable' , config = config.load 'mini-indentscope'}

  -- utils
  use { 'FooSoft/vim-argwrap', config = config.load 'arg-wrap'}

  -- LSP/Completion
  use { 'github/copilot.vim', config = config.load 'copilot' }
  use {
    'neoclide/coc.nvim', branch='release', config = config.load 'coc'
  }

  -- fizzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'},
      -- { '~/.fzf', rtp = 'fzf'}
      -- {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'fannheyward/telescope-coc.nvim' },
    },
    config = config.load 'telescope',
  }
  use {
    'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require'telescope'.load_extension('frecency')
    end,
    requires = {'kkharji/sqlite.lua'}
  }

  -- lazy
  use { 'plasticboy/vim-markdown', config = config.load 'markdown', ft = { 'md', 'mkd', 'markdown' } }
  use { 'mattn/vim-goimports', config = config.load 'go-imports', ft = { 'go' } }
  use { '110y/vim-go-expr-completion', config = config.load 'go-expr-completion', ft = { 'go' } }

  -- test
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go"
    },
    config = config.load 'neotest',
  }

  use { 'buoto/gotests-vim', config = config.load 'gotests-vim', ft = { 'go' } }
end
)


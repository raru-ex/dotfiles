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
  { 'neoclide/coc.nvim', branch='release', config = config.load 'coc' },

  -- AI
  --#copilot.lua + copilot.cmp
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    priority = 1000,
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
        server_opts_overrides = {
          trace = "verbose",
          settings = {
            advanced = {
              listCount = 10,
              inlineSuggestCount = 3,
            },
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = true,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
          ["*"] = true,
        },
      }
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      provider = "copilot",
      -- auto_suggestions_provider = "copilot",

      -- 動作設定
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = true,
        minimize_diff = true,
      },
      windows = {
        position = "right",
        wrap = true,
        width = 30,
        sidebar_header = {
          enabled = true,
          align = "center",
          rounded = true,
        },
        input = {
          prefix = "> ",
          height = 8,
        },
        edit = {
          border = "rounded",
          start_insert = true,
        },
        ask = {
          floating = false,
          start_insert = true,
          border = "rounded",
          focus_on_apply = "ours",
        },
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  
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
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go"
    },
    config = config.load 'neotest',
  },
  { 'buoto/gotests-vim', config = config.load 'gotests-vim', ft = { 'go' } },

})


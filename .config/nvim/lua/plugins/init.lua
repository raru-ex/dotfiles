local config = require('libs.config_loader')

vim.cmd('packadd vim-jetpack')
vim.cmd('packadd nvim-treesitter')

require('jetpack.packer').startup(function(use)
  -- lua plugins
  use { 'tani/vim-jetpack', opt = 1 } -- bootstrap
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
      config = config.load 'nvim-treesitter'
  }

  -- vimrc plugins
  use { 'kassio/neoterm', config = config.load 'neoterm'} -- bootstrap
end)

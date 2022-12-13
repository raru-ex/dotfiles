local config = require('libs.config_loader')


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
  use { 'kassio/neoterm', config = config.load 'neoterm'}
  use { 'scrooloose/nerdtree', config = config.load 'nerdtree'}
  use { 'jistr/vim-nerdtree-tabs', requires = {'scrooloose/nerdtree'}, config = config.load 'nerdtree-tabs'}
  use { 'Xuyuanp/nerdtree-git-plugin' }
  use 'ryanoasis/vim-devicons'
  use 'airblade/vim-gitgutter'

end)


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
  -- TODO: 変更候補neoterm, nerdtree, vim-airline
  use { 'kassio/neoterm', config = config.load 'neoterm'}
  use { 'scrooloose/nerdtree', config = config.load 'nerdtree'}
  use { 'jistr/vim-nerdtree-tabs', requires = {'scrooloose/nerdtree'}, config = config.load 'nerdtree-tabs'}
  use { 'Xuyuanp/nerdtree-git-plugin' }
  use 'ryanoasis/vim-devicons'
  use 'airblade/vim-gitgutter'
  use 'vim-airline/vim-airline'
  use 'bronson/vim-trailing-whitespace'
  -- use 'folke/tokyonight.nvim'
  use { 'doums/darcula', config.load 'darcula' }
  use { 'FooSoft/vim-argwrap', config.load 'arg-wrap'}
  use { 'nathanaelkane/vim-indent-guides', config.load 'indent-guide'}

  -- lazy
end)


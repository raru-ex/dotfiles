vim.cmd('packadd vim-jetpack')

require('jetpack.packer').startup(function(use)
  use { 'tani/vim-jetpack', opt = 1 } -- bootstrap
end)

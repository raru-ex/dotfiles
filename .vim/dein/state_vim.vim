if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/raru/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/raru/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim81,/usr/local/share/vim/vimfiles/after,/Users/raru/.vim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/raru/.vimrc', '/Users/raru/.vim/dein/toml/common.toml', '/Users/raru/.vim/dein/toml/vim.toml', '/Users/raru/.vim/dein/toml/common_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/raru/.vim/dein'
let g:dein#_runtime_path = '/Users/raru/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/raru/.vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/raru/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/raru/.vim,/usr/local/share/vim/vimfiles,/Users/raru/.vim/dein/repos/github.com/Shougo/neocomplete.vim,/Users/raru/.vim/dein/.cache/.vimrc/.dein,/usr/local/share/vim/vim81,/Users/raru/.vim/dein/.cache/.vimrc/.dein/after,/usr/local/share/vim/vimfiles/after,/Users/raru/.vim/after'
filetype off
  source ~/.vim/vimrcs/onedark.vim
  source ~/.vim/vimrcs/unite.vim
  source ~/.vim/vimrcs/nerdtree.vim
  source ~/.vim/vimrcs/neocomplete.vim

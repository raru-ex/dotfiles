#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

~/dotfiles/bin/install_brew_items.sh
~/dotfiles/bin/install_fonts.sh
~/dotfiles/bin/install_vim.sh
~/dotfiles/bin/install_zsh.sh
~/dotfiles/bin/install_tmux.sh
~/dotfiles/bin/install_install_lsps.sh
~/dotfiles/bin/install_karabiner_json.sh
~/dotfiles/bin/install_git_settings.sh
~/dotfiles/bin/install_go_tools.sh


#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

~/dotfiles/bin/install_brew_items.sh
~/dotfiles/bin/install_fonts.sh
~/dotfiles/bin/install_vim.sh
~/dotfiles/bin/install_zsh.sh
~/dotfiles/bin/install_tmux.sh
~/dotfiles/bin/install_lsps.sh
if [ "$(uname)" == 'Darwin' ]; then
	# Mac OS
  ~/dotfiles/bin/install_karabiner_json.sh
fi

~/dotfiles/bin/install_git_settings.sh
~/dotfiles/bin/install_go_tools.sh
~/dotfiles/bin/install_claude.sh


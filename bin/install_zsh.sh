if ! type fzf -a type git > /dev/null 2>&1; then
  echo "[INFO] install fzf"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else
  echo "[INFO] skip install fzf"
fi
ln -nfs ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc

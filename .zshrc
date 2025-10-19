# load plugin
source ~/dotfiles/.zsh/zplug.zsh
# prompt
source ~/dotfiles/.zsh/prompt.zsh

# exports
# lang setting
export LANG=ja_JP.UTF-8 export PAGER=less
export EDITOR=vim
export XDG_CONFIG_HOME=~/.config

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history # historyをシェル間で共有
setopt HIST_IGNORE_DUPS # 同じhistoryを保存しない

# completion settings
autoload -Uz compinit && compinit # 補完有効化
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}' # 大文字小文字の区別なく補完
setopt auto_list # 候補を一覧表示
setopt auto_menu # 候補をtabで切り替え
zstyle ':completion:*:default' menu select=1 # 候補をtab, 矢印で選択
setopt list_packed # 補完を詰めて表示
zstyle ':completion:*' list-colors '' # 補完をカラー表示

# options
# setopt auto_cd # cdなしでフォルダ移動->普通のコマンドの補完が走ったりして使いづらいので無効化
setopt print_eight_bit # 日本語ファイル名を表示可能
setopt no_beep # beep音を無効化
setopt nonomatch # ?とかがshellに混ざるとエラーになるのを避ける

# key bind
bindkey -e
bindkey '^[[Z' reverse-menu-complete # Shift-Tabで候補を逆順に補完する

# aliases
if [ -d /usr/local/opt/coreutils/libexec/gnubin ] ; then
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
  alias ls='ls --color=auto -lFh'
else
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -lFhG'
fi

alias findgrep='find . -type f -name \* | xargs grep -I'
# alias vi='nvim'
alias view='vim -R'
# echo '' | jqless
alias jqless="jq '.' -C | less -R "


function displayColors () {
  for i in {0..255}
  do
    if [ `expr $i % 16` -eq 15 ]; then
      printf "\x1b[38;5;%03dm%03d\n" $i $i
    else
      printf "\x1b[38;5;%03dm%03d  " $i $i
    fi
  done
}

stty stop undef

# fzf. 何かの設定が先に必要っぽいので一旦一番下に書く
source ~/dotfiles/.zsh/fzf.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions
export BAT_THEME=gruvbox-dark
export FZF_PREVIEW_PREVIEW_BAT_THEME='gruvbox-dark'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export GOPATH=$(go env GOPATH)
export PATH="/usr/local/opt/gettext/bin:$GOPATH/bin:$PATH"
export PATH=$PATH:~/.bin

# bun completions
[ -s "/home/raru/.bun/_bun" ] && source "/home/raru/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# export LD_LIBRARY_PATH=/usr/local/lib64
if [ -f ~/.env_secrets ]; then
  source ~/.env_secrets
fi

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code-insiders --locate-shell-integration-path zsh)"

# === mise ===
if [ -s "$HOME/.local/bin/mise" ]; then
  eval "$($HOME/.local/bin/mise activate zsh)"
  # export PATH="$HOME/.local/share/mise/shims:$PATH"
fi



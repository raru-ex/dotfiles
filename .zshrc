# load plugin
source ~/dotfiles/.zsh/.zplug.zsh

# promt
autoload -Uz colors && colors
PROMPT="%{$fg_bold[cyan]%}%c %{$fg_bold[green]%}> "

# right prompt
source ~/dotfiles/.zsh/.rprompt.zsh

# exports
# lang setting
export LANG=ja_JP.UTF-8
export PAGER=less
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

# key bind
bindkey '^[[Z' reverse-menu-complete # Shift-Tabで候補を逆順に補完する

# aliases
if type brew > /dev/null 2>&1; then
  alias ls='ls -FhG'
else
  alias ls='ls -Fh --color=auto'
fi
# alias syrup_ssh='ssh -p 56765 raru@syrup16g.net -i ~/.ssh/id_rsa_syrup16g'
# alias syrup_sftp='sftp -oPort=56765 -oIdentityFile=/Users/raru/.ssh/id_rsa_syrup16g raru@syrup16g.net'
alias findgrep='find . -type f -name \* | xargs grep -I'
# alias vi='env LANG=ja_JP.UTF-8 /usr/local/Cellar/macvim/8.1-147/MacVim.app/Contents/MacOS/Vim "$@"'
# alias vim='env LANG=ja_JP.UTF-8 /usr/local/Cellar/macvim/8.1-147/MacVim.app/Contents/MacOS/Vim "$@"'
alias jqless="/usr/bin/pbpaste | /usr/local/bin/jq '.' -C | less -R "

stty stop undef

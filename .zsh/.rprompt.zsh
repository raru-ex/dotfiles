autoload -Uz vcs_info # バージョン管理系のinfo利用機能をload

setopt prompt_subst # prompt表示のたびに変数を展開(今回はvcs_info_msg_0_)
zstyle ':vcs_info:git:*' check-for-changes false # コミットされてないファイルの有無に興味がないのでfalse
### check-for-changesがfalseで%c, %uが取れないので無効。
# zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
# zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}[%b]%f" # current branchを表示
zstyle ':vcs_info:*' actionformats '%F{red}[%b|%a]%f' #[master|merge]みたいに表示
precmd () { vcs_info } # prompt表示ごとに最新のinfoを取得
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

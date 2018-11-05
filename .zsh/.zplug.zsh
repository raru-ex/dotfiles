# zplugが無ければgitからclone
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

# zplugを使う
source ~/.zplug/init.zsh

# pluginの追加
zplug "zsh-users/zsh-autosuggestions" # 薄く補完を表示
zplug "zsh-users/zsh-completions" # 補完を強化
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # コマンドの色付け
zplug "zsh-users/zsh-history-substring-search", defer:3 # history補完強化

# 自分自身をプラグインとして管理
zplug "zplug/zplug", hook-build:'zplug --self-manage'


# インストールしてないプラグインはインストール
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load –verbose

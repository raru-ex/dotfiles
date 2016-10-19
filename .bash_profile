# include .bashrc if it exists
test -f ~/.bashrc && . ~/.bashrc

# For PHP Environment
export PHP_ROOT="${HOME}/.phpenv"
if [ -d "${PHP_ROOT}" ]; then
    export PATH=${PHP_ROOT}/bin:$PATH
    eval "$(phpenv init -)"
fi

# scala version manager
export SCALA_HOME=~/.svm/current/rt
export PATH=~/.svm:$PATH
export PATH=$SCALA_HOME/bin:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

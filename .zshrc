HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory autocd BRACE_CCL extendedglob inc_append_history interactivecomments notify
unsetopt beep
bindkey -e

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

git_branch() {
    ref=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ "$ref" ]; then
        echo -n '('$ref') '
    fi
}
setopt prompt_subst
name=$'%{\e[1;34m%}'david
at=$'%{\e[1;36m%}@%{\e[0m%}'
host=$'%{\e[1;34m%}%m%{\e[0m%}'
dir=$'%{\e[0;31m%}%c/%{\e[0m%}'
branch=$'%{\e[1;32m%}''$(git_branch)'$'%{\e[0m%}'
export PROMPT=$name$at$host$' '$branch$dir$': '

setopt NO_NOMATCH

# Safe copy and move
alias cp="cp -i"
alias mv="mv -i"

export LD_LIBRARY_PATH=/usr/local/lib

#Virtualenvwrapper settings:
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=/home/$USER/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

# Starfish client completion
eval "$(register-python-argcomplete client)"
eval "$(register-python-argcomplete sf)"

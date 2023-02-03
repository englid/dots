HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000

autoload bashcompinit
bashcompinit

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

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# Setting PATH for Python 3 installed by brew
export PATH=$HOME/Library/Python/3.10/bin:$PATH

#Virtualenvwrapper settings:
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/Library/Python/3.10/bin/virtualenv
source $HOME/Library/Python/3.10/bin/virtualenvwrapper.sh

# EZ nav
export CDPATH=$HOME/src/git/englid-sf/:$GOPATH/src/github.com/englid-sf

# Starship
eval "$(starship init zsh)"

# vim -> nvim
alias vim=nvim

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
export EDITOR='vim'

alias pw="sudo poweroff -i"
alias docker-logs="docker logs --tail=100 -f"

plugins=(git rvm bundler nvm perl knife npm node vi-mode vagrant)

source $ZSH/oh-my-zsh.sh

#git tracked prompt
DISABLE_UNTRACKED_FILES_DIRTY=false


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#PATH=$PATH:$HOME/.yarn/bin # Add RVM to PATH for scripting


export GOPATH=$HOME/goprojects
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.local/bin
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export TERM="xterm-256color"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.aliases

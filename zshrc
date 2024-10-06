ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

export EDITOR='vim'

alias pw="sudo poweroff -i"
alias docker-logs="docker logs --tail=100 -f"
alias vim="nvim"
export PATH="$HOME/.asdf/shims:$PATH"

plugins=(
  git
  bundler
  asdf
  perl
  knife
  npm
  node
  vi-mode
)

source $ZSH/oh-my-zsh.sh

DISABLE_UNTRACKED_FILES_DIRTY=false

export PATH=$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export GOPATH=$HOME/goprojects
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:~/.local/bin
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export TERM="xterm-256color"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.aliases

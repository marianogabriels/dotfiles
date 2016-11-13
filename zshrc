ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
set -g default-terminal "urxvt"
export EDITOR='vim'


# Aliases
alias tmux="TERM=screen-256color-bce tmux"
alias vimrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias xconf="vim ~/.Xresources && xrdb ~/.Xresources"
alias perldoc="perldoc -u -f"
alias rv="touch .ruby-version"
alias rg=".ruby-gemset"
alias p="xclip -o | bash"
alias w="sudo wifi-menu"
alias rgl="rvm gemset list"
alias rgu="rvm gemset use"
alias pw="sudo poweroff -i"
alias tmux="tmux -L default"
alias o="xclip -o"
alias docker-compose-dev="docker-compose -f docker-compose.yml -f development.yml"
alias docker-compose-test="docker-compose -f test.yml"



plugins=(git tmuxinator rvm bundler nvm archlinux perl thor knife npm node vi-mode go vagrant)

source $ZSH/oh-my-zsh.sh


#git tracked prompt
DISABLE_UNTRACKED_FILES_DIRTY=false


# ::RVM:: 
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/node_modules/phantomjs/lib/phantom/bin/
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# ::NVM::
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh" # This loads nvm
# ::GVM::
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
#clj
export CLOJURESCRIPT_HOME=$HOME/projects/clojurescript
export PATH=$PATH:$HOME/projects/clojurescript/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=~/Descargas/utils/sbt/bin:$PATH
export GOPATH=$HOME/goprojects
export PATH=$PATH:$GOPATH/bin
ZSH_TMUX_AUTOSTART=true
export DISABLE_AUTO_TITLE=true
export TERM="xterm-256color"
xset -b
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#ctrl + r like bash 
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

source ~/.aliases

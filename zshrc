# Path to your oh-my-zsh configuration.
#
ZSH=$HOME/.oh-my-zsh

#zsh --login
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"

#ZSH_THEME="random"
#if [[ "$USER" == "vagrant" ]];then
    ZSH_THEME="robbyrussell"
#else
#    ZSH_THEME="af-magic"
#fi


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vimrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias xconf="vim ~/.Xresources && xrdb ~/.Xresources"
alias cleant="rm -r -f ~/.tmp/* && sudo rm -r -f /var/tmp/*.*"
alias agile="~/projects/agilerails/ecommerce_sample"
alias perldoc="perldoc -u -f"
alias mycheatsheet="cd ~/Dropbox/web_/mycheatsheets"
alias rv="touch .ruby-version"
alias rg=".ruby-gemset"
alias p="xclip -o | bash"
alias w="sudo wifi-menu"
alias rgl="rvm gemset list"
alias rgu="rvm gemset use"
alias pw="sudo poweroff -i"
alias tmux="tmux -L default"
alias thor subtitles:searcher="thor ~/projects/sub_scraper/subtitles.thor"
alias o="xclip -o"
alias flstudio="wine /home/mariano/.wine/drive_c/Program\ Files/Image-Line/FL\ Studio\ 11/FL.exe"



# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#alias tmux="TERM=screen-256color-bce tmux"
plugins=(git tmuxinator rvm bundler archlinux perl thor knife npm node vi-mode go vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=$PATH:/home/marianogabriels/.rvm/gems/ruby-2.0.0-p247/bin:/home/marianogabriels/.rvm/gems/ruby-2.0.0-p247@global/bin:/home/marianogabriels/.rvm/rubies/ruby-2.0.0-p247/bin:/home/marianogabriels/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl


ZSH_TMUX_AUTOSTART=true
export DISABLE_AUTO_TITLE=true
export TERM="xterm-256color"
alias tmux="TERM=screen-256color-bce tmux"
set -g default-terminal "urxvt"


#source ~/.fresh/build/shell.sh
#source ~/.aliasrc
export EDITOR='vim'
#if [ "$TMUX" = "" ]; then tmux; fi


# ::RVM:: 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

#source ~/perl5/perlbrew/etc/bashrc

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=~/Descargas/utils/sbt/bin:$PATH
export GOPATH=$HOME/goprojects
export PATH=$PATH:$GOPATH/bin
xset -b


[ -s "/home/mschmidt/.nvm/nvm.sh" ] && . "/home/mschmidt/.nvm/nvm.sh" # This loads nvm

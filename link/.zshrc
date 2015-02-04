# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="blinks"
#ZSH_THEME="clean"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias betty="ruby1.9.1 /opt/betty/main.rb"
alias latexprev="latexmk -pdf -pvc -f "
alias r="ranger"
alias ipynb="ipython notebook --pylab inline"

alias wxpydemo="ipython /opt/wxpython/demo/demo.py &"
alias wxpydoc="xdg-open /opt/wxpython/docs/wx/index.html"

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
plugins=(git archlinux systemd vi-mode)

source $ZSH/oh-my-zsh.sh
source ~/.liquidprompt/liquidprompt
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

bindkey -v
export KEYTIMEOUT=1

# Customize to your needs...
export PYTHONPATH=/home/durox/.pypackages
#export PATH=/home/durox/.anaconda/bin:/home/durox/.dotfiles/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl
export PATH=/home/durox/.dotfiles/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl

#eval $(perl -I${HOME}/perl5/lib/perl5 -Mlocal::lib)

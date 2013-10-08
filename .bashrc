# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && exit

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color) color_prompt=yes;;
# esac

# PS1="\[\e]0;\u@\h: \w\a\]$PS1"
PS1='\[\e[0;36m\][\t]\[\e[m\] \[\e[0;33m\]\w\[\e[m\]> '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -arthlF'
alias la='ls -A'
alias l='ls -CF'

# cd aliases
alias ..='cd ..; ls'
alias ...='cd ../..; ls'

# more useful alias
alias cl='clear'
alias md='mkdir'

# make sudo work with commands not in root $PATH (like ~/bin)
alias sudo='sudo env PATH=$PATH'
alias op='xdg-open'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Set clang as default compiler
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

# Default pager
export PAGER=/usr/bin/less

PATH=~/google_appengine:$PATH
PATH=~/qtcreator-2.6.2/bin:$PATH
PATH=~/adt-bundle-linux-x86_64/sdk/platform-tools:$PATH
PATH=~/adt-bundle-linux-x86_64/sdk/tools:$PATH
PATH=~/emscripten:$PATH
PATH=~/bin:$PATH

export EC2_HOME=~/ec2-api-tools/
PATH=$EC2_HOME/bin:$PATH
export EC2_PRIVATE_KEY=$EC2_HOME/pk-6UM7PCCNAJXDRL667L5TDCY6ERUUU5C6.pem
export EC2_CERT=$EC2_HOME/cert-6UM7PCCNAJXDRL667L5TDCY6ERUUU5C6.pem
export EC2_URL=https://ec2.eu-west-1.amazonaws.com
export JAVA_HOME=/usr
export PATH

function clip() {
  xclip -sel clip
}

function cls() {
  clear
  echo 'Someone is using cls instead of clear...'
}

function pause() {
  echo -n 'Pause? Are you serious?..'
  read
}

function exit() {
  echo "Use Ctrl+D instead. If you really need 'exit' use 'builtin exit'"
  return 1
}

# enable VIM mode
set -o vi

export EDITOR=vim

# source ~/.kde-bashrc

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


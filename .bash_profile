# vim: set filetype=sh:

export BASH_SILENCE_DEPRECATION_WARNING=1

### PATHS ###
PATH="/usr/local/opt/qt@5.5/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="$HOME/bin:$PATH"
export PATH=$PATH

### PROMPT ###
source ~/.git-prompt.sh
PS1='\n\n$PWD$(__git_ps1 " \033[0;33m├%s\033[0m")\n'

### LOCALE ###
export LC_ALL=en_US.UTF-8

### ALIASES ###
alias bashrc='vi ~/.bash_profile && . ~/.bash_profile'
alias vimrc='vi ~/.vimrc'
alias inputrc='vi ~/.inputrc'
alias irbrc='vi ~/.irbrc'
alias gitconfig='vi ~/.gitconfig'
alias hosts='sudo vi /etc/hosts'
alias sshconfig='vi ~/.ssh/config'

alias ls='ls -GF'
alias ll='ls -lh'
alias lla='ls -lhA'
alias la='ls -1A'
alias l='ls -1'

alias vi='vim -p'

alias rgrep='grep --context=2 --ignore-case --line-number --recursive'

alias py='python'

alias b='bundle exec'

### VIMCONFIG ###
export VISUAL="vim"
export VIMCONFIG="~/.vim"
export VIMDATA="~/.vim"

### COMPLETION ###
source ~/.git-completion.bash
# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

### HISTORY ###
HISTSIZE=50000
HISTFILESIZE=$HISTSIZE
SHELL_SESSION_HISTORY=0
HISTIGNORE="ls:ll:la:l:cd:gd:gg:gl*:gf:vg"
HISTCONTROL=ignoredups:ignorespace:erasedups # do not duplicate lines
shopt -s histappend # append the history file instead overwriting

### GREP ###
export GREP_OPTIONS="--color=auto"

### HOMEBREW ###
export HOMEBREW_NO_EMOJI=1

### RBENV ###
if type rbenv &> /dev/null; then
  eval "$(rbenv init -)"
fi

### FUNCTIONS ###
function title {
    echo -en "\033]0;$@\007"
}

# Find files by filename using ack
function f {
    ack -g $@ | ack $1
}

# Better search without quotes
# Change tool var and it should work with grep, ack...
# grep -irlC2 or ack -iC
# Usage: a some query dir
# Checks if last param ${!#} is a dir
# Then uses the remaining params as a search query
# Stripts trailing slash from dir for pretty output
# If no dir specified, uses current dir
function a {
  tool='rgrep'
  if [ -d "${!#}" ]; then
    arg_length=$(($#-1))
    query=${@:1:$arg_length}
    params="\"${query}\" ${!#/%\/}"
  else
    params="\"${@}\" ."
  fi
  eval "${tool} ${params}"
}

# Small extension of the a function above
# For convenience for ruby stuff
function def {
  a def $@
}

# duckduckgo with w3m
function duckduckgo {
    QUERY="$@"
    URL="https://duckduckgo.com/?q="
    SEARCH_QUERY=$(php -r "echo urlencode(\"$QUERY\");")
    w3m -M -cols 5 +19 "${URL}${SEARCH_QUERY}"
}

# New note
function note {
  touch $1
  open $1
}

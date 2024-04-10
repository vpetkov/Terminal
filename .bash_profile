PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_NO_EMOJI=1

source /opt/homebrew/Cellar/git/2.44.0/etc/bash_completion.d/git-completion.bash
source /opt/homebrew/Cellar/git/2.44.0/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWDIRTYSTATE=true
PS1='\n\n$PWD $(__git_ps1 "├%s")\n> '

alias bashrc='vi ~/.bash_profile && . ~/.bash_profile'
alias vimrc='vi ~/.vimrc'
alias inputrc='vi ~/.inputrc'
alias irbrc='vi ~/.irbrc'
alias gitconfig='vi ~/.gitconfig'
alias hosts='sudo vi /etc/hosts'
alias sshconfig='vi ~/.ssh/config'

alias vi='vim -p'

alias ls='ls -F'
alias ll='ls -lh'
alias lla='ls -lhA'
alias la='ls -1A'
alias l='ls -1'

export GREP_OPTIONS="--color=auto"
alias rgrep='grep --context=2 --ignore-case --line-number --recursive'

alias py='python3'

alias b='bundle exec'

HISTSIZE=50000
HISTFILESIZE=$HISTSIZE
SHELL_SESSION_HISTORY=0
HISTIGNORE="ls:ll:lla:la:l:cd:gd:gg:gl*:gf:vg"
HISTCONTROL=ignoredups:ignorespace:erasedups # do not duplicate lines
shopt -s histappend # append the history file instead overwriting

if type rbenv &> /dev/null; then
  eval "$(rbenv init -)"
fi

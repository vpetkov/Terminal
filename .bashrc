eval "$(/opt/homebrew/bin/brew shellenv)"

export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_EMOJI=1

if [ -f /opt/homebrew/share/bash-completion/bash_completion ]; then
  source /opt/homebrew/share/bash-completion/bash_completion
fi

for script in /opt/homebrew/Cellar/git/*/etc/bash_completion.d/git-{completion,prompt}.sh; do
  [ -f "$script" ] && source "$script"
done
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWDIRTYSTATE=true
PS1='\n\n$PWD $(__git_ps1 "├%s")\n> '
PS1='\n$PWD > '

alias bashrc='vi ~/.bashrc && . ~/.bashrc'
alias vimrc='vi ~/.vimrc'
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

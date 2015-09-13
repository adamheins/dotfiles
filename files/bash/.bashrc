# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Use vi-style command line editing mode.
set -o vi

# Use vim.
export VISUAL=vim
export EDITOR="$VISUAL"

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Amount of bash history.
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don't overwrite it.
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set the PS1.
if [ "$(tput colors)" -ge 8 ]; then
  PS1='\[\033[38;5;010m\]\u@\h:\[\033[00m\]\w\[\033[38;5;010m\] ~>\[\033[00m\] '
else
  PS1='\u@\h:\w\$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Get 256 color support.
#export TERM=xterm-256color

# Launch tmux automatically.
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Use fzf for fuzzy-searching.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Use vi-style command line editing mode.
set -o vi

# My modified version of fzf depends on this as an alternative binding to \e to
# get into vi-movement-mode. \e causes a delay since it is bound as a prefix
# to so many other command. Run `bind -p | grep -F "\e"` to see.
bind "\C-a":vi-movement-mode

# Use vim.
export VISUAL=vim
export EDITOR="$VISUAL"

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Amount of bash history.
HISTSIZE=500
HISTFILESIZE=1000

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
  PS1='\[\033[38;5;010m\]\u@\h \[\033[00m\]\w\[\033[38;5;010m\] ~>\[\033[00m\] '
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

# Launch tmux automatically.
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Use the fuck.
eval "$(thefuck --alias)"

# Bash completion for pass.
source /usr/local/etc/bash_completion.d/password-store

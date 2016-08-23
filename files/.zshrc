# Run time configuration for zsh.
# Adam Heins

# ================================= Globals ================================== #

# Store the name of the OS globally.
export OS=$(uname)

# ================================= General ================================== #

# Don't wait around after hitting a prefix key.
export KEYTIMEOUT=1

# Automatically push all directories into the dir stack.
setopt AUTO_PUSHD

# Command history.
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh/.history
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# Use neovim as editor.
export VISUAL=nvim
export EDITOR="$VISUAL"

# Use vi-style command line editing mode.
bindkey -v

# Bind esc to a noop to avoid it eating a character in vicmd mode.
noop() {}
zle -N noop
bindkey -M vicmd '\e' noop

# Fix default delete key behaviour for vi mode.
bindkey "^?" backward-delete-char

# Custom ls colors.
if [ $OS = "Darwin" ]; then
  export LSCOLORS="gxfxcxdxbxegedabagacad"
else
  eval "`dircolors ~/.dircolors`"
fi

# Turn off legacy behaviour of stopping/resuming tty I/O.
stty -ixon

# ================================== Prompt ================================== #

export PS1='%F{11}%n@%m %F{245}%~ %F{11}$ %F{250}'

# Change prompt based on vi mode.
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) export PS1='%F{139}%n@%m %F{245}%~ %F{139}$ %F{250}' ;;
    viins|main) export PS1='%F{11}%n@%m %F{245}%~ %F{11}$ %F{250}' ;;
  esac
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# ================================= External ================================= #

# Configuration common on all systems.
if [ -f ~/.zsh/.commonrc ]; then
  source ~/.zsh/.commonrc
fi

# Configuration local to this system.
if [ -f ~/.zsh/.localrc ]; then
  source ~/.zsh/.localrc
fi

# ============================== Autocompletion ============================== #

autoload -U compinit
compinit -D

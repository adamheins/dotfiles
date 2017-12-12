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

# Turn off legacy behaviour of stopping/resuming tty I/O.
stty -ixon

# Set up special environment variables.
# -U disallows duplicate entries
# -T creates the special coupling
export -U PATH path
export -U MANPATH manpath
export -U FPATH fpath
export -UT PYTHONPATH pythonpath
export -UT INFOPATH infopath
export -UT XDG_DATA_DIRS xdg_data_dirs

# ================================== Prompt ================================== #

export PS1='%F{222}%n@%m %F{245}%~ %F{222}$ %F{250}'

# Change prompt based on vi mode.
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) export PS1='%F{139}%n@%m %F{245}%~ %F{139}$ %F{250}' ;;
    viins|main) export PS1='%F{222}%n@%m %F{245}%~ %F{222}$ %F{250}' ;;
  esac
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# =================================== Brew =================================== #

# The expectation is that brew is either installed at ~/.linuxbrew or
# ~/.linuxbrew is symlinked to the actual install location.
BREW_PATH=~/.linuxbrew

if [ -d $BREW_PATH ]; then
  path=($BREW_PATH/bin $BREW_PATH/sbin $path)
  fpath=($BREW_PATH/share/zsh/site-functions $fpath)
  manpath=($BREW_PATH/share/man $manpath)
  infopath=($BREW_PATH/share/info $infopath)
  xdg_data_dirs=($BREW_PATH/share $xdg_data_dirs)
  pythonpath=($BREW_PATH/lib/python2.7/site-packages $pythonpath)
fi

# ================================= External ================================= #

# Configuration common on all systems.
if [ -f ~/.zsh/common.zsh ]; then
  source ~/.zsh/common.zsh
fi

# Configuration local to this system.
if [ -f ~/.zsh/local.zsh ]; then
  source ~/.zsh/local.zsh
fi

# ============================== Autocompletion ============================== #

autoload -U compinit
compinit -D

# ================================= Plugins ================================== #

# Plugins are managed using antigen.

antigen bundle adamheins/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

antigen apply


#==============================================================================#
#                                    ZSHRC                                     #
#==============================================================================#

#---------------------------------- General -----------------------------------#

# Autocompletion.
autoload -U compinit
compinit

# Don't wait around after hitting a prefix key.
export KEYTIMEOUT=1

# Automatically push all directories into the dir stack.
setopt AUTO_PUSHD

# Command history.
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# Use vi-style command line editing mode.
bindkey -v

# Use vim as editor.
export VISUAL=vim
export EDITOR="$VISUAL"

# Prompt.
export PS1='%F{4}%n@%m %F{6}%~ %F{4}~> %F{250}'

# Change prompt based on vi mode.
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) export PS1='%F{4}%n@%m %F{6}%~ %F{4}~> %F{250}' ;;
    viins|main) export PS1='%F{10}%n@%m %F{6}%~ %F{10}~> %F{250}' ;;
  esac
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Fix default delete key behaviour for vi mode.
bindkey "^?" backward-delete-char

#----------------------------- External Programs ------------------------------#

# Executables.
[ -d ~/.zsh/bin ] && export PATH=~/.zsh/bin:$PATH

# Aliases.
[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.zsh

# Scripts.
if [ -d ~/.zsh/source ]; then
  for f in ~/.zsh/source/*.sh; do source "$f"; done
  for f in ~/.zsh/source/*.zsh; do source "$f"; done
fi

# Local configuration.
if [ -d ~/.zsh/local ]; then
  for f in ~/.zsh/local/*.sh; do source "$f"; done
  for f in ~/.zsh/local/*.zsh; do source "$f"; done
fi

# Tmux.
[ -f ~/.zsh/custom/tmux.sh ] && source ~/.zsh/custom/tmux.sh

# Use vi-style command line editing mode.
bindkey -v

# Change prompt based on vi mode.
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) PS1='%F{4}%n@%m %F{6}%~ %F{4}~> %F{250}' ;;
    viins|main) PS1='%F{10}%n@%m %F{6}%~ %F{10}~> %F{250}' ;;
  esac
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Fix default delete key behaviour for vi mode.
bindkey "^?" backward-delete-char

# Don't wait around after hitting a prefix key.
export KEYTIMEOUT=1

# Use vim as editor.
export VISUAL=vim
export EDITOR="$VISUAL"

# Automatically push all directories into the dir stack.
setopt AUTO_PUSHD

# Prompt
export PS1='%F{10}%n@%m %F{3}%~ %F{10}~> %F{250}'

# Autocompletion.
autoload -U compinit
compinit

# Aliases.
[ -f ~/.aliases ] && source ~/.aliases

# Custom shell scripts.
if [ -d ~/.scripts/source/zsh ]; then
  for f in ~/.scripts/source/zsh/*; do
    source "$f"
  done
fi

# External scripts.
if [ -d ~/.scripts/source/ext/zsh ]; then
  for f in ~/.scripts/source/ext/zsh/*; do
    source "$f"
  done
fi

# Custom executables.
[ -d ~/.scripts/exec ] && export PATH=~/.scripts/exec:$PATH

# Launch tmux automatically.
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux
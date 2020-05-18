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
export -UT LD_LIBRARY_PATH ld_library_path
export -UT PYTHONPATH pythonpath
export -UT INFOPATH infopath
export -UT XDG_DATA_DIRS xdg_data_dirs

# Initialize the manpath.
manpath=(/usr/share/man)

# ================================== Prompt ================================== #

# Change the prompt if we're in a Docker container.
has_docker=""
if [ -f /.dockerenv ]; then
  has_docker="%F{110}(D)"
fi

# %(5~|%-1~/…/%3~|%4~) limits the CWD of 5 or more components to a/.../b/c/d.
prompt_ins="$has_docker%F{222}%n@%m %F{245}%(5~|%-1~/…/%3~|%4~) %F{222}$ %F{250}"
prompt_cmd="$has_docker%F{139}%n@%m %F{245}%(5~|%-1~/…/%3~|%4~) %F{139}$ %F{250}"

export PS1=$prompt_ins

# Change prompt based on vi mode.
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) export PS1=$prompt_cmd ;;
    viins|main) export PS1=$prompt_ins ;;
  esac
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# ================================= External ================================= #

# Configuration common on all systems.
if [ -f ~/.zsh/common.zsh ]; then
  source ~/.zsh/common.zsh
fi

# Local completions
if [ -d ~/zsh/comp ]; then
  fpath=(~/zsh/comp $fpath)
fi

# Local scripts to be sourced.
# Note the glob pattern:
#   .  Match plain files
#   ,  "OR"
#   @  Match symbolic files
#   N  NULL_GLOB - don't print an error if nothing matched
if [ -d ~/zsh/scripts ]; then
  for f in ~/zsh/scripts/*.sh(.,@N); do source "$f"; done
  for f in ~/zsh/scripts/*.zsh(.,@N); do source "$f"; done
fi

# ============================== Autocompletion ============================== #

autoload -U compinit
compinit -D

# ================================= Plugins ================================== #

# Plugins are managed using antigen.

antigen bundle adamheins/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

antigen apply


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

# get pretty string of Python virtualenv name
get_py_venv() {
  py_venv=""
  if [ -n "$VIRTUAL_ENV" ]; then
    py_venv=$(basename $VIRTUAL_ENV)
    py_venv="%F{112}(${py_venv:0:10})"
  fi
}

# %(5~|%-1~/…/%3~|%4~) limits the CWD of 5 or more components to a/.../b/c/d.
prompt_ins="$has_docker$py_venv%F{222}%n@%m %F{245}%(5~|%-1~/…/%3~|%4~) %F{222}$ %F{250}"
prompt_cmd="$has_docker$py_venv%F{139}%n@%m %F{245}%(5~|%-1~/…/%3~|%4~) %F{139}$ %F{250}"

export PS1=$prompt_ins

# since the virtualenv could change at any point, we need to update it each
# before each command prompt
# TODO this should probably be added to precmd_functions rather than defined
# like this
precmd() {
  # warn if isig was disabled for some reason
  stty -a | fgrep -- -isig > /dev/null
  if [ $? -eq 0 ]; then
    echo "\033[0;36mISIG FOUND: running stty sane\033[0m"
    stty sane
  fi

  get_py_venv
  prompt_ins="$has_docker$py_venv%F{222}%n@%m %F{245}%(5~|%-1~/…/%3~|%4~) %F{222}$ %F{250}"
  prompt_cmd="$has_docker$py_venv%F{139}%n@%m %F{245}%(5~|%-1~/…/%3~|%4~) %F{139}$ %F{250}"
  export PS1=$prompt_ins
}

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


# ============================= Basic utilities ============================== #

# Source all scripts in a directory.
sourcedir() {
  [ -z "$1" ] && return 1
  # Note the glob pattern:
  #   .  Match plain files
  #   ,  "OR"
  #   @  Match symbolic files
  #   N  NULL_GLOB - don't print an error if nothing matched
  if [ -d "$1" ]; then
    for f in "$1"/*.sh(.,@N); do source "$f"; done
    for f in "$1"/*.zsh(.,@N); do source "$f"; done
  fi
}

# Return 0 exit code if executable exists on the path.
onpath() {
  [ -z "$1" ] && return 1
  command -v "$1" > /dev/null 2>&1 && return 0
  return 1
}


# ============================== Common config =============================== #

if [ -d ~/.zsh/bin ]; then
  path=(~/.zsh/bin $path)
fi

if [ -d ~/.zsh/comp ]; then
  fpath=(~/.zsh/comp $fpath)
fi

sourcedir ~/.zsh/scripts


# =============================== Local config =============================== #

if [ -d ~/bin ]; then
  path=(~/bin $path)
fi

if [ -d ~/.local/bin ]; then
  path=(~/.local/bin $path)
fi

if [ -d ~/zsh/comp ]; then
  fpath=(~/zsh/comp $fpath)
fi

sourcedir ~/zsh/scripts


# ============================== Autocompletion ============================== #

autoload -U compinit
compinit -D


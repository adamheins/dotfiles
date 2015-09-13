#!/bin/bash

# Useful utilities

# Make a directory and change to it.
mkcd() {
  mkdir -p "$@"
  cd "$@"
}

# Update the tmux config.
update_tmux_config() {
  tmux source-file ~/.tmux.conf
}

# Update xterm config.
update_xterm_config() {
  xrdb -merge ~/.Xresources
}

# Run a command an arbitrary number of times.
repeat() {
  for((i=0; i<"$1"; i++)); do
    ${@:2}
  done
}

# Run a process that is detached from the shell.
detach() {
  nohup "$@" >/dev/null 2>&1 &
}

# Open a file in vim that is in a subdirectory of the cwd.
vimf() {
  vim $(find . -name "$1")
}



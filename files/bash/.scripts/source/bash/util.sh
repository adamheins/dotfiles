#!/bin/bash

# Useful utilities

# Make a directory and change to it.
mkcd() {
  mkdir -p "$@" && cd "$@"
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

# Print OS version.
version() {
  echo $(sw_vers -productVersion)
}

# Move all files in a directory to another directory in that directory.
mvall() {
  # Remove trailing "/" if necessary.
  to_dir="${1%/}"
  GLOBIGNORE="$to_dir"
  mv * "$to_dir"
  GLOBIGNORE=
}

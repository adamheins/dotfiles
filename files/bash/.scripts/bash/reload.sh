#!/bin/bash

# Reload configuration files.
reload() {
  # With no arguments, the default action is to reload the bash profile.
  if [ -z "$1" ]; then
    . ~/.bash_profile
    return 0
  fi
  for cmd in "$@"
  do
    case "$cmd" in
      bash)
        . ~/.bash_profile
        ;;
      tmux)
        tmux source-file ~/.tmux.conf
        ;;
      xterm)
        xrdb -merge ~/.Xresources
        ;;
      all)
        . ~/.bash_profile
        tmux source-file ~/.tmux.conf
        xrdb -merge ~/.Xresources
        ;;
    esac
  done
  return 0
}

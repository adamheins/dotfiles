#!/bin/bash

reload() {
  if [ -z "$1" ]; then
    . ~/.bash_profile
    return 0
  fi
  case "$1" in
    tmux)
      tmux source-file ~/.tmux.conf
      ;;
    xterm)
      xrdb -merge ~/.Xresources
      ;;
  esac
  return 0
}

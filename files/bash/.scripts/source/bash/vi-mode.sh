#!/bin/bash
get-vi-mode() {
  local mode=$(bind -v | awk '/keymap/ {print $NF}')
  if [ "$mode" == "vi-insert" ]; then
    echo "insert"
  else
    echo "command"
  fi
}


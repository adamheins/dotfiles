#!/bin/bash

# Print all of the terminal colors.
colors() {
  local count=0
  local cols=$(tput cols)
  for i in {0..255}; do
    ((count+=4))
    if [ $count -gt $cols ]; then
      printf "\n"
      count=4
    fi
    printf "\x1b[38;5;${i}m%03s " "${i}"
  done
  printf "\n"
}

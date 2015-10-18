#!/bin/zsh

# General function for interacting with the adamheins.com server.
#
# git
#   init - Initializes a bare repository at git@adamheins.com:repo_name
#   list - Lists all of the directorys located at git@adamheins.com

pluto() {
  case "$1" in
    "git")
      case "$2" in
        "init")
          if [ -z "$3" ]; then
            ssh git@adamheins.com bash -c "'
              git init --bare $(basename `git rev-parse --show-toplevel`)
            '"
          else
            ssh git@adamheins.com bash -c "'
              git init --bare $3
            '"
          fi
          ;;
        "list")
          ssh git@adamheins.com bash -c "'
            ls -d */
          '"
          ;;
      esac
      ;;
  esac
}

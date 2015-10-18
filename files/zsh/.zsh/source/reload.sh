#!/bin/zsh

# Reload configuration files.
reload() {
  # With no arguments, the default action is to reload the current shell
  # configuration.
  if [ -z "$1" ]; then
    case "$(basename "$SHELL")" in
      bash) source ~/.bash_profile ;;
      zsh) source ~/.zshrc ;;
    esac
    return 0
  fi

  for cmd in "$@"
  do
    case "$cmd" in
      zsh) source ~/.zshrc ;;
      bash) source ~/.bash_profile ;;
      tmux) tmux source-file ~/.tmux.conf ;;
      xterm) xrdb -merge ~/.Xresources ;;
      all)
        source ~/.zshrc
        tmux source-file ~/.tmux.conf
        xrdb -merge ~/.Xresources
        ;;
    esac
  done
  return 0
}

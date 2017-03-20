# Use Tmux Plugin Manager from the command line.
tpm() {
  if [ -z $1 ]; then
    echo "usage: tpm {init|install|update|clean}"
    return 0
  fi

  case "$1" in
    "init")
      [ ! -d ~/.tmux/plugins ] && mkdir -p ~/.tmux/plugins
      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ;;
    "install")
      ~/.tmux/plugins/tpm/bin/install_plugins
    ;;
    "update")
      ~/.tmux/plugins/tpm/bin/update_plugins all
    ;;
    "clean")
      ~/.tmux/plugins/tpm/bin/clean_plugins
    ;;
  esac
}

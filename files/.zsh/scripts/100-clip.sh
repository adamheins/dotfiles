# Clipboard utility.
cb() {
  case "$1" in
    -h|--help)
      echo "usage: cb [text]"
      echo ""
      echo "If text is provided, it is copied, otherwise current clipboard is"
      echo "pasted."
  esac

  case $OS in
    # Use macOS tools on macOS.
    Darwin)
      if [ -z "$1" ]; then
        pbpaste
      else
        pbcopy < "$1"
      fi
    ;;

    # Use xclip on Linux.
    *)
      if [ -z "$1" ]; then
        xclip -selection clipboard -o
      else
        echo "$1" > /tmp/cb.txt
        xclip -selection clipboard -i < /tmp/cb.txt
      fi
    ;;
  esac
}

# Clipboard utility.
cb() {
  case $OS in
    Darwin)
      if [ -z $1 ]; then
        pbpaste
      else
        pbcopy < "$1"
      fi
    ;;
    *)
      if [ -z $1 ]; then
        xclip -selection clipboard -o
      else
        xclip -selection clipboard -i < "$1"
      fi
    ;;
  esac
}

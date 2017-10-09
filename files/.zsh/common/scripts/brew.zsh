# If we've got linuxbrew installed, set it up.
if [ ! $(uname) = "Darwin" ] && [ -d ~/.linuxbrew ]; then
  case ":$PATH:" in
    *:$HOME/.linuxbrew/bin:*) ;;
    *)
      export PATH="$HOME/.linuxbrew/bin:$PATH"
      export PATH="$HOME/.linuxbrew/sbin:$PATH"
      export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
      export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
      export XDG_DATA_DIRS="/home/adam/.linuxbrew/share:$XDG_DATA_DIRS"
    ;;
  esac
fi

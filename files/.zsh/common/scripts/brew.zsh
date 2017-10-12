# If we've got linuxbrew installed, set it up.
if [ ! $(uname) = "Darwin" ] && [ -d ~/.linuxbrew ]; then
  case ":$PATH:" in
    *:$HOME/.linuxbrew/bin:*) ;;
    *)
      export PATH="$PATH:$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin"
      export MANPATH="$MANPATH:$HOME/.linuxbrew/share/man"
      export INFOPATH="$INFOPATH:$HOME/.linuxbrew/share/info"
      export XDG_DATA_DIRS="$XDG_DATA_DIRS:/home/adam/.linuxbrew/share"
    ;;
  esac
fi

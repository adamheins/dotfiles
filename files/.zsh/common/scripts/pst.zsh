# Add cut/copy/paste functionality to the shell, much the same way it works in
# other parts of the system.

PST_DIR=$HOME/.pst

# Behaves the same as normal `cp', unless exactly one non-flag argument is
# passed. If that is the case, it copies the file or directory for later
# pasting.
cp() {
  # If only a single non-option argument was passed to cp, this special version
  # of cp is used.
  if [ -n $1 ] && [ -z $2 ]; then
    first_char=$(echo "$1" | cut -c1)
    if [ "$first_char" != "-" ]; then

      # Create the pst directory if it doesn't exist.
      [ ! -d $PST_DIR ] && mkdir $PST_DIR

      # Remove current contents of the pst directory.
      setopt localoptions rmstarsilent
      stat "$1" >/dev/null 2>&1 && rm -rf $PST_DIR/*(N)

      # Copy the src to the dest in the pst directory.
      local src="$1"
      local dest=$PST_DIR/$(basename "$1")
      if [ -d "$1" ]; then
        cp -r "$src" "$dest"
      else
        cp "$src" "$dest"
      fi
      return
    fi
  fi

  # Otherwise, fallback to normal built-in cp.
  command cp "$@"
}

# Behaves the same as normal `mv', unless exactly one non-flag argument is
# passed. If that is the case, it cuts the file or directory for later
# pasting.
mv() {
  if [ -n $1 ] && [ -z $2 ]; then
    first_char=$(echo "$1" | cut -c1)
    if [ "$first_char" != "-" ]; then
      [ ! -d $PST_DIR ] && mkdir $PST_DIR
      setopt localoptions rmstarsilent
      stat "$1" >/dev/null 2>&1 && rm -rf $PST_DIR/*(N)
      mv "$1" $PST_DIR/$(basename "$1")
      return
    fi
  fi
  command mv "$@"
}

# Paste the last files or directories that were cut or copied.
pst() {
  [ ! -d $PST_DIR ] && return
  if [ -z $1 ]; then
    ls $PST_DIR
    cp -r $PST_DIR/* .
  else
    case "$1" in
      "-l"|"--list") command ls -A $PST_DIR ;;
      "-h"|"--help")
        echo "usage: pst [-chl] [dest]"
        echo ""
        echo "arguments:"
        echo "  -c, --clean  Remove all files from \$PST_DIR."
        echo "  -h, --help   Print this help message."
        echo "  -l, --list   List files in the \$PST_DIR."
      ;;
      "-c"|"--clean")
        setopt localoptions rmstarsilent
        rm -rf $PST_DIR/*(N)
      ;;
      *) cp -r $PST_DIR/* "$1" ;;
    esac
  fi
}

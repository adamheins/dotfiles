# Add cut/copy/paste functionality to the shell, much the same way it works in
# other parts of the system.

PST_DIR=$HOME/.pst

# Behaves the same as normal `cp', unless exactly one non-flag argument is
# passed. If that is the case, it copies the file or directory for later
# pasting.
cp() {
  if [ -n $1 ] && [ -z $2 ]; then
    first_char=$(echo "$1" | cut -c1)
    if [ "$first_char" != "-" ]; then
      [ ! -d $PST_DIR ] && mkdir $PST_DIR
      setopt localoptions rmstarsilent
      stat "$1" >/dev/null 2>&1 && rm -rf $PST_DIR/*(N)
      cp -r "$1" "$PST_DIR/$1"
      return
    fi
  fi
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
      mv "$1" "$PST_DIR/$1"
      return
    fi
  fi
  command mv "$@"
}

# Paste the last files or directories that were cut or copied.
pst() {
  [ ! -d $PST_DIR ] && return
  if [ -z $1 ]; then
    cp -r $PST_DIR/* .
  else
    case "$1" in
      "-l"|"--list") ls -A $PST_DIR ;;
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

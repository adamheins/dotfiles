# Useful utilities

# Make a directory and change to it.
mkcd() {
  mkdir -p "$@" && cd "$@"
}

# Run a command an arbitrary number of times.
# (do x times)
dox() {
  for ((i=0; i<$1; i++)); do
    ${@:2}
  done
}

# Run a process as a daemon.
d() {
  [ -z "$1" ] && return 1
  nohup "$@" >/dev/null 2>&1 &
}

# Print OS information.
os() {
  if [ -z $1 ]; then
    echo $(uname)
  else
    case $1 in
      -v|--version) echo $(sw_vers -productVersion) ;;
      *) return 1 ;;
    esac
  fi
}

# Move all files in a directory to another directory in that directory.
# Creates the directory if it does not exist.
nest() {
  for f in $(pwd)/*; do
    if [ ! -d "$1" ]; then
      mkdir "$1"
    fi
    if [ $(basename $f) != "$1" ]; then
      mv "$f" "$1"
    fi
  done
}

# Move everything out of a directory.
unnest() {
  if [ -z $1 ]; then
    mv ./* ..
  else
    mv "$1"/* .
  fi
}

# Find by name.
findn() {
  find . -name "$1"
}

# Find by substring: only part of the name is required.
finds() {
  find . -name "*$1*"
}

# Symlinking without the hassle of non-relative paths.
lns() {
  ln -s $(realpath "$1") "$2"
}

# I'm always afraid I'll forget to type the double `>'.
append() {
  cat "$1" >> "$2"
}

# List most recent files in directory.
recent() {
  if [ -z "$1" ]; then
    ls -rt | tail -n 1
  else
    ls -rt | tail -n "$1"
  fi
}

define() {
  dict "$1" | less
}

synonym() {
  dict -d moby-thesaurus "$1"
}

# Zip a directory.
zipdir() {
  zip -r "$1".zip "$1"
}

# Tar a directory.
tardir() {
  tar -zcvf "$1".tar.gz "$1"
}

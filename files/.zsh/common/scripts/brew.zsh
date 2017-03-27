# If we've got linuxbrew installed, set it up.
if [ ! $(uname) = "Darwin" ] && [ -d ~/.linuxbrew ]; then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi

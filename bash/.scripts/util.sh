# Useful utilities

# Make a directory and change to it in one command.
mkcd () {
    mkdir -p "$*"
    cd "$*"
}

# Update the tmux config.
update_tmux_config() {
    tmux source-file ~/.tmux.conf
}

# Update xterm config.
update_xterm_config() {
  xrdb -merge ~/.Xresources
}

# Run a command an arbitrary number of times.
do_x_times() {
  for((i=0; i<$1; i++)); do
    ${@:2}
  done
}

# Run a process that is detached from the shell.
run_detached() {
  nohup $1 &
}


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

# Open a file in vim that is in a subdirectory of the cwd.
vimf() {
  vim $(find . -name $1)
}

# "Smart waf" - chooses to use python or pypy depending on the argument.
swaf() {
  if [ $1 = "clean" ] && [ $# -eq 1 ]; then
    python waf "$@"
  else
    pypy waf "$@"
  fi
}

#update_tmux_status() {
#  tmux set -g status-right "#[fg=black] [$GIT_BRANCH] | %l:%M %p | %Y-%m-%d "
#}
#
## Get the name of the current git branch.
#if [ $(git rev-parse --is-inside-work-tree) ]; then
#  GIT_BRANCH=$(git symbolic-ref -q HEAD)
#  GIT_BRANCH=${GIT_BRANCH##refs/heads/}
#  GIT_BRANCH=${GIT_BRANCH:-HEAD}
#  PROMPT_COMMAND="update_tmux_status; $PROMPT_COMMAND"
#fi

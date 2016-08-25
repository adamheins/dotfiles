#!/bin/zsh

# If the cwd is a git repo, display the branch name in the tmux status bar.
_update_tmux_status() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
    local branch short_branch
    branch=$(git symbolic-ref -q HEAD)
    branch=${branch##refs/heads/}
    branch=${branch:-HEAD}
    short_branch=$(echo "$branch" | cut -c1-40)
    if [ ${#branch} -gt ${#short_branch} ]; then
      short_branch=${short_branch}...
    fi
    tmux set -g status-right "#[fg=colour139] [$short_branch] #[fg=colour243]| #[fg=white]%I:%M %p #[fg=colour243]| #[fg=white]%Y-%m-%d "
  else
    tmux set -g status-right "#[fg=white] %I:%M %p #[fg=colour243]| #[fg=white]%Y-%m-%d "
  fi
}

# Restart the current tmux-pane anew.
restart() {
  [ -z $TMUX ] && return 1
  tmux restart-pane -k
}

# Shortcut to even out the current tmux layout.
layout() {
  [ -z $TMUX ] && return 1

  local usage_text="usage: layout {h|v|t}"

  if [ -z $1 ]; then
    echo $usage_text
    return 1
  fi

  case "$1" in
    "h"|"horizontal") tmux select-layout even-horizontal ;;
    "v"|"vertical")   tmux select-layout even-vertical ;;
    "t"|"tiled")      tmux select-layout tiled ;;
    "-h"|"--help") echo $usage_text ;;
    *) echo "unrecognized argument '$1'" ;;
  esac
}

# We generally don't want to run tmux in an ssh session.
if [ -z "$SSH_CLIENT" ] || [ -z "$SSH_TTY" ]; then
  precmd_functions=(_update_tmux_status)

  # Lower the current tmux window to the lowest available index.
  tmux bind \< run "tmux-window-lower"

  # Lower all windows to the lowest available indices.
  tmux bind / run "tmux-window-lower --all"

  # Only start tmux when the session is interactive.
  if [[ $- == *i* ]] && [ -z "$TMUX" ]; then
    if ! tmux list-sessions; then
      tmux -2
    else
      echo "Tmux sessions exist. Run 'tmux attach-session -t <num>' to restore one."
    fi
  fi
fi


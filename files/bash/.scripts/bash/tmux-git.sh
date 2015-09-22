#/bin/bash

# If the cwd is a git repo, display the branch name in the tmux status bar.
_update_tmux_status() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
    local branch short_branch
    branch=$(git symbolic-ref -q HEAD)
    branch=${branch##refs/heads/}
    branch=${branch:-HEAD}
    short_branch=$(echo "$branch" | cut -c1-20)
    if [ ${#branch} -gt ${#short_branch} ]; then
      short_branch=${short_branch}...
    fi
    tmux set -g status-right "#[fg=black] [$short_branch] | %l:%M %p | %Y-%m-%d "
  else
    tmux set -g status-right "#[fg=black] %l:%M %p | %Y-%m-%d "
  fi
}

PROMPT_COMMAND="_update_tmux_status; $PROMPT_COMMAND"

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
    tmux set -g status-right "#[fg=colour006] [$short_branch] #[fg=colour243]| #[fg=white]%I:%M %p #[fg=colour243]| #[fg=white]%Y-%m-%d "
  else
    tmux set -g status-right "#[fg=white] %I:%M %p #[fg=colour243]| #[fg=white]%Y-%m-%d "
  fi
}

precmd_functions=(_update_tmux_status)

# Launch tmux
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

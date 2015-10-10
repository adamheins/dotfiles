#/bin/bash

# If the cwd is a git repo, display the branch name in the tmux status bar.
get_git_branch() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
    local branch short_branch
    branch=$(git symbolic-ref -q HEAD)
    branch=${branch##refs/heads/}
    branch=${branch:-HEAD}
    short_branch=$(echo "$branch" | cut -c1-20)
    if [ ${#branch} -gt ${#short_branch} ]; then
      short_branch=${short_branch}...
    fi
    GIT_BRANCH=$short_branch
  else
    GIT_BRANCH=
  fi
}

PROMPT_COMMAND="get_git_branch; $PROMPT_COMMAND"

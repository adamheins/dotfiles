# Short form for `git status'. Adds the ability to use it on directories
# besides the current one, much like `ls'.
function gs() {
  if [ -z $1 ]; then
    git status
  else
    echo "In repository $1"
    git --git-dir=$1/.git --work-tree=$1 status
  fi
}

# Git add.
function ga() {
  if [ -z "$1" ]; then
    git add -A
  else
    git add ${@:1}
  fi
}

alias gb="git branch"
alias gc="git commit"
alias gp="git pull"
alias gch="git checkout"
alias gg="git grep"
alias grhh="git reset --hard HEAD"
alias grl="git revert HEAD"
alias g-="git checkout -"
alias gl="git log"
alias gd="git diff"
alias gdl="git diff HEAD~1..HEAD"

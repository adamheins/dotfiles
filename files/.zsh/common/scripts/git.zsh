# Sourced here:
# https://gist.github.com/2491147
#
# Modified and augmented by Adam Heins
#
# Usage: git submodule rm [-c] <path/to/submodule>
# You must be in the root of the git repository to use this command. The -c
# (or --clean) option indicates that the submodule files should also be removed
# from the working tree.

function actual_path() {
  if [ [ -z "$1" ] -a [ -d $1 ] ]; then
    echo $(cd $1 && test `pwd` = `pwd -P`)
    return 0
  else
    return 1
  fi
}

function is_submodule() {
  local top_level parent_git module_name

  if [ -d "$1" ]; then
    cd $1
  else
    return 1
  fi

  # Find the root of this git repo, then check if its parent dir is also a repo
  top_level="$(git rev-parse --show-toplevel)"
  if [ ! actual_path $toplevel ]; then
    top_level="$(cd $top_level && pwd -P)"
  fi

  module_name="$(basename "$top_level")"
  parent_git="$(cd "$top_level/.." && git rev-parse --show-toplevel 2> /dev/null)"

  if [[ -n $parent_git ]]; then
    return 0
  else
    return 1
  fi
}

function is_gitroot() {
  if [ "$(pwd -P)" = "$(git rev-parse --show-toplevel)" ]; then
    return 0
  else
    return 1
  fi
}

function remove_submodule() {
  local module clean
  if [[ "$1" == "-c" || "$1" == "--clean" ]]; then
    module="$2"
    clean=1
  else
    module="$1"
    [[ "$2" == "-c" || "$2" == "--clean" ]] && clean=1
  fi

  # Check that the path is valid
  if [ ! -d "$module" ]; then
    echo "usage: git submodule rm [-c] path"
    return 1
  fi

  # then check whether we're at git root
  if is_gitroot; then
    # finally check whether the given path is a submodule
    if $(is_submodule "${module}"); then
      # using ${1%/} to remove trailing slashes
      git config -f .gitmodules --remove-section submodule.${module%/}
      git config -f .git/config --remove-section submodule.${module%/}
      git add .gitmodules
      git rm --cached ${module%/}
      [[ $clean == 1 ]] && rm -r "$module"
      git status
    else
      echo "git submodule rm is not recursive, aborting."
    fi
  else
    echo "You need to run this command from the toplevel of the working tree."
  fi
}

# Wrapper for git that adds additional submodule functionality.
function git() {
  if [[ $argv[1] == 'submodule' && $argv[2] == 'rm' ]]; then
    remove_submodule $argv[3,-1]
  else
    command git "$@";
  fi;
}

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

# Open all merge conflicts in vim.
function gcon() {
  # Change directory to the root of the git repo. This allows the function to
  # work from anywhere in the repo's tree.
  cd $(git rev-parse --show-toplevel)
  vim +/"<<<<<<<" $(git diff --name-only --diff-filter=U | xargs)
}

# Delete all git stuff from a directory.
ungit() {
  if [ -z "$1" ]; then
    echo "Ungitting $(pwd)"
    rm -r .git*
  else
    rm -r "$1"/.git*
    echo "Ungitting $(pwd)/$1"
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

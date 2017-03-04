# General ROS configuration.

catkin() {
  local cur_dir=$(pwd)
  local catkin_dir=$(catkin_toplevel)

  # Bail if we're not in a catkin workspace.
  if [ -z $catkin_dir ]; then
    echo "Not in a catkin workspace."
    return 1
  fi

  cd $catkin_dir


  case $1 in
    "-s"|"--source-only")
      source devel/setup.zsh
    ;;
    *)
      catkin_make && source devel/setup.zsh
    ;;
  esac

  cd $cur_dir
}

alias ck="catkin"
alias cks="catkin -s"

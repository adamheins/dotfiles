# General ROS configuration.

source /opt/ros/indigo/setup.zsh

catkin() {
  local cur_dir=$(pwd)
  local catkin_dir=$(catkin_toplevel)
  cd $catkin_dir

  catkin_make && source devel/setup.zsh

  # I'll optionally include a config.zsh file in the root of the workspace to
  # setup things like network parameters.
  case $1 in
    "remote")
      [ -f remote.zsh ] && source config.zsh
    ;;
    *)
      [ -f local.zsh ] && source local.zsh
    ;;
  esac

  cd $cur_dir
}

# If we've got linuxbrew installed, set it up.
if [ ! $(uname) = "Darwin" ] && [ -d ~/.linuxbrew ]; then
  path=($HOME/.linuxbrew/bin $HOME/.linuxbrew/sbin $path)
  fpath=(/home/linuxbrew/.linuxbrew/share/zsh-completions $fpath)
  manpath=($HOME/.linuxbrew/share/man $manpath)
  infopath=($HOME/.linuxbrew/share/info $infopath)
  xdg_data_dirs=($HOME/.linuxbrew/share $xdg_data_dirs)
fi

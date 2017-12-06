# If we've got brew installed, set it up.
brewpath=~/.linuxbrew

if [ ! $(uname) = "Darwin" ] && [ -d $brewpath ]; then
  path=($brewpath/bin $brewpath/sbin $path)
  fpath=($brewpath/share/zsh-completions $fpath)
  manpath=($brewpath/share/man $manpath)
  infopath=($brewpath/share/info $infopath)
  xdg_data_dirs=($brewpath/share $xdg_data_dirs)
  pythonpath=($brewpath/lib/python2.7/site-packages $pythonpath)
fi

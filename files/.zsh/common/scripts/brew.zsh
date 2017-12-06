# If we've got brew installed, set it up.

# The expectation is that brew is either installed at ~/.linuxbrew or
# ~/.linuxbrew is symlinked to the actual install location.
BREW_PATH=~/.linuxbrew

if [ -d $BREW_PATH ]; then
  path=($BREW_PATH/bin $BREW_PATH/sbin $path)
  fpath=($BREW_PATH/share/zsh-completions $fpath)
  manpath=($BREW_PATH/share/man $manpath)
  infopath=($BREW_PATH/share/info $infopath)
  xdg_data_dirs=($BREW_PATH/share $xdg_data_dirs)
  pythonpath=($BREW_PATH/lib/python2.7/site-packages $pythonpath)
fi

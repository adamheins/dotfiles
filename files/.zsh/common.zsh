# Directories.
here=${0:a:h}
common=$here/common
scripts=$common/scripts

# Scripts to be sourced.
if [ -d $scripts ]; then

  # Scripts to be sourced before the others. Should not depend on each other.
  if [ -d $scripts/before ]; then
    for f in $scripts/before/*.sh(.N); do source "$f"; done
    for f in $scripts/before/*.zsh(.N); do source "$f"; done
  fi

  for f in $scripts/*.sh(.N); do source "$f"; done
  for f in $scripts/*.zsh(.N); do source "$f"; done
fi

# Completions.
if [ -d $common/comp ]; then
  fpath=($common/comp $path)
fi

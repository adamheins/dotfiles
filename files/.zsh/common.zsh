# Directories.
here=${0:a:h}
common_dir=$here/common
scripts_dir=$common_dir/scripts
comp_dir=$common_dir/comp
bin_dir=$common_dir/bin

# Scripts to be sourced.
if [ -d $scripts_dir ]; then
  for f in $scripts_dir/*(.,@N); do source "$f"; done
fi

# Completions.
if [ -d $comp_dir ]; then
  fpath=($comp_dir $path)
fi

# Executables.
if [ -d $bin_dir ]; then
  path=($bin_dir $path)
fi

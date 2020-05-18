local_dir=${0:a:h}/local
local_scripts_dir=$local_dir/scripts
local_comp_dir=$local_dir/comp
local_bin_dir=$local_dir/bin

# Completions.
if [ -d $local_comp_dir ]; then
  fpath=($local_comp_dir $fpath)
fi

# Executables.
if [ -d $local_bin_dir ]; then
  path=($local_bin_dir $path)
fi

# Scripts to be sourced.
# Note the glob pattern:
#   .  Match plain files
#   ,  "OR"
#   @  Match symbolic files
#   N  NULL_GLOB - don't print an error if nothing matched
if [ -d $local_scripts_dir ]; then
  for f in $local_scripts_dir/*.sh(.,@N); do source "$f"; done
  for f in $local_scripts_dir/*.zsh(.,@N); do source "$f"; done
fi

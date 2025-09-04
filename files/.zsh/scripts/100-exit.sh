# deactivate Python virtualenv if one is activate, otherwise exit the shell
function x() {
  if [ -n "$VIRTUAL_ENV" ]; then
    deactivate
  elif [ -n "$CONDA_DEFAULT_ENV" ]; then
    conda deactivate
  else
    exit
  fi
}

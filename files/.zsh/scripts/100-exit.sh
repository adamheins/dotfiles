# deactivate Python virtualenv if one is activate, otherwise exit the shell
function x() {
  if [ -n "$VIRTUAL_ENV" ]; then
    deactivate
  else
    exit
  fi
}

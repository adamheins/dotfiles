# Check if an executable exists on the path.
onpath() {
  if [ -z $1 ]; then
    return 1
  fi

  if command -v "$1" > /dev/null 2>&1; then
    return 0
  fi

  return 1
}

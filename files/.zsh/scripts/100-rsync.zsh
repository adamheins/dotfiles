# Convenience functions for rsyncing.

# Push files to the destination.
rpush() {
  if [ -f .rsync ]; then
    config=$(cat .rsync)
    dest=$(echo $config | head -n 1)
    opts=($(echo $config | tail -n 1))
    if [[ -n $1 && $1 = "--wet" ]]; then
      rsync $opts . "$dest"
    else
      rsync $opts --dry-run . "$dest"
      echo "Dry run. Run again with --wet for a real sync."
    fi
  else
    echo "No .rsync file found."
    return 1
  fi
}

# Pull files from the destination.
rpull() {
  if [ -f .rsync ]; then
    config=$(cat .rsync)
    dest=$(echo $config | head -n 1)
    opts=($(echo $config | tail -n 1))
    if [[ -n $1 && $1 = "--wet" ]]; then
      rsync $opts "$dest" ..
    else
      rsync $opts --dry-run "$dest" ..
      echo "Dry run. Run again with --wet for a real sync."
    fi
  else
    echo "No .rsync file found."
    return 1
  fi
}

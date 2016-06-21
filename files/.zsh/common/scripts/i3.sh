# Lock the computer.
lock() {
  if [ -z $1 ]; then
    i3lock --color=000000
  else
    i3lock --color="$1"
  fi
}

# Suspend computer and lock.
slock() {
  sudo pm-suspend && lock
}

# Hibernate computer and lock.
hlock() {
  sudo pm-hibernate && lock
}

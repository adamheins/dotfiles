# Rust package manager
#
CARGO_PATH="$HOME/.cargo"

if [ -d $CARGO_PATH ]; then
  path=($CARGO_PATH/bin $path)
fi

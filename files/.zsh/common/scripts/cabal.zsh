CABAL_PATH="$HOME/.cabal"

if [ -d $CABAL_PATH ]; then
  path=($CABAL_PATH/bin $path)
fi

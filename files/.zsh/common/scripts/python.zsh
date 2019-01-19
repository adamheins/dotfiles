# cd to the location of any importable Python module.
pycd () {
  if [ -z $1 ]; then
    echo "must enter Python module"
    return 1
  fi
  cd $(python -c "import os.path, $1; print(os.path.dirname($1.__file__))")
}

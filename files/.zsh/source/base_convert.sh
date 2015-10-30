#!/bin/zsh

# Utility functions for converting numbers between common bases.

dec() {
  local dir=${0:a:h}
  local py_script="$dir/base_convert.py"
  python "$py_script" "dec" "${@:1}"
}

hex() {
  local dir=${0:a:h}
  local py_script="$dir/base_convert.py"
  python "$py_script" "hex" "${@:1}"
}

bin() {
  local dir=${0:a:h}
  local py_script="$dir/base_convert.py"
  python "$py_script" "bin" "${@:1}"
}

oct() {
  local dir=${0:a:h}
  local py_script="$dir/base_convert.py"
  python "$py_script" "oct" "${@:1}"
}


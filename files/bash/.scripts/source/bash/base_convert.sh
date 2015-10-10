#!/bin/bash

# Utility functions for converting numbers between common bases.

dec() {
  local dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  local py_dir="$dir/../py/base_convert.py"
  python "$py_dir" "dec" "${@:1}"
}

hex() {
  local dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  local py_dir="$dir/../py/base_convert.py"
  python "$py_dir" "hex" "${@:1}"
}

bin() {
  local dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  local py_dir="$dir/../py/base_convert.py"
  python "$py_dir" "bin" "${@:1}"
}

oct() {
  local dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  local py_dir="$dir/../py/base_convert.py"
  python "$py_dir" "oct" "${@:1}"
}


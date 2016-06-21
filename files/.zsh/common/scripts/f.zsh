#    ffffffffffffffff
#   f::::::::::::::::f
#  f::::::::::::::::::f
#  f::::::fffffff:::::f
#  f:::::f       ffffff
#  f:::::f
# f:::::::ffffff
# f::::::::::::f
# f::::::::::::f
# f:::::::ffffff
#  f:::::f
#  f:::::f            __               __                               _
# f:::::::f (_)___   / _| ___  _ __   / _| __ ___   _____  _   _ _ __(_) |_ ___
# f:::::::f | / __| | |_ / _ \| '__| | |_ / _` \ \ / / _ \| | | | '__| | __/ _ \
# f:::::::f | \__ \ |  _| (_) | |    |  _| (_| |\ V / (_) | |_| | |  | | ||  __/
# fffffffff |_|___/ |_|  \___/|_|    |_|  \__,_| \_/ \___/ \__,_|_|  |_|\__\___|
#
# Create shortcuts for your favourite directories, files, and git branches.
#
# Author: Adam Heins
# Last modified: 2015-10-27

F_ALIAS_DEFAULT_PATH=~/.f

_do_in_dir_and_return() {
  local cur_dir=$(pwd)
  cd "$1"
  "${@:2}"
  cd "$cur_dir"
}

f() {
  if [ -z "$1" ]; then
    echo "usage: f [-bchlp] [args] [alias]"
    return 1
  elif [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    echo "f is for favourite"
    echo "usage: f [-bchlp] [args] [alias]"
    echo ""
    echo "arguments:"
    echo "  -b, --branch [args]     Call git branch on the f alias directory."
    echo "  -c, --checkout [args]   Call git checkout on the f alias directory."
    echo "  -p, --print [alias]     Prints an alias's value to stdout."
    echo "  -i, --init              Initialize the f alias directory."
    echo "  -l, --list              List all current f aliases."
    return 0
  fi

  local f_alias_path line words f_alias f_value alias_file print list

  # Find f alias directory to use.
  if [ -z "$F_ALIAS_PATH" ]; then
    f_alias_path="$F_ALIAS_DEFAULT_PATH"
  else
    f_alias_path="$F_ALIAS_PATH"
  fi

  # Check if the alias directory actually exists.
  # If it doesn't exist and --init wasn't passed, fail.
  if [ ! -d "$f_alias_path" ]; then
    if [[ "$1" == "-i" ]] || [[ "$1" == "--init" ]]; then
      mkdir -p "$f_alias_path"
      local cur_dir=$(pwd)
      cd "$f_alias_path"
      git init
      echo "f $f_alias_path" > "$f_alias_path/aliases"
      git add .
      git commit -m "Initial commit."
      cd "$cur_dir"
      return
    else
      echo "f: alias directory not found"
      return 1
    fi
  fi

  case "$1" in
    "--")
      [ -z "$2" ] && return 1
      f_alias="$2"
      ;;
    "-b"|"--branch")
      _do_in_dir_and_return "$f_alias_path" git branch "${@:2}"
      return
      ;;
    "-c"|"--checkout")
      [ ! -d "$f_alias_path" ]
      _do_in_dir_and_return "$f_alias_path" git checkout "${@:2}"
      return
      ;;
    "-p"|"--print")
      f_alias="$2"
      print=1
      ;;
    "-l"|"--list")
      list=1
      ;;
    *)
      f_alias="$1"
      ;;
  esac

  # All files in the f alias directory are search for aliases.
  for alias_file in "$f_alias_path"/*; do
    while read line || [[ -n "$line" ]]; do
      # Skip lines that begin with a '#'.
      [[ "${line:0:1}" == "#" ]] && continue

      words=(${(@s/ /)line})

      # Skip lines with only whitespace.
      [[ "${words[1]}" == "" ]] && continue

      if [[ "$list" == 1 ]]; then
        echo $words
        continue
      fi

      if [[ "${words[1]}" == "$f_alias" ]]; then
        f_value=${words[2]}
        if [[ "$print" == 1 ]]; then
          echo "$f_value"
          return 0
        fi
        # Perform tilde expansion.
        f_value=${f_value:s/~/$HOME}
        break
      fi
    done < "$alias_file"
  done

  [[ "$list" == 1 ]] && return 1

  if [ -z "$f_value" ]; then
    echo "f: no such alias '$f_alias'"
    return 1
  elif [ -d "$f_value" ]; then
    cd "$f_value"
  elif [ -f "$f_value" ]; then
    if [ ! -z "$VISUAL" ]; then
      "$VISUAL" "$f_value"
    elif [ ! -z "$EDITOR" ]; then
      "$EDITOR" $f_value
    else
      echo "f: no editor set"
      return 1
    fi
  elif [ "$(git branch --list $f_value 2>/dev/null)" ]; then
    git checkout "$f_value"
  else
    echo "f: alias does not point to a file, directory, or git branch"
    return 1
  fi

  return 0
}

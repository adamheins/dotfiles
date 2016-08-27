# Todo list utilities.

TODO_LIST_DIR=~/.todo
TODO_LIST_PATH=$TODO_LIST_DIR/todo.md
REMOTE=adam@adamheins.com

todo() {
  if [ -z $1 ]; then
    echo "try: todo --help"
    return 1
  fi

  case "$1" in
    "-l"|"--local") $EDITOR "$TODO_LIST_PATH" ;;
    "-r"|"--remote") $EDITOR "scp://$REMOTE//$TODO_LIST_PATH" ;;
    "--pull")
      [ ! -d $TODO_LIST_DIR ] && mkdir $TODO_LIST_DIR
      scp "$REMOTE:$TODO_LIST_PATH" "$TODO_LIST_PATH"
      ;;
    "--push")
      if [ ! -f $TODO_LIST_PATH ]; then
        echo "todo: cannot push; local todo list not found."
        return 1
      fi
      scp "$TODO_LIST_PATH" "$REMOTE:$TODO_LIST_PATH"
      ;;
    "-h"|"--help")
      echo "a todo list utility"
      echo ""
      echo "parameters:"
      echo "  -h, --help    Print this message."
      echo "  -l, --local   Edit local todo list."
      echo "  -r, --remote  Edit remote todo list."
      echo "      --pull    Overwrite local todo list with remote copy."
      echo "      --push    Overwrite remote todo list with local copy."
      ;;
    *) echo "todo: unrecognized argument" ;;
  esac
}

alias tl="todo -l"
alias tr="todo -r"
alias t="todo"

# Todo list utilities.

TODO_LIST_PATH=~/.todo/todo.md
REMOTE=adam@adamheins.com

todo() {
  if [ -z $1 ]; then
    echo "try: todo --help"
    return 1
  fi

  case "$1" in
    "-l"|"--local") vim "$TODO_LIST_PATH" ;;
    "-r"|"--remote") vim "scp://$REMOTE//$TODO_LIST_PATH" ;;
    "--pull") scp "$REMOTE:$TODO_LIST_PATH" "$TODO_LIST_PATH" ;;
    "--push") scp "$TODO_LIST_PATH" "$REMOTE:$TODO_LIST_PATH" ;;
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

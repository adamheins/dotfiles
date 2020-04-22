# Quickly send myself files, messages, and webpages.
sendme() {
  if [ -z $1 ]; then
    echo "usage: sendme [-fmrw] [file|string|url]"
    return 0
  fi
  case "$1" in
    "-f"|"--file") mutt -s "File: $2" "$MY_EMAIL" -a $2 < ~/mail/empty ;;
    "-m"|"--message") mutt -s "Message" "$MY_EMAIL" < $2 ;;
    "-r"|"--raw")
      echo "$2" > /tmp/message.txt
      mutt -s "Message" "$MY_EMAIL" < /tmp/message.txt
      ;;
    "-w"|"--webpage")
      htmltopdf "$2" /tmp/attachment.pdf
      mutt -s "Article: $2" "$MY_EMAIL" -a /tmp/attachment.pdf < ~/mail/empty
      ;;
    *)
      echo "invalid option '$1'"
      return 1
      ;;
  esac
}

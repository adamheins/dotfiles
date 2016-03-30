# Email an html webpage to my inbox as a pdf.
mailwebpage() {
  htmltopdf "$1" /tmp/attachment.pdf
  mutt -s "Article: $1" "$MY_EMAIL" -a /tmp/attachment.pdf < ~/mail/empty
}

#!/bin/sh

clisp_location="$(which clisp)"

if [ ! $clisp_location ]; then
  echo "Error: clisp is not installed. Aborting."
  exit 1
fi

echo "#!$clisp_location" > /usr/local/bin/base
curl -fsSl https://raw.githubusercontent.com/adamheins/base/master/base.lisp >> /usr/local/bin/base
chmod +x /usr/local/bin/base


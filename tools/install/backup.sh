#!/bin/sh

zip --symlinks -r\
  backup_$(date +%F).zip\
  aud dev doc img vid .todo\
  -x "dev/tps/*"\
  -x "*/build/*"\
  -x "*/node_modules/*"

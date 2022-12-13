#!/bin/sh
# This script was made by `goferito` on Github.
# Some cleanup by Luke.

[ -z "$1" ] && echo "No direction provided" && exit 1
distanceStr="20 px or 20 ppt"

moveChoice() {
  i3-msg resize "$1" "$2" "$distanceStr" | grep '"success":true' || \
    i3-msg resize "$3" "$4" "$distanceStr"
}

case $1 in
  up)
    moveChoice grow up shrink down
    ;;
  down)
    moveChoice shrink up grow down
    ;;
  left)
    moveChoice shrink right grow left
    ;;
  right)
    moveChoice grow right shrink left
    ;;
esac

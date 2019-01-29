#!/bin/bash

export NEWT_COLORS="
root=green,black
border=green,black
title=green,black
roottext=white,black
window=green,black
textbox=white,black
button=black,green
compactbutton=white,black
listbox=white,black
actlistbox=black,white
actsellistbox=black,green
checkbox=green,black
actcheckbox=black,green
"

TERMINAL=$(tty)

HEIGHT=30
WIDTH=80
CHOICE_HEIGHT=15
TITLE="macOS Development Environment Installer"
MENU="Select one or more options with SPACE and confirm with TAB:"

OPTIONS=(
  1     "Ruby"        on
  2     "Node"        on
  3     "Yarn"        on
  4     "Typescript"  on
  5     "Rust"        off
  6     "Python2"     off
  7     "Python3"     off
  8     "Go"          off
  9     "Java"        off
  10    "Scala"       off
  11    "iTerm2"      off
  12    "VS Code"     off
)

CHOICES=$(whiptail --cancel-button "Exit" \
                --ok-button "Begin" \
                --separate-output \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --checklist "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" 3>&1 1>&2 2>&3)
EXIT_CODE=$?

if [ "1" = "$EXIT_CODE" ]; then
  clear
  say "Cancelled..."
  say "Development environment installation complete! 🚀"
  exit 0;
fi

if [ "255" = "$EXIT_CODE" ]; then
  clear
  say "Cancelled..."
  say "Development environment installation complete! 🚀"
  exit 0;
fi

if [[ -z "$CHOICES" ]]; then
  clear
  say "No options were selected..."
  say "Development environment installation complete! 🚀"
  exit 0;
else
  for choice in $CHOICES
  do
    case $choice in
      1)
          BootstrapGit
          ;;
      2)
          BootstrapRuby
          ;;
      3)
          InstallNode
          ;;
      4)
          InstallYarn
          ;;
      5)
          npm install --global typescript &>/dev/null
          ;;
      6)
          BootstrapRust
          ;;
      7)
          BootstrapPython2
          ;;
      8)
          BootstrapPython3
          ;;
      9)
          BootstrapGolang
          ;;
      10)
          BootstrapJava
          ;;
      11)
          BootstrapScala
          ;;
      12)
          InstallIterm2
          ;;
      13)
          InstallVisualStudioCode
          ;;
    esac
  done
fi
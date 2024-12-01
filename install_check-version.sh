#!/bin/bash

if [ ! -f /etc/os-release ]; then
    echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
    echo "‼️ Installation stopped."
    exit 1
fi

. /etc/os-release

# Check if running on Ubuntu 24.04 or higher
if [ "$ID" != "ubuntu" ] || [ $(echo "$VERSION_ID >= 24.04" | bc) != 1 ]; then
    echo "$(tput setaf 1)Error: OS requirement not met"
    echo "You are currently running: $ID $VERSION_ID"
    echo "OS required: Ubuntu 24.04 or higher"
    echo "‼️ Installation stopped."
    exit 1
fi

# Desktop software and tweaks will only be installed if we're running Gnome
RUNNING_GNOME=$([[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]] && echo true || echo false)

if ! $RUNNING_GNOME; then
  echo "$(tput setaf 1)Error: GUI requirement not met"
  echo "GUI required: GNOME"
  echo "‼️ Installation stopped."
  exit 1
fi

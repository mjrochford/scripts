#!/usr/bin/env bash

function main() {

  num_updates=$(yay -Qu | wc -l)

  if (( num_updates <= 0 )); then
    return 0
  fi
  /usr/bin/notify-send "Updates" "$num_updates updates ready" --icon=system-software-update --icon arch

}

export DISPLAY=:0
export XAUTHORITY=/home/matt/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

main $@

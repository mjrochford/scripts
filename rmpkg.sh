#!/usr/bin/env bash

function main () {

  list=$(cat $1)

  for pkg in $list; do

    rmpkg $pkg
    clear

  done

}

function rmpkg () {
  pkg=$1

  yay -Qi $pkg

  ans=""

  while [[ $ans != "n" ]]; do

    echo -n "Remove $pkg [y/n]: "
    read ans

    if [[ ${ans::1} == "y" ]]; then
      yay -Ry $pkg
      return 1
    fi

    echo

  done

}

main $@

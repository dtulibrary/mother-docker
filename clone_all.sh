#!/bin/bash

projects=( alerting covers docdel docstore findit-auth freecite getit sendit toshokan )

function clonehttp {
  echo "Clone all via HTTP.."
  for i in "${projects}"
  do
    git clone https://github.com/dtulibrary/$i
  done
  exit
}

function clonessh {
  echo "Clone all via SSH.."
  for i in "${projects}"
  do
    git clone git@github.com:dtulibrary/$i
  done
  exit
}

while true; do
    read -p "Do you wish to clone via SSH or HTTPS? [h/s]" hs
    case $hs in
        [Hh]* ) clonehttp ; exit;;
        [Ss]* ) clonessh ;  exit;;
        * ) echo "Please answer h or s.";;
    esac
done



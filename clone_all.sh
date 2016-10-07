#!/bin/bash
function clonehttp {
  echo "Clone all via HTTP.."
  git clone https://github.com/dtulibrary/toshokan
  git clone https://github.com/dtulibrary/docdel
  git clone https://github.com/dtulibrary/findit-auth
  git clone https://github.com/dtulibrary/sendit
  git clone https://github.com/dtulibrary/covers
  git clone https://github.com/dtulibrary/getit
  git clone https://github.com/dtulibrary/docstore
  git clone https://github.com/dtulibrary/alerting
  exit
}

function clonessh {
  echo "Clone all via SSH.."
  git clone git@github.com:dtulibrary/toshokan
  git clone git@github.com:dtulibrary/docdel
  git clone git@github.com:dtulibrary/findit-auth
  git clone git@github.com:dtulibrary/sendit
  git clone git@github.com:dtulibrary/covers
  git clone git@github.com:dtulibrary/getit
  git clone git@github.com:dtulibrary/docstore
  git clone git@github.com:dtulibrary/alerting
  git clone git@github.com:dtulibrary/freecite-docker
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



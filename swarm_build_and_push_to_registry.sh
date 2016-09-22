#!/bin/bash

# Call this with project name as a parameter to build it and push to registry
# Call it with 'all' and all projects will be built

function buildproject {
  echo "Building project: " $1
  docker build -t dtu/$1 $1
  docker tag dtu/$1 localhost:5000/dtu/$1
  docker push       localhost:5000/dtu/$1
}

if [[ $# -eq 0 ]] ; then
  echo 'Pass a project name as a parameter, to build it and push to registry'
  echo 'Use "all" to build all'
  exit 0
fi

if [ $1 = "all" ]; then
  echo "Building and pushing ALL projects"

  for i in `grep path .gitmodules | sed 's/.*= //'`;
  do
    buildproject $i
  done
else
  buildproject $1
fi



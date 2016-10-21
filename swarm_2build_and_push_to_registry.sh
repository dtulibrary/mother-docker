#!/bin/bash

# Call this with project name as a parameter to build it and push to registry
# Call it with 'all' and all projects will be built

# Check if we are already using another registry:
if  [ -z ${REGISTRY} ];
then
  REGISTRY=localhost
  echo "Using localhost as registry";
else
  echo "Using Registry: $REGISTRY";
fi


function buildproject {
  echo "Building project: " $1
  docker build -t dtu/$1 $1
  docker tag dtu/$1 $REGISTRY:5000/dtu/$1
  docker push       $REGISTRY:5000/dtu/$1
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



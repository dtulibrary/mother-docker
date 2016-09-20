#!/bin/bash

# Call this with project name as a parameter to build it and push to registry

if [[ $# -eq 0 ]] ; then
    echo 'Pass a project name as a parameter, to build it and push to registry'
    exit 0
fi

docker build -t dtu/$1 $1
docker tag dtu/$1 localhost:5000/dtu/$1
docker push       localhost:5000/dtu/$1

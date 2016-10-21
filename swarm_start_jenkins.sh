#!/bin/bash
# Use this if you also want to experiment with Jenkins build server

# 1. Create network if not existing
docker network create --driver overlay finditnet

# Jenkins home will be in thisfolder/jenkins
mkdir -p jenkins
docker service create --name jenkins     --network finditnet  --mount type=bind,src=$PWD/jenkins,dst=/var/jenkins_home -p=8080:8080 -p=50000:50000 jenkins


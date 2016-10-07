#!/bin/bash
# This is how we can create a SWARM manually with commands
# after we have initiated the SWARM and created the worker / manager nodes

# Check if we are already using another registry:
if  [ -z ${REGISTRY} ];
then
  REGISTRY=localhost
  echo "Using localhost as registry";
else
  echo "Using Registry: $REGISTRY";
fi

# 1. Create network
docker network create --driver overlay finditnet

# TODO: Create database on one node? Use Volume containers?
#docker service create --name db --network finditnet --mode=global  REGISTRY:5000/dtu/db:production
docker service create --name db          --network finditnet -e POSTGRES_PASSWORD=db -e POSTGRES_USER=db postgres

# Create toshokan on all nodes on that network
docker service create --name toshokan    --network finditnet --mode=global --publish=3000:3000 $REGISTRY:5000/dtu/toshokan
docker service create --name findit-solr --network finditnet --replicas=2  --publish=8983:8983 $REGISTRY:5000/dtu/solrfixtures
docker service create --name alerting    --network finditnet --replicas=2  --publish=3007:3000 $REGISTRY:5000/dtu/alerting
docker service create --name getit       --network finditnet --replicas=2  --publish=3003:3000 $REGISTRY:5000/dtu/getit

#docker service create --name findit-auth --network finditnet --replicas=2  --publish=3001:3000 $REGISTRY:5000/dtu/findit-auth

# TODO: For these 4, you need to create the DBs manually inside the db container
# Maybe use: docker exec CONTAINER createdb covers -h localhst -Udb 
docker service create --name covers      --network finditnet --replicas=2  --publish=3008:3000 $REGISTRY:5000/dtu/covers
docker service create --name docdel      --network finditnet --replicas=2  --publish=3002:3000 $REGISTRY:5000/dtu/docdel
docker service create --name docstore    --network finditnet --replicas=2  --publish=3005:3000 $REGISTRY:5000/dtu/docstore
docker service create --name sendit      --network finditnet --replicas=2  --publish=3004:3000 $REGISTRY:5000/dtu/sendit



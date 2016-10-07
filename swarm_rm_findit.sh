#!/bin/bash

docker service rm db
docker service rm alerting
docker service rm covers
docker service rm docdel
docker service rm docstore
docker service rm getit
docker service rm findit-auth
docker service rm findit-solr
docker service rm sendit
docker service rm toshokan

docker network rm finditnet

#!/bin/bash
docker-compose kill -s SIGINT
docker-compose kill -s SIGKILL findit-solr
docker-compose stop -t 20

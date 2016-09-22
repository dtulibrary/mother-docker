#!/bin/bash
docker-compose kill -s SIGINT
docker-compose kill -s SIGKILL findit-solr
docker-compose kill -s SIGKILL redmine
docker-compose stop -t 20
docker-compose rm -f redmine

#!/bin/bash
# Run these when the container is already running

docker exec `docker ps -qf "name=alerting"    | head -n 1`  bundle exec rake db:setup
docker exec `docker ps -qf "name=covers"      | head -n 1`  bundle exec rake db:setup
docker exec `docker ps -qf "name=docdel"      | head -n 1`  bundle exec rake db:setup
docker exec `docker ps -qf "name=docstore"    | head -n 1`  bundle exec rake db:setup
docker exec `docker ps -qf "name=findit"      | head -n 1`  bundle exec rake db:setup
docker exec `docker ps -qf "name=findit-auth" | head -n 1`  bundle exec rake db:setup
docker exec `docker ps -qf "name=getit"       | head -n 1`  bundle exec rake db:setup
docker exec `docker ps -qf "name=sendit"      | head -n 1`  bundle exec rake db:setup

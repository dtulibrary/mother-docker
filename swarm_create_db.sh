#!/bin/bash
# Run this script (only for the first time) when these containers are already running

# TODO: Sometimes, the container is off at the exact moment `docker ps` tries to get its name.
# Therefore, you might need to run the script often than 1

docker exec `docker ps -qf "name=alerting"    | head -n 1`  bundle exec rake db:create db:setup
docker exec `docker ps -qf "name=covers"      | head -n 1`  bundle exec rake db:create db:setup
docker exec `docker ps -qf "name=docdel"      | head -n 1`  bundle exec rake db:create db:setup
docker exec `docker ps -qf "name=docstore"    | head -n 1`  bundle exec rake db:create db:setup
docker exec `docker ps -qf "name=findit-auth" | head -n 1`  bundle exec rake db:create db:setup
docker exec `docker ps -qf "name=sendit"      | head -n 1`  bundle exec rake db:create db:setup
docker exec `docker ps -qf "name=toshokan"    | head -n 1`  bundle exec rake db:create db:setup

# does not use postgres:
#docker exec `docker ps -qf "name=getit"       | head -n 1`  bundle exec rake db:setup

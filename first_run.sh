# for development
docker-compose run auth-web   rake db:setup
docker-compose run docdel-web rake db:setup
docker-compose run findit-web rake db:setup


# copy the config/ settings from puppet?
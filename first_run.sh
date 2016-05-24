# for development
docker-compose exec auth-web   rake db:setup
docker-compose exec docdel-web rake db:setup
docker-compose exec findit-web rake db:setup
docker-compose exec sendit-web rake db:setup
docker-compose exec covers-web rake db:setup
docker-compose exec docstore-web rake db:setup
docker-compose exec alerting-web rake db:setup


# copy the config/ settings from puppet?

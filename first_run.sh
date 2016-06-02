# for development
# Run these when the container is already running
docker-compose exec alerting     bundle exec rake db:setup
docker-compose exec covers       bundle exec rake db:setup
docker-compose exec docdel       bundle exec rake db:setup
docker-compose exec docstore     bundle exec rake db:setup
docker-compose exec findit       bundle exec rake db:setup
docker-compose exec findit-auth  bundle exec rake db:setup
docker-compose exec getit        bundle exec rake db:setup
docker-compose exec sendit       bundle exec rake db:setup

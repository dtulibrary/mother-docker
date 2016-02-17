# mother-docker
A project which can build the entire DTU-Findit infrastructure

You need [docker](https://www.docker.com) and docker-compose installed.


Start by cloning this repo **recursively** which gets all the submodules.

`git clone --recursive <repourl>`




run `docker-compose up` which first builds and then starts all the containers.

The first time you need to run `./first_run` to create databases







[Here is a list](https://github.com/dtulibrary/mother-docker/issues/1) of all the containers we are working on dockerizing

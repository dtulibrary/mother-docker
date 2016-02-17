# mother-docker
A project which can build the entire DTU-Findit infrastructure

You need [docker](https://www.docker.com) and docker-compose installed.


1. Start by cloning this repo **recursively** which gets all the submodules.

   `git clone --recursive <repourl>`

2. Use Docker Compose to build and start all the containers.

  `docker-compose up`

3. The first time you need to create databases
 
 `./first_run.sh`








[Here is a list](https://github.com/dtulibrary/mother-docker/issues/1) of all the containers we are working on dockerizing

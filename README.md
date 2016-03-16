# mother-docker
A project which can build the **entire** DTU-Findit infrastructure

You need [docker](https://www.docker.com) and docker-compose installed.


1. Start by cloning this repo **recursively** which gets all the submodules.

   `git clone --recursive <repourl>`

1. For now, each repo needs to be on a branch called 'dockerize'

   So you need to cd into each directory and switch to that branch (until we have merged those branches to master)

2. Use Docker Compose to build and start all the containers.

  `docker-compose up`

3. The first time you need to create databases
 
 `./first_run.sh`



####Services and ports####
Now you can visit

|Service | Port | Purpose |
|--------|------|---------|
|Findit  |      <http://localhost:3000> | Findit frontend|
|Findit-Auth |  <http://localhost:3001> | Authentication system |
|DocDel |       <http://localhost:3002> | |
|Getit |        <http://localhost:3003> | |
|Sendit  |      <http://localhost:3004> | |
|DocStore |     <http://localhost:3005> | |
|~~Redmine~~ |  <http://localhost:3006> | A project management web application |
|Alerting  |    <http://localhost:3007> | |
|Covers  |      <http://localhost:3008> | |
|~~DTUBasen~~ | <http://localhost:3009> | |
|~~Reprintsdesk~~  |    <http://localhost:3010> | |
|~~DTULocal Scan~~  |    <http://localhost:3011> | |
|~~DTU Cas~~  |    <http://localhost:3012> | |

####Additional####

[Here is a list](https://github.com/dtulibrary/mother-docker/issues/1) of all the containers we are working on dockerizing.

Pull requests / issues welcome!

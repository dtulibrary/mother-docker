# mother-docker
A project which can build the **entire** DTU-Findit infrastructure

You need [docker](https://www.docker.com) and docker-compose installed.


1. Start by cloning this repo **recursively** which gets all the submodules.

   `git clone --recursive <repourl>`

   We **might** be moving away from submodules, then run the script:

   `./clone_all.sh`

   And enter "h" at the prompt, unless you have SSH access to the repo, then write "s"

2. Use Docker Compose to build and start all the containers.

  `docker-compose up`

3. The first time you need to create databases

  `./first_run.sh`


4. Once in a while, if the submodules have been updated you can do:

  `git submodule foreach git pull origin master`

  This is also in a script `./update_submodules.sh`


5. Currently, one still needs to change to a 'dockerize' branch

  *findit-auth*

6. DTU employees only:

  If you don't want git to ask for your username and password do:

  `./dtu_employees_use_ssh.sh` 

###Services and ports###
Now you can visit

|Service | Port | Purpose |
|--------|------|---------|
|Findit  |      <http://localhost:3000> | Findit frontend|
|Findit-Auth |  <http://localhost:3001> | Authentication system |
|DocDel |       <http://localhost:3002> | Document delivery|
|Getit |        <http://localhost:3003> | Link resolver proxy|
|Sendit  |      <http://localhost:3004> | Communication server, sends emails|
|DocStore |     <http://localhost:3005> | Document store |
|~~Redmine~~ |  <http://localhost:3006> | A project management web application |
|Alerting  |    <http://localhost:3007> | |
|Covers  |      <http://localhost:3008> | IIIF Compliant cover image service|
|~~DTUBasen~~ | <http://localhost:3009> | |
|~~Reprintsdesk~~  |    <http://localhost:3010> | |
|~~DTULocal Scan~~  |    <http://localhost:3011> | |
|~~DTU Cas~~  |    <http://localhost:3012> | |

## Docker Swarm (Experimental)

We added scripts to start Findit on the Swarm (docker-compose not needed)

1. Start your (local) Swarm

  `docker swarm init`

2. Start a local registry

  The Swarm requires you to put your images in a registry. For now we create our own registry:

  `./swarm_start_jenkins_registry`

3. Build images and put them in the registry

  There is a script to build and push images to the registry, it accepts the project name as a parameter:

  `./swarm_build_and_push_to_registry.sh toshokan`

  If you want to build ALL projects do:

  `./swarm_build_and_push_to_registry.sh all`



4. Start services

  `./swarm_start_findit.sh`


####Additional####

[Here is a list](https://github.com/dtulibrary/mother-docker/issues/1) of all the containers we are working on dockerizing.

Pull requests / issues welcome!

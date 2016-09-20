
$REGISTRY=localhost

# 1. Create network
docker network create --driver overlay finditnet

# Registry
# TODO: Mount a folder for the registry to keep all the images locally
mkdir -p registry
docker service create --name registry  --network finditnet   --mount type=bind,src=$PWD/registry,dst=/var/lib/registry  -p=5000:5000 registry:2

# Registry frontend
docker service create --name registryfrontend --network finditnet  -p=5001:80 -e ENV_DOCKER_REGISTRY_HOST=localhost -e ENV_DOCKER_REGISTRY_PORT=5000 konradkleine/docker-registry-frontend:v2

# Jenkins home will be in thisfolder/jenkins
mkdir -p jenkins
docker service create --name jenkins     --network finditnet  --mount type=bind,src=$PWD/jenkins,dst=/var/jenkins_home -p=8080:8080 -p=50000:50000 jenkins


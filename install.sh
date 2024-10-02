# install docker if it's not already installed
if ! command -v docker 2>&1 >/dev/null
then
    sudo apt-get update -y
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

# double check if installation was successful
if ! command -v docker 2>&1 >/dev/null
then
    echo "docker wasn't installed, aborting..."
    exit 1
fi

sudo docker volume create portainer_data

# initalize portainer
sudo curl -L https://downloads.portainer.io/ce2-21/portainer-agent-stack.yml -o portainer-agent-stack.yml

docker swarm init

docker stack deploy -c portainer-agent-stack.yml portainer

docker volume create jenkins_data

# initalize jenkins
sudo docker run -d --name jenkins \
    -p 8080:8080 \
    -v jenkins_data:/var/jenkins_home \
    jenkins/jenkins:jdk21

# deploy ghost stack
sudo curl -L https://raw.githubusercontent.com/sm-samax/selfhosted-blog/90f1137919a700fe3f55f37d9b2304a5939ab91f/develop/ghost.yml \
    -o ghost.yml

docker stack deploy -c ghost.yml ghost
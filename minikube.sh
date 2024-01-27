#! /bin/bash

# update OS repository
sudo apt update -y

# install kubectl
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install minikube
sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# install docker
sudo apt-get update -y &&
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&
sudo apt-get update -y &&
sudo sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&
sudo usermod -aG docker ubuntu
newgrp docker 

# build your docker image
# replace <yourHubUserName>/<image_name>:tag with your actual repo and image name
# docker build -t <yourHubUserName>/<image_name>:<tag> . 

# push to docker hub
# use the "docker images" command to get the image_id of your image
# replace <yourHubUserName>/<image_name>:tag with your actual name,tag and id 
# docker tag <image_id> <yourHubUserName>/<image_name>:<tag>
# docker push yourHubUserName/<image_name>:<tag>

# start minikube
# minikube start
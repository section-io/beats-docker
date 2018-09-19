#!/bin/bash

# change this to the user you created for your VM
DOCKER_USER="sysadmin"

docker_installs() {
    apt-get update
	apt-get remove docker docker-engine docker.io
	apt-get install -y \
			apt-transport-https \
			ca-certificates \
			curl \
			software-properties-common

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

	#apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

	# sadly this is the command to run because ubuntu doesn't have a docker
	# package easy to install via apt-get???
	# see: https://askubuntu.com/questions/938700/how-do-i-install-docker-on-ubuntu-16-04-lts
	apt install docker.io
}

# post installation setup for user
post_installs() {
	if [ ! $(getent group docker) ]; then
        echo "add a docker group"
		groupadd docker
	fi
    echo "Adding '$DOCKER_USER' to docker group"
	usermod -aG docker "$DOCKER_USER"
}

# Pull the python image before the build -- convenience for development.
docker_pull() {
    docker pull python:3.7.0-slim-stretch
}

# 1) setup the shell and dev tools for the user
# 2) add docker to the system
# 3) make docker group and add user
# 4) change user's shell to zsh
installs() {
	docker_installs
	post_installs
}

$1
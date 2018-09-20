# Purpose
These instruction outline the steps used to create the Dockerfile used
to build filebeats for the section.io deployment.

## TL;DR
This is provided as step to create an environment from scratch on a VM
that doesn't initially have docker running.

- Setup a VM (ubuntu/xenial)
- Get User and IP from VM (with bridged network or something that lets
  you SSH and SCP to the VM).
- Edit dev-local.sh with the USER and IP
- Run ./dev-local.sh to push local files into VM via SCP
- Ssh into the machine and run $HOME/install.sh which will add docker to the
  machine and setup the docker group
- With the ssh session then run $HOME/build.sh which will create the docker
  image, then output to console the Dockerfile that was generated.

## Sorter version
Starting with a docker deamon running some environment such that the local
docker can issue commands against.

Simply run `./build.sh` which should `docker build` the image targeting the
configured deamon.  The script will then also attempt to run the created
image and simply output the generated Dockerfile.

## Steps in Code
See Dockerfile.build.  It hightlights the steps in Dockerfile format using a
Python3 image.

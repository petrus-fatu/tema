#!/bin/bash

mkdir -p /var/log/container/{node,java,python}

[ `command -v docker` ] && echo "docker is installed" || yum -y install docker

[ `command -v docker-compose` ] && echo "docker-compose is installed" || yum -y install docker-compose



docker-compose -p tema up -d

cd docker-elk

docker-compose up -d



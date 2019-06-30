#!/usr/bin/env bash
docker build ./docker -t itea-jenkins
docker run \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /home/vitaliy/.docker:/root/.docker \
-v $(which docker):/usr/bin/docker \
-e GIT_PASSWORD=$1 \
-e ENV=prod \
-e JENKINS_COLOR_SCHEMA=green \
-p 8080:8080 \
itea-jenkins

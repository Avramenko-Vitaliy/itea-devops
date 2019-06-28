#!/usr/bin/env bash
docker build ./docker -t itea-jenkins
docker run \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker \
-e GIT_PASSWORD=Ns9sBV3Itx \
-e ENV=prod \
-e JENKINS_COLOR_SCHEMA=green \
-p 8080:8080 \
itea-jenkins

#!/usr/bin/env bash

docker pull vitaliyavramenko/devops-task2:latest
docker run --rm -e LINE='Hello World!' -p 80:80 -d vitaliyavramenko/devops-task2
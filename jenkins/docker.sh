#!/bin/bash

# Start Jenkins /w persistent storage
docker run -d \
    -e 'VIRTUAL_HOST=jenkins.server.com' \
    -e 'VIRTUAL_PORT=8080' \
    -v /var/docker-data/jenkins:/var/jenkins_home \
    jenkins:1.565.3

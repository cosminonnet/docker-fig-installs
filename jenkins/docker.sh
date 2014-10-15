#!/bin/bash

# Start Jenkins /w persistent storage
docker run -d -p 8080:8080 -p 50000:50000 -v /var/docker-data/jenkins:/var/jenkins_home jenkins:1.565.3

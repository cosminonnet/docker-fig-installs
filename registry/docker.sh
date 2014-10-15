#!/bin/bash

# Start the registry /w persistent storage
docker run -d -p 5000:5000 -v /var/docker-data/registry:/tmp/registry registry:0.8.1

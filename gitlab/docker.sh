#!/bin/bash

# Source : https://registry.hub.docker.com/u/sameersbn/gitlab/

# 0. Quick Start
# --------------
#docker run --name='gitlab' -d -e 'GITLAB_PORT=10080' -e 'GITLAB_SSH_PORT=10022' -p 10022:22 -p 10080:80 -v /var/run/docker.sock:/run/docker.sock -v $(which docker):/bin/docker  sameersbn/gitlab:7.3.2-1


# 1. Install Postgre Container
# ----------------------------
docker run --name=postgresql -d -e 'DB_NAME=gitlab_db' -e 'DB_USER=gitlab' -e 'DB_PASS=password' -v /var/docker-data/postgresql:/var/lib/postgresql sameersbn/postgresql:latest


# 2. Install Redis Container
# --------------------------
docker run --name=redis -d -v /var/docker-data/redis:/var/lib/redis sameersbn/redis:latest


# 3. Install Gitlab Container /w Data Volume & SSL
# ------------------------------------------------
docker run --name='gitlab' -d -p 10022:22 -e 'GITLAB_SSH_PORT=10022' -e 'SSL_SELF_SIGNED=true' -e 'VIRTUAL_HOST=gitlab.server.com' -e 'VIRTUAL_PORT=80' -v /var/run/docker.sock:/run/docker.sock -v $(which docker):/bin/docker -v /var/docker-data/gitlab:/home/git/data --link postgresql:postgresql --link redis:redisio sameersbn/gitlab:7.3.2-1

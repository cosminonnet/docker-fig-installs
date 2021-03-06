# [Nginx Proxy](https://github.com/jwilder/nginx-proxy)

> Automated Nginx reverse proxy for docker containers.

Containers

|ID           |Docker Image                                                                                                    |GitHub                                                                    |Version         |Size   |
|:-----------:|:--------------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------:|:--------------:|:-----:|
|nginx        |[![Badge](http://dockeri.co/image/jwilder/nginx-proxy)](https://registry.hub.docker.com/u/jwilder/nginx-proxy/) |[nginx-proxy](https://github.com/jwilder/nginx-proxy)                     |`latest`        |261.8MB|

Configuration

<pre>
nginx:
  image: jwilder/nginx-proxy
  ports:
    - "80:80"
  volumes:
    - /var/run/docker.sock:/tmp/docker.sock
</pre>

Start

<pre>
fig up -d nginx
</pre>



# [Docker Registry](https://github.com/docker/docker-registry)

> Registry server for Docker (hosting/delivering of repositories and images).

Containers

|ID           |Docker Image                                                                                                 |GitHub                                                                    |Version         |Size   |
|:-----------:|:-----------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------:|:--------------:|:-----:|
|registry     |[![Badge](http://dockeri.co/image/library/registry)](https://registry.hub.docker.com/u/library/registry/)    |[docker-registry](https://github.com/docker/docker-registry)              |`latest` `0.8.1`|425.1MB|

Configuration

<pre>
registry:
  image: registry:0.8.1
  ports:
    - "5000:5000"
  volumes:
    - /var/docker-data/registry:/tmp/registry
</pre>

Start

<pre>
fig up -d registry
</pre>



# [GitLab](https://about.gitlab.com/)

> Offers git repository management, code reviews, issue tracking, activity feeds, wikis.

Containers

|ID           |Docker Image                                                                                                     |GitHub                                                                      |Version            |Size   |
|:-----------:|:---------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------:|:-----------------:|:-----:|
|gitlab       |[![Badge](http://dockeri.co/image/sameersbn/gitlab)](https://registry.hub.docker.com/u/sameersbn/gitlab/)        |[docker-gitlab](https://github.com/sameersbn/docker-gitlab)                 |`latest` `7.3.2-1` |659.0MB|
|postgresql   |[![Badge](http://dockeri.co/image/sameersbn/postgresql)](https://registry.hub.docker.com/u/sameersbn/postgresql/)|[docker-postgresql](https://github.com/sameersbn/docker-postgresql)         |`latest`           |142.1MB|
|redis        |[![Badge](http://dockeri.co/image/sameersbn/redis)](https://registry.hub.docker.com/u/sameersbn/redis/)          |[docker-redis](https://github.com/sameersbn/docker-redis)                   |`latest`           |203.2MB|

Configuration

<pre>
gitlab:
  image: sameersbn/gitlab:7.3.2-1
  ports:
    - "10022:22"
  environment:
    - GITLAB_HOST=gitlab.server.com
    - GITLAB_PORT=80
    - GITLAB_EMAIL=admin@server.com
    - GITLAB_SSH_PORT=10022
    - SSL_SELF_SIGNED=true
    - VIRTUAL_HOST=gitlab.server.com
    - VIRTUAL_PORT=80
  volumes:
    - /var/run/docker.sock:/run/docker.sock
    - $(which docker):/bin/docker
    - /var/docker-data/gitlab/data:/home/git/data
    - /var/docker-data/gitlab/log:/var/log/gitlab
  links:
    - postgresql:postgresql
    - redis:redisio

postgresql:
  image: sameersbn/postgresql:latest
  environment:
      - DB_NAME=gitlab_db
      - DB_USER=gitlab
      - DB_PASS=password
  volumes:
    - /var/docker-data/postgresql:/var/lib/postgresql

redis:
  image: sameersbn/redis:latest
  volumes:
    - /var/docker-data/redis:/var/lib/redis
</pre>

Start

<pre>
fig up -d gitlab
</pre>

Login using the default username and password:

* username: **root**
* password: **5iveL!fe**



# [Jenkins](http://jenkins-ci.org/)

> An extendable open source continuous integration server.

Containers

|ID           |Docker Image                                                                                                 |GitHub                                                                      |Version            |Size   |
|:-----------:|:-----------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------:|:-----------------:|:-----:|
|jenkins      |[![Badge](http://dockeri.co/image/_/jenkins)](https://registry.hub.docker.com/_/jenkins/)                    |[jenkins-ci.org-docker](https://github.com/cloudbees/jenkins-ci.org-docker) |`latest` `1.565.3` |659.0MB|

Configuration

<pre>
jenkins:
  image: jenkins:1.565.3
  environment:
    - VIRTUAL_HOST=jenkins.server.com
    - VIRTUAL_PORT=8080
  volumes:
    - /var/docker-data/jenkins:/var/jenkins_home
  user: root
</pre>

Start

<pre>
fig up -d jenkins
</pre>

Jenkins is by default unsecured. Make sure to go to `Manage Jenkins - Setup Security` to configure your security.

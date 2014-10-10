# [Docker Registry](https://github.com/docker/docker-registry)

> Registry server for Docker (hosting/delivering of repositories and images).

Containers

|ID           |Container                                                                                                  |GitHub                                                                      |App Version    |Size   |
|-------------|-----------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------:|:-------------:|------:|
|registry     |[![Badge](http://dockeri.co/image/library/registry)](https://registry.hub.docker.com/u/library/registry/)  |[docker-registry](https://github.com/docker/docker-registry)         |latest  `0.8.1`|425.1MB|

Configuration

<pre>
registry:
  image: registry:0.8.1
  ports:
    - "5000:5000"
  volumes:
    - /opt/registry:/tmp/registry
</pre>

Start

<pre>
fig up -d registry
</pre>



# [GitLab](https://about.gitlab.com/)

> Offers git repository management, code reviews, issue tracking, activity feeds, wikis.

Containers

|ID        |Container                                                                                                |App Version    |Size   |
|----------|---------------------------------------------------------------------------------------------------------|:-------------:|------:|
|gitlab    |[![Badge](http://dockeri.co/image/sameersbn/gitlab)](https://github.com/sameersbn/docker-gitlab)         |`v7.3.1-3`     |729.5MB|
|postgresql|[![Badge](http://dockeri.co/image/orchardup/postgresql)](https://github.com/orchardup/docker-postgresql) |latest         |488.6MB|
|redis     |[![Badge](http://dockeri.co/image/_/redis)](https://registry.hub.docker.com/_/redis/)                    |`v2.8.9`       | 98.7MB|

Topology

|Service             |Database  |Redis|
|--------------------|----------|-----|
|gitlab              |postgresql|redis|
| &#x2937; postgresql|          |     |
| &#x2937; redis     |          |     |

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

|ID           |Container                                                                                                  |App Version    |Size   |
|-------------|-----------------------------------------------------------------------------------------------------------|:-------------:|------:|
|jenkins      |[![Badge](http://dockeri.co/image/aespinosa/jenkins)](https://registry.hub.docker.com/u/aespinosa/jenkins/)|latest `v1.583`|471.3MB|

Configuration

<pre>
jenkins:
  image: aespinosa/jenkins:latest
  ports:
    - "8080:8080"
</pre>

Start

<pre>
fig up -d jenkins
</pre>

Jenkins is by default unsecured. Make sure to go to `Manage Jenkins - Setup Security` to configure your security.

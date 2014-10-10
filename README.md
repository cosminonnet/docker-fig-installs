# GitLab

> [GitLab](https://about.gitlab.com/) offers git repository management, code reviews, issue tracking, activity feeds, wikis.

Usable Containers

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

### QuickStart

To launch GitLab

<pre>
cd gitlab
fig up -d
</pre>

Login using the default username and password:

* username: **root**
* password: **5iveL!fe**



# Jenkins

> [Jenkins](http://jenkins-ci.org/) An extendable open source continuous integration server

Usable Containers

|ID           |Container                                                                                                  |App Version    |Size   |
|-------------|-----------------------------------------------------------------------------------------------------------|:-------------:|------:|
|jenkinsLatest|[![Badge](http://dockeri.co/image/aespinosa/jenkins)](https://github.com/aespinosa/docker-jenkins)         |latest `v1.581`|471.3MB|
|jenkinsLTS   |[![Badge](http://dockeri.co/image/_/jenkins)](https://registry.hub.docker.com/_/jenkins/)                  |LTS `v1.565.2` |  699MB|
|jenkinsHarbur|[![Docker Repository on Quay.io](http://img.shields.io/badge/container-quay.io%2Fharbur%2Fjenkins-blue.svg)](http://docs.harbur.io/en/latest/applications/jenkins/index.html)[]()|latest `v1.581`|  548MB|
|jenkinsSlave |[![Badge](http://dockeri.co/image/spiddy/dind-jenkins-slave)](https://github.com/spiddy/dind-jenkins-slave)|-              |891.5MB|

Topology

|Service               |Workers     |
|--------------------  |------------|
|jenkinsLatest         |jenkinsSlave|
|jenkinsLTS            |            |
|jenkinsHarbur         |            |
| &#x2937; jenkinsSlave|            |

### QuickStart Latest

To launch the *latest* Jenkins version run:

<pre>
cd jenkins
fig up -d jenkinsLatest
echo "Jenkins can be accessed at: $(docker port jenkins_jenkinsLatest_1 8080)"
</pre>

Jenkins is by default unsecured. Make sure to go to `Manage Jenkins - Setup Security` to configure your security.

![Jenkins Latest](https://raw.githubusercontent.com/harbur/docker-sdlc/master/images/JenkinsLatest.png "Jenkins Latest")

### QuickStart LTS

To launch the *LTS* Jenkins version run:

<pre>
cd jenkins
fig up -d jenkinsLTS
echo "Jenkins can be accessed at: $(docker port jenkins_jenkinsLTS_1 8080)"
</pre>

Jenkins is by default unsecured. Make sure to go to `Manage Jenkins - Setup Security` to configure your security.

![Jenkins LTS](https://raw.githubusercontent.com/harbur/docker-sdlc/master/images/JenkinsLTS.png "Jenkins LTS")

Current LTS Issues:

* [Failed to listen to incoming slave connection](https://github.com/cloudbees/jenkins-ci.org-docker/issues/6)

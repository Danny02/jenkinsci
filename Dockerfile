FROM jenkins:alpine

USER root
RUN apk update && apk add docker

RUN install-plugins.sh git matrix-auth workflow-aggregator docker-workflow blueocean credentials-binding

# add initial admin user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# disable user & plugin setup
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

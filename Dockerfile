FROM jenkins/jenkins:2.249.1-lts

# Docker install
USER root
RUN apt-get update && apt-get install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       gnupg2 \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) \
       stable"
RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins

COPY plugins.txt  /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# allows to skip Jenkins setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# use this for creating default admin user
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# COPY jenkins.yaml /var/jenkins_home/casc_configs/
# ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/jenkins.yaml

# skip setup wizard, see: https://github.com/jenkinsci/docker/blob/master/README.md#script-usage
# RUN echo 2.235.1 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

FROM jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_REF /usr/share/jenkins/ref
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY JCasC/jenkins.yaml /var/jenkins_home/jenkins.yaml

# Groovy script to create the "SeedJob" (the standard way, not with DSL)
COPY init.groovy.d/seed_job.groovy /usr/share/jenkins/ref/init.groovy.d/

# The place where to put the DSL files for the Seed Job to run
RUN mkdir -p /usr/share/jenkins/ref/jobs/SeedJob/workspace/

# COPY your Seed Job DSL script
COPY seed_job/ /usr/share/jenkins/ref/jobs/SeedJob/workspace/
# How-To create Declarative Pipeline with official Jenkins Docker image

This file describes the simplest way to start official Jenkins Docker image and create Jenkinsfie with Blue Ocean plugin.

> **_NOTE:_** Below content is intended for demo purposes only, do not use it in production environment.

## Prerequisites

- You have forked this repo to your GitHub account and cloned it to you computer

- You have created and saved a Github personal access token

- Docker is installed on your machine (Docker for Mac or Docker for Windows will work)

## Steps

- Open the terminal and run the following command:

            docker run -p 8080:8080 jenkins/jenkins:lts

- Wait till Jenkins starts up (Jenkins is up and running message in the log)

- Go to [your Jenkins host](http://localhost:8080). You should see the Jenkins web interface with the Installation wizard.

- To unlock the Jenkins instance - go to the terminal and find the following message in the startup log:

            *************************************************************

            Jenkins initial setup is required. An admin user has been created
            and a password generated.
            Please use the following password to proceed to installation:

            <PASSWORD>

            This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

            *************************************************************

- Copy the password and paste it into the unlock screen.

- Install recommended plugins and add admin user with simple "admin/admin" credentials.
  Your Jenkins initial setup is completed!

- Using the plugin manager install "Blue Ocean" plugin, open it and create pipeline.

- Enter your personal GitHub token value, select your Github account and the name of this repo

- Edit pipeline: create build, test, deploy stages similar to the [Jenkinsfile](https://github.com/vsilverman/cicd/tree/master/cdf-demo) in the current folder.

- Save the Jenkinsfile in the master branch and root folder of this repo

- After Jenkinsfile is editted and saved it should be executed without any errors.

- Switch to the docker-agent branch of this repo for [further instructions](https://github.com/vsilverman/cicd/tree/docker-agent/cdf-demo) on editting your Jenkinsfile .

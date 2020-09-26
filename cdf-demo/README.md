# How-To modify official Jenkins Docker image to enable ephemeral docker agents in the Jenkinsfile

This file describes the process of enabling docker agents inside declarative pipelines by cusomizing official Jenkins Docker image.

> **_NOTE:_** Below content is intended for demo purposes only, do not use it in production environment.

## Prerequisites

You had followed the process, described in the [master branch of this repo](https://github.com/vsilverman/cicd/tree/master/cdf-demo), and are running official Jenkins Docker image

## Steps

- Go to [your Jenkins host](http://localhost:8080).

- Using Blue Ocean pipeline editor add "maven:3-alpine" docker agent to the "Build" stage, as in Jenkinsfile of the current folder.

- Save modified pipeline in the root folder of this Github branch.  Verify that running of the modified pipeline cannot be completed successfully.

- Get the current list of plugins by executing the following command:

            ./get-plugins.sh

- Terminate currently running official Jenkins Docker container.

- Build and run your customized Jenkins Docker image by executing:

            make build run

- Go to [your Jenkins host](http://localhost:8080), running customized Jenkins. Verify that although setup wizard is bypassed all plugins are installed and admin user is created.

- Using Blue Ocean try to create new pipeline in the curent repo.  Blue Ocean will discover existing Jenkinsfile in the root folders of Github branches and will start executing them. Verify that pipelines executions in all branches had completed successfully.

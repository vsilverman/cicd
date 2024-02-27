# How-To modify official Jenkins Docker image to enable ephemeral docker agents in the Jenkinsfile

This file describes the process of enabling docker agents inside declarative pipelines by cusomizing official Jenkins Docker image. Those docker agents will have ephemeral nature, i.e. they will have temporary short life cycle within the scope of their declaration - will start at the beginning of the 'Build' stage and will be shut down at the end of it.

> **_NOTE:_** Below content is intended for demo purposes only, do not use it in production environment.

## Prerequisites

You had followed the process, described in the [master branch of this repo](https://github.com/vsilverman/cicd/tree/master/cdf-demo), and are running official Jenkins Docker image

## Steps

- Go to [your Jenkins host](http://localhost:8080).

- Using Blue Ocean pipeline editor add "maven:3-alpine" docker agent to the "Build" stage, as in [Jenkinsfile](https://github.com/vsilverman/cicd/blob/docker-agent/cdf-demo/Jenkinsfile) of the current folder.

- Save modified pipeline in the root folder of this Github branch.  Verify that running of the modified pipeline cannot be completed successfully.

- Get the current list of plugins by executing the following command:

            ./get-plugins.sh

- Terminate currently running official Jenkins Docker container.

- Build and run your customized Jenkins Docker image by executing:

            make build run

> **_NOTE:_** As outlined in [this article](http://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/) using socket solution in the `docker run ...` command provides a good alternative to traditional Docker-in-Docker containers, allowing to avoid associated with those containers nesting side effects.

- Go to [your Jenkins host](http://localhost:8080), running customized Jenkins. Verify that although setup wizard is bypassed all plugins are installed and admin user is created.

- Using Blue Ocean try to create new pipeline in the curent repo.  Blue Ocean will discover existing Jenkinsfile in the root folders of Github branches and will start executing them. Verify that pipelines executions in all branches had completed successfully.

- Now you can create more complex multibranch pipeline, having more stages in it.  As an example you can open and run [Simple Java Maven App](https://github.com/vsilverman/simple-java-maven-app) or even better your fork of it. Verify that running of this pipeline in all branches had also completed successfully.

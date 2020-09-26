DOCKER_IMG=myjenkins:1-lts

build:
	docker build -t ${DOCKER_IMG} .

run:
	# in case you are not using IDE, but just the terminal, uncomment the following command
	# docker run --rm --name my-cdf-demo -u root -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 ${DOCKER_IMG}

	# in case of IDE, like e.g. vscode, you may use simply the following:
	docker run -u root -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock ${DOCKER_IMG}

DOCKER_IMG=myjenkins:1-lts

build:
	docker build -t ${DOCKER_IMG} .

run:
	docker run -u root -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock ${DOCKER_IMG}
	# docker run --rm --name my-cdf-demo -u root -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 ${DOCKER_IMG}

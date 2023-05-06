image="bimg/alpine-ssh"
tag="1.0.0"

.PHONY: docker.build
docker.build:
	docker build --no-cache -t ${image} .

.PHONY: docker.push
docker.push:
	docker push ${image}
	docker tag ${image} ${image}:$(tag)
	docker push ${image}:$(tag)


.PHONY: docker.all
docker.all:docker.build docker.push

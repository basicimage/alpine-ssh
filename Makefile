image="bimg/alpine-ssh"
tag="1.0.0"

.PHONY: docker.build
docker.build:
	docker build --no-cache -t ${image} .

.PHONY: docker.push
docker.push:
	docker buildx build --platform linux/amd64,linux/arm64 --no-cache --push -t ${image} .
	docker buildx build --platform linux/amd64,linux/arm64 --no-cache --push -t ${image}:${tag} .

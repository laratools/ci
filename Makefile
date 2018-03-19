.DEFAULT_GOAL := help
.PHONY: *

help:
	echo "See Makefile for usage"

build:
	echo "Building Tag: $(TAG)"
	@docker build \
		--no-cache \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
		-t laratools/ci:$(TAG) \
		-f Dockerfile-$(TAG) .

test:
	echo "Testing Tag: $(TAG)"
	dgoss run -it laratools/ci:$(TAG)

build-all:
	make build TAG="7.0"
	make build TAG="7.1"
	make build TAG="7.2"

test-all:
	make test TAG="7.0"
	make test TAG="7.1"
	make test TAG="7.2"

push-all:
	docker push laratools/ci:7.0
	docker push laratools/ci:7.1
	docker push laratools/ci:7.2
	# Tag 7.2 as latest and 7
	docker tag laratools/ci:7.2 laratools/ci:7
	docker tag laratools/ci:7.2 laratools/ci:latest
	docker push laratools/ci:7
	docker push laratools/ci:latest

clean:
	docker ps -a -q | xargs docker rm -f
	docker images -q | xargs docker rmi -f
.DEFAULT_GOAL := help
SHELL := /bin/bash
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

push:
	echo "Pushing Tag: $(TAG)"; \
	docker push laratools/ci:$(TAG); \
	if [ "$(TAG)" = "7.4" ]; then \
		docker tag laratools/ci:$(TAG) laratools/ci:7; \
		docker push laratools/ci:7; \
	fi
	if [ "$(TAG)" = "8.0" ]; then \
    		docker tag laratools/ci:$(TAG) laratools/ci:8; \
    		docker tag laratools/ci:$(TAG) laratools/ci:latest; \
    		docker push laratools/ci:8; \
    		docker push laratools/ci:latest; \
    	fi

build-all:
	make build TAG="7.4"
	make build TAG="8.0"

test-all:
	make test TAG="7.4"
	make test TAG="8.0"

push-all:
	make push TAG="7.4"
	make push TAG="8.0"

clean:
	docker ps -a -q | xargs docker rm -f
	docker images -q | xargs docker rmi -f

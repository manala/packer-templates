.SILENT:
.PHONY: help clean build test

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

# Image - Version
IMAGE_VERSION_MAJOR = 2
IMAGE_VERSION_MINOR = 0
IMAGE_VERSION_PATCH = 6
IMAGE_DEBIAN        = wheezy

## Help
help:
	printf "${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	printf " make [target]\n\n"
	printf "${COLOR_COMMENT}Available targets:${COLOR_RESET}\n"
	awk '/^[a-zA-Z\-\_0-9\.@]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf " ${COLOR_INFO}%-16s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

#########
# Clean #
#########

## Clean
clean:
	printf "${COLOR_INFO}Clean output files ${COLOR_RESET}\n"
	rm -Rf output-*

#########
# Build #
#########

## Build - App - Dev @ Vagrant
build-app-dev@vagrant: IMAGE_BUILD = vagrant
build-app-dev@vagrant: build-app-dev

## Build - App - Dev @ Docker
build-app-dev@docker: IMAGE_BUILD = docker
build-app-dev@docker: build-app-dev

## Build - App - Test @ Docker
build-app-test@docker: IMAGE_BUILD = docker
build-app-test@docker: build-app-test

## Build - App - Php - Dev @ Docker
build-app-php-dev@docker: IMAGE_BUILD = docker
build-app-php-dev@docker: build-app-php-dev

build-app-dev: IMAGE_ENV         = dev
build-app-dev: IMAGE_DESCRIPTION = App - Dev - Debian
build-app-dev: build-app

build-app-test: IMAGE_ENV         = test
build-app-test: IMAGE_DESCRIPTION = App - Test - Debian
build-app-test: build-app

build-app-php-dev: IMAGE_ENV         = dev
build-app-php-dev: IMAGE_DESCRIPTION = App - Php - Dev - Debian
build-app-php-dev: build-app-php

build-app: IMAGE = app
build-app: clean build

build-app-php: IMAGE = app-php
build-app-php: clean build

build:
	printf "${COLOR_INFO}Build ${COLOR_RESET}manala/${IMAGE}-${IMAGE_ENV}-debian\n"
	packer build \
		-force \
		-var 'image=${IMAGE}' \
		-var 'image_description=${IMAGE_DESCRIPTION}' \
		-var 'image_version_major=${IMAGE_VERSION_MAJOR}' \
		-var 'image_version_minor=${IMAGE_VERSION_MINOR}' \
		-var 'image_version_patch=${IMAGE_VERSION_PATCH}' \
		-var 'image_env=${IMAGE_ENV}' \
		-only=${IMAGE_BUILD} \
		template.json

########
# Test #
########

## Test - App - Dev @ Vagrant
test-app-dev@vagrant: IMAGE_BUILD = vagrant
test-app-dev@vagrant: test-app-dev

## Test - App - Dev @ Docker
test-app-dev@docker: IMAGE_BUILD = docker
test-app-dev@docker: test-app-dev

## Test - App - Test @ Docker
test-app-test@docker: IMAGE_BUILD = docker
test-app-test@docker: test-app-test

## Test - App - Php - Dev @ Docker
test-app-php-dev@docker: export IMAGE_BUILD = docker
test-app-php-dev@docker: test-app-php-dev

test-app-dev: IMAGE_ENV = dev
test-app-dev: test-app

test-app-test: IMAGE_ENV = test
test-app-test: test-app

test-app-php-dev: IMAGE_ENV = dev
test-app-php-dev: test-app-php

test-app: IMAGE = app
test-app: test

test-app-php: IMAGE = app-php
test-app-php: test

test:
	printf "${COLOR_INFO}Test ${COLOR_RESET}manala/${IMAGE}-${IMAGE_ENV}-debian\n"
	if [ ${IMAGE_BUILD} = docker ]; then \
		echo "${COLOR_INFO}Docker run${COLOR_RESET}" \
		&& docker run \
			--rm \
			--volume `pwd`/tests:/srv/app \
			--tty --interactive \
			--privileged \
			--hostname ${IMAGE}-${IMAGE_ENV}-debian.test \
			manala/${IMAGE}-${IMAGE_ENV}-debian:${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR} \
			/bin/zsh \
	; else \
		echo "${COLOR_INFO}Add vagrant box${COLOR_RESET}" \
		&& vagrant box add ${IMAGE}-${IMAGE_ENV}-debian-${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}-virtualbox.box --name ${IMAGE}-${IMAGE_ENV}-debian --force \
		&& echo "${COLOR_INFO}Vagrant up${COLOR_RESET}" \
		&& cd tests \
		&& vagrant destroy --force \
		&& vagrant up --provider=virtualbox \
		&& vagrant ssh \
		&& vagrant destroy --force \
	; fi

.SILENT:
.PHONY: help

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

## Image
IMAGE_VERSION_MAJOR  = 3
IMAGE_VERSION_MINOR  = 0
IMAGE_VERSION_PATCH  = 2
IMAGE_VERSION_LATEST = true
IMAGE_VERSION        = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}

## Help
help:
	printf "${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	printf " make [target] type=[type]\n\n"
	printf "${COLOR_COMMENT}Available targets:${COLOR_RESET}\n"
	awk '/^[a-zA-Z\-\_0-9\.]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf " ${COLOR_INFO}%-16s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
	printf "\n${COLOR_COMMENT}Available types:${COLOR_RESET}\n"
	printf " ${COLOR_INFO}virtualbox${COLOR_RESET} Virtualbox\n"
	printf " ${COLOR_INFO}docker ${COLOR_RESET} Docker\n"

## Clean
clean:
	printf "${COLOR_INFO}Clean output files ${COLOR_RESET}\n"
	rm -Rf output-*

## Update
update:
	printf "${COLOR_INFO}Install ansible galaxy roles into ${COLOR_RESET}ansible/roles\n"
	rm -Rf ansible/roles/* && ansible-galaxy install -f -r ansible/roles.yml -p ansible/roles

## Build - App - Dev @ Vagrant
build-app-dev@vagrant: IMAGE             = app
build-app-dev@vagrant: IMAGE_DESCRIPTION = App - Dev - Debian
build-app-dev@vagrant: ENV               = dev
build-app-dev@vagrant: clean update build@vagrant

## Test - App - Dev @ Vagrant
test-app-dev@vagrant: IMAGE = app
test-app-dev@vagrant: ENV   = dev
test-app-dev@vagrant: test@vagrant

build@vagrant:
	printf "${COLOR_INFO}Build ${COLOR_RESET}manala/${IMAGE}-${ENV}-debian\n"
	packer build \
		-force \
		-var 'image=${IMAGE}' \
		-var 'image_description=${IMAGE_DESCRIPTION}' \
		-var 'image_version=${IMAGE_VERSION}' \
		-var 'env=${ENV}' \
		packer.json

test@vagrant:
	printf "${COLOR_INFO}Run ${COLOR_RESET}manala/${IMAGE}-${ENV}-debian\n"
	printf "${COLOR_INFO}Add vagrant box ${COLOR_RESET}\n"
	vagrant box add ${IMAGE}-${ENV}-debian-${IMAGE_VERSION}-virtualbox.box --name ${IMAGE}-${ENV}-debian --force
	printf "${COLOR_INFO}Install test ansible galaxy roles into ${COLOR_RESET}tests/vagrant/ansible/roles\n"
	#cd tests/vagrant && ansible-galaxy install -f -r ansible/roles.yml -p ansible/roles
	printf "${COLOR_INFO}Launch test vagrant ${COLOR_RESET}\n"
	-cd test && vagrant destroy --force && vagrant up --provider=virtualbox && vagrant ssh && vagrant destroy -f

## Build - App - Dev @ Docker
build-app-dev@docker: IMAGE             = app
build-app-dev@docker: IMAGE_DESCRIPTION = App - Dev - Debian
build-app-dev@docker: ENV               = dev
build-app-dev@docker: clean update build@docker

## Test - App - Dev @ Docker
test-app-dev@docker: IMAGE = app
test-app-dev@docker: ENV   = dev
test-app-dev@docker: test@docker

## Build - App - Test @ Docker
build-app-test@docker: IMAGE             = app
build-app-test@docker: IMAGE_DESCRIPTION = App - Test - Debian
build-app-test@docker: ENV               = test
build-app-test@docker: update build@docker

## Test - App - Test @ Docker
test-app-test@docker: IMAGE = app
test-app-test@docker: ENV   = test
test-app-test@docker: test@docker

## Build - App - Php - Dev @ Docker
build-app-php-dev@docker: IMAGE             = app-php
build-app-php-dev@docker: IMAGE_DESCRIPTION = App - Php - Dev - Debian
build-app-php-dev@docker: ENV               = dev
build-app-php-dev@docker: clean update build@docker

## Test - App - Php - Dev @ Docker
test-app-php-dev@docker: IMAGE = app-php
test-app-php-dev@docker: ENV   = dev
test-app-php-dev@docker: test@docker

DOCKER_IMAGE_TAGS = \
	--tag manala/${IMAGE}-${ENV}-debian:${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}

ifeq (${IMAGE_VERSION_LATEST},true)
	DOCKER_IMAGE_TAGS += --tag manala/${IMAGE}-${ENV}-debian
endif

build@docker:
	printf "${COLOR_INFO}Build ${COLOR_RESET}manala/${IMAGE}-${ENV}-debian\n"
	docker build \
		--pull \
		--rm \
		--force-rm \
		--no-cache \
		${DOCKER_IMAGE_TAGS} \
		--build-arg IMAGE="${IMAGE}" \
		--build-arg IMAGE_DESCRIPTION="${IMAGE_DESCRIPTION}" \
		--build-arg IMAGE_VERSION="${IMAGE_VERSION}" \
		--build-arg ENV="${ENV}" \
		.

test@docker:
	printf "${COLOR_INFO}Run ${COLOR_RESET}manala/${IMAGE}-${ENV}-debian\n"
	docker run \
		--rm \
		--volume `pwd`/test:/srv/app \
		--tty -i \
		--hostname ${IMAGE}-${ENV}-debian.test \
		manala/${IMAGE}-${ENV}-debian \
		/bin/bash

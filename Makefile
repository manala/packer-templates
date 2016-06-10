.SILENT:
.PHONY: help

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

# Image - Version 3
IMAGE_VERSION_3_LATEST = true
IMAGE_VERSION_3_MAJOR  = 3
IMAGE_VERSION_3_MINOR  = 0
IMAGE_VERSION_3_PATCH  = 4

# Image - Version 2
IMAGE_VERSION_2_LATEST = false
IMAGE_VERSION_2_MAJOR  = 2
IMAGE_VERSION_2_MINOR  = 0
IMAGE_VERSION_2_PATCH  = 1

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

#################
# App - Dev - 3 #
#################

## Build - App - Dev - 3 @ Vagrant
build-app-dev-3@vagrant: IMAGE                = app
build-app-dev-3@vagrant: IMAGE_ENV            = dev
build-app-dev-3@vagrant: IMAGE_VERSION_LATEST = ${IMAGE_VERSION_3_LATEST}
build-app-dev-3@vagrant: IMAGE_VERSION_MAJOR  = ${IMAGE_VERSION_3_MAJOR}
build-app-dev-3@vagrant: IMAGE_VERSION_MINOR  = ${IMAGE_VERSION_3_MINOR}
build-app-dev-3@vagrant: IMAGE_VERSION_PATCH  = ${IMAGE_VERSION_3_PATCH}
build-app-dev-3@vagrant: IMAGE_VERSION        = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}
build-app-dev-3@vagrant: IMAGE_DEBIAN         = jessie
build-app-dev-3@vagrant: IMAGE_DESCRIPTION    = App - Dev - Debian
build-app-dev-3@vagrant: clean update _build@vagrant

## Test - App - Dev - 3 @ Vagrant
test-app-dev-3@vagrant: IMAGE               = app
test-app-dev-3@vagrant: IMAGE_ENV           = dev
test-app-dev-3@vagrant: IMAGE_VERSION_MAJOR = ${IMAGE_VERSION_3_MAJOR}
test-app-dev-3@vagrant: IMAGE_VERSION_MINOR = ${IMAGE_VERSION_3_MINOR}
test-app-dev-3@vagrant: IMAGE_VERSION_PATCH = ${IMAGE_VERSION_3_PATCH}
test-app-dev-3@vagrant: IMAGE_VERSION       = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}
test-app-dev-3@vagrant: _test@vagrant

## Build - App - Dev - 3 @ Docker
build-app-dev-3@docker: IMAGE                = app
build-app-dev-3@docker: IMAGE_ENV            = dev
build-app-dev-3@docker: IMAGE_VERSION_LATEST = ${IMAGE_VERSION_3_LATEST}
build-app-dev-3@docker: IMAGE_VERSION_MAJOR  = ${IMAGE_VERSION_3_MAJOR}
build-app-dev-3@docker: IMAGE_VERSION_MINOR  = ${IMAGE_VERSION_3_MINOR}
build-app-dev-3@docker: IMAGE_VERSION_PATCH  = ${IMAGE_VERSION_3_PATCH}
build-app-dev-3@docker: IMAGE_VERSION        = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}
build-app-dev-3@docker: IMAGE_DEBIAN         = jessie
build-app-dev-3@docker: IMAGE_DESCRIPTION    = App - Dev - Debian
build-app-dev-3@docker: clean update _build@docker

## Test - App - Dev - 3 @ Docker
test-app-dev-3@docker: IMAGE               = app
test-app-dev-3@docker: IMAGE_ENV           = dev
test-app-dev-3@docker: IMAGE_VERSION_MAJOR = ${IMAGE_VERSION_3_MAJOR}
test-app-dev-3@docker: IMAGE_VERSION_MINOR = ${IMAGE_VERSION_3_MINOR}
test-app-dev-3@docker: _test@docker

#######################
# App - Php - Dev - 3 #
#######################

## Build - App - Php - Dev - 3 @ Docker
build-app-php-dev-3@docker: IMAGE                = app-php
build-app-php-dev-3@docker: IMAGE_ENV            = dev
build-app-php-dev-3@docker: IMAGE_VERSION_LATEST = ${IMAGE_VERSION_3_LATEST}
build-app-php-dev-3@docker: IMAGE_VERSION_MAJOR  = ${IMAGE_VERSION_3_MAJOR}
build-app-php-dev-3@docker: IMAGE_VERSION_MINOR  = ${IMAGE_VERSION_3_MINOR}
build-app-php-dev-3@docker: IMAGE_VERSION_PATCH  = ${IMAGE_VERSION_3_PATCH}
build-app-php-dev-3@docker: IMAGE_VERSION        = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}
build-app-php-dev-3@docker: IMAGE_DEBIAN         = jessie
build-app-php-dev-3@docker: IMAGE_DESCRIPTION    = App - Php - Dev - Debian
build-app-php-dev-3@docker: clean update _build@docker

## Test - App - Php - Dev - 3 @ Docker
test-app-php-dev-3@docker: IMAGE               = app-php
test-app-php-dev-3@docker: IMAGE_ENV           = dev
test-app-php-dev-3@docker: IMAGE_VERSION_MAJOR = ${IMAGE_VERSION_3_MAJOR}
test-app-php-dev-3@docker: IMAGE_VERSION_MINOR = ${IMAGE_VERSION_3_MINOR}
test-app-php-dev-3@docker: _test@docker

##################
# App - Test - 3 #
##################

## Build - App - Test - 3 @ Docker
build-app-test-3@docker: IMAGE                = app
build-app-test-3@docker: IMAGE_ENV            = test
build-app-test-3@docker: IMAGE_VERSION_LATEST = ${IMAGE_VERSION_3_LATEST}
build-app-test-3@docker: IMAGE_VERSION_MAJOR  = ${IMAGE_VERSION_3_MAJOR}
build-app-test-3@docker: IMAGE_VERSION_MINOR  = ${IMAGE_VERSION_3_MINOR}
build-app-test-3@docker: IMAGE_VERSION_PATCH  = ${IMAGE_VERSION_3_PATCH}
build-app-test-3@docker: IMAGE_VERSION        = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}
build-app-test-3@docker: IMAGE_DEBIAN         = jessie
build-app-test-3@docker: IMAGE_DESCRIPTION    = App - Test - Debian
build-app-test-3@docker: clean update _build@docker

## Test - App - Test - 3 @ Docker
test-app-test-3@docker: IMAGE               = app
test-app-test-3@docker: IMAGE_ENV           = test
test-app-test-3@docker: IMAGE_VERSION_MAJOR = ${IMAGE_VERSION_3_MAJOR}
test-app-test-3@docker: IMAGE_VERSION_MINOR = ${IMAGE_VERSION_3_MINOR}
test-app-test-3@docker: _test@docker

#################
# App - Dev - 2 #
#################

## Build - App - Dev - 2 @ Vagrant
build-app-dev-2@vagrant: IMAGE                = app
build-app-dev-2@vagrant: IMAGE_ENV            = dev
build-app-dev-2@vagrant: IMAGE_VERSION_LATEST = ${IMAGE_VERSION_2_LATEST}
build-app-dev-2@vagrant: IMAGE_VERSION_MAJOR  = ${IMAGE_VERSION_2_MAJOR}
build-app-dev-2@vagrant: IMAGE_VERSION_MINOR  = ${IMAGE_VERSION_2_MINOR}
build-app-dev-2@vagrant: IMAGE_VERSION_PATCH  = ${IMAGE_VERSION_2_PATCH}
build-app-dev-2@vagrant: IMAGE_VERSION        = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}
build-app-dev-2@vagrant: IMAGE_DEBIAN         = wheezy
build-app-dev-2@vagrant: IMAGE_DESCRIPTION    = App - Dev - Debian
build-app-dev-2@vagrant: clean update _build@vagrant

## Test - App - Dev - 2 @ Vagrant
test-app-dev-2@vagrant: IMAGE               = app
test-app-dev-2@vagrant: IMAGE_ENV           = dev
test-app-dev-2@vagrant: IMAGE_VERSION_MAJOR = ${IMAGE_VERSION_2_MAJOR}
test-app-dev-2@vagrant: IMAGE_VERSION_MINOR = ${IMAGE_VERSION_2_MINOR}
test-app-dev-2@vagrant: IMAGE_VERSION_PATCH = ${IMAGE_VERSION_2_PATCH}
test-app-dev-2@vagrant: IMAGE_VERSION       = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}
test-app-dev-2@vagrant: _test@vagrant

## Build - App - Dev - 2 @ Docker
build-app-dev-2@docker: IMAGE                = app
build-app-dev-2@docker: IMAGE_ENV            = dev
build-app-dev-2@docker: IMAGE_VERSION_LATEST = ${IMAGE_VERSION_2_LATEST}
build-app-dev-2@docker: IMAGE_VERSION_MAJOR  = ${IMAGE_VERSION_2_MAJOR}
build-app-dev-2@docker: IMAGE_VERSION_MINOR  = ${IMAGE_VERSION_2_MINOR}
build-app-dev-2@docker: IMAGE_VERSION_PATCH  = ${IMAGE_VERSION_2_PATCH}
build-app-dev-2@docker: IMAGE_VERSION        = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}
build-app-dev-2@docker: IMAGE_DEBIAN         = wheezy
build-app-dev-2@docker: IMAGE_DESCRIPTION    = App - Dev - Debian
build-app-dev-2@docker: clean update _build@docker

## Test - App - Dev - 2 @ Docker
test-app-dev-2@docker: IMAGE               = app
test-app-dev-2@docker: IMAGE_ENV           = dev
test-app-dev-2@docker: IMAGE_VERSION_MAJOR = ${IMAGE_VERSION_2_MAJOR}
test-app-dev-2@docker: IMAGE_VERSION_MINOR = ${IMAGE_VERSION_2_MINOR}
test-app-dev-2@docker: _test@docker

#######################
# App - Php - Dev - 2 #
#######################

## Build - App - Php - Dev - 2 @ Docker
build-app-php-dev-2@docker: IMAGE                = app-php
build-app-php-dev-2@docker: IMAGE_ENV            = dev
build-app-php-dev-2@docker: IMAGE_VERSION_LATEST = ${IMAGE_VERSION_2_LATEST}
build-app-php-dev-2@docker: IMAGE_VERSION_MAJOR  = ${IMAGE_VERSION_2_MAJOR}
build-app-php-dev-2@docker: IMAGE_VERSION_MINOR  = ${IMAGE_VERSION_2_MINOR}
build-app-php-dev-2@docker: IMAGE_VERSION_PATCH  = ${IMAGE_VERSION_2_PATCH}
build-app-php-dev-2@docker: IMAGE_VERSION        = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}
build-app-php-dev-2@docker: IMAGE_DEBIAN         = wheezy
build-app-php-dev-2@docker: IMAGE_DESCRIPTION    = App - Php - Dev - Debian
build-app-php-dev-2@docker: clean update _build@docker

## Test - App - Php - Dev - 2 @ Docker
test-app-php-dev-2@docker: IMAGE               = app-php
test-app-php-dev-2@docker: IMAGE_ENV           = dev
test-app-php-dev-2@docker: IMAGE_VERSION_MAJOR = ${IMAGE_VERSION_2_MAJOR}
test-app-php-dev-2@docker: IMAGE_VERSION_MINOR = ${IMAGE_VERSION_2_MINOR}
test-app-php-dev-2@docker: _test@docker

##################
# App - Test - 2 #
##################

## Build - App - Test - 2 @ Docker
build-app-test-2@docker: IMAGE                = app
build-app-test-2@docker: IMAGE_ENV            = test
build-app-test-2@docker: IMAGE_VERSION_LATEST = ${IMAGE_VERSION_2_LATEST}
build-app-test-2@docker: IMAGE_VERSION_MAJOR  = ${IMAGE_VERSION_2_MAJOR}
build-app-test-2@docker: IMAGE_VERSION_MINOR  = ${IMAGE_VERSION_2_MINOR}
build-app-test-2@docker: IMAGE_VERSION_PATCH  = ${IMAGE_VERSION_2_PATCH}
build-app-test-2@docker: IMAGE_VERSION        = ${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}.${IMAGE_VERSION_PATCH}
build-app-test-2@docker: IMAGE_DEBIAN         = jessie
build-app-test-2@docker: IMAGE_DESCRIPTION    = App - Test - Debian
build-app-test-2@docker: clean update _build@docker

## Test - App - Test - 2 @ Docker
test-app-test-2@docker: IMAGE               = app
test-app-test-2@docker: IMAGE_ENV           = test
test-app-test-2@docker: IMAGE_VERSION_MAJOR = ${IMAGE_VERSION_2_MAJOR}
test-app-test-2@docker: IMAGE_VERSION_MINOR = ${IMAGE_VERSION_2_MINOR}
test-app-test-2@docker: _test@docker

###########
# Vagrant #
###########

_build@vagrant:
	printf "${COLOR_INFO}Build ${COLOR_RESET}manala/${IMAGE}-${IMAGE_ENV}-debian\n"
	packer build \
		-force \
		-var 'image=${IMAGE}' \
		-var 'image_description=${IMAGE_DESCRIPTION}' \
		-var 'image_version=${IMAGE_VERSION}' \
		-var 'image_env=${IMAGE_ENV}' \
		packer.${IMAGE_DEBIAN}.json

_test@vagrant:
	printf "${COLOR_INFO}Run ${COLOR_RESET}manala/${IMAGE}-${IMAGE_ENV}-debian\n"
	printf "${COLOR_INFO}Add vagrant box ${COLOR_RESET}\n"
	vagrant box add ${IMAGE}-${IMAGE_ENV}-debian-${IMAGE_VERSION}-virtualbox.box --name ${IMAGE}-${IMAGE_ENV}-debian --force
	printf "${COLOR_INFO}Install test ansible galaxy roles into ${COLOR_RESET}tests/vagrant/ansible/roles\n"
	#cd tests/vagrant && ansible-galaxy install -f -r ansible/roles.yml -p ansible/roles
	printf "${COLOR_INFO}Launch test vagrant ${COLOR_RESET}\n"
	-cd test && vagrant destroy --force && vagrant up --provider=virtualbox && vagrant ssh && vagrant destroy -f

##########
# Docker #
##########

DOCKER_IMAGE_TAGS = \
	--tag manala/${IMAGE}-${IMAGE_ENV}-debian:${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR}

ifeq (${IMAGE_VERSION_LATEST},true)
	DOCKER_IMAGE_TAGS += --tag manala/${IMAGE}-${IMAGE_ENV}-debian
endif

_build@docker:
	printf "${COLOR_INFO}Build ${COLOR_RESET}manala/${IMAGE}-${IMAGE_ENV}-debian\n"
	docker build \
		--pull \
		--rm \
		--force-rm \
		--no-cache \
		${DOCKER_IMAGE_TAGS} \
		--build-arg IMAGE="${IMAGE}" \
		--build-arg IMAGE_DESCRIPTION="${IMAGE_DESCRIPTION}" \
		--build-arg IMAGE_VERSION="${IMAGE_VERSION}" \
		--build-arg ENV="${IMAGE_ENV}" \
		--file Dockerfile.${IMAGE_DEBIAN} \
		.

_test@docker:
	printf "${COLOR_INFO}Run ${COLOR_RESET}manala/${IMAGE}-${IMAGE_ENV}-debian\n"
	docker run \
		--rm \
		--volume `pwd`/test:/srv/app \
		--tty -i \
		--hostname ${IMAGE}-${IMAGE_ENV}-debian.test \
		manala/${IMAGE}-${IMAGE_ENV}-debian:${IMAGE_VERSION_MAJOR}.${IMAGE_VERSION_MINOR} \
		/bin/bash

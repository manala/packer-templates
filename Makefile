.SILENT:
.PHONY: help

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[33m
COLOR_ERROR   = \033[31m

template      = app-dev-debian
version       = $(shell grep '"version"' template.json | sed 's/^.*"version"[ ]*:[ ]*"\([0-9].[0-9].[0-9]*\).*$$/\1/')
version_minor = $(shell echo ${version} | sed 's/^\([0-9].[0-9]\).[0-9]*$$/\1/')

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

## Build
build: clean update
ifeq (${type}, docker)
	mkdir -p ~/.packer.d/tmp
	TMPDIR=~/.packer.d/tmp packer build -only=docker template.json
else
	packer build -only=virtualbox template.json
endif

## Test
test:
ifeq (${type}, docker)
	cat ${template}-${version}-docker.tar | docker import - ${template}
	docker run --rm --user docker --workdir /home/docker --tty -i ${template} /bin/zsh
else
	printf "${COLOR_INFO}Add vagrant box ${COLOR_RESET}\n"
	vagrant box add ${template}-${version}-virtualbox.box --name ${template} --force
	-cd tests/vagrant && vagrant destroy --force && vagrant up && vagrant ssh && vagrant destroy -f
endif

## Clean
clean:
	printf "${COLOR_INFO}Clean output files ${COLOR_RESET}\n"
	rm -Rf output-*

## Update
update: update-roles

## Update roles
update-roles:
	printf "${COLOR_INFO}Install ansible galaxy roles into ${COLOR_RESET}ansible/roles:\n"
	ansible-galaxy install -f -r ansible/roles.yml -p ansible/roles

FROM debian:jessie

MAINTAINER Manala <contact@manala.io>

# Image
ARG IMAGE
ARG IMAGE_DESCRIPTION
ARG IMAGE_VERSION

# Env
ARG ENV

WORKDIR /tmp

COPY scripts scripts

RUN sh scripts/apt.sh \
    && sh scripts/ansible.sh

COPY ansible ansible

RUN ansible-playbook ansible/setup.yml

USER app

RUN ansible-playbook \
        --extra-vars "\
image='$IMAGE' \
image_description='$IMAGE_DESCRIPTION' \
image_version='$IMAGE_VERSION'" \
        ansible/app.yml

RUN sudo sh scripts/clean.sh

WORKDIR /srv/app

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

RUN echo "localhost ansible_connection=local\n\n\
[env_$ENV]\n\
localhost\n\n\
[env_$ENV:vars]\n\
env=$ENV\n" > /etc/ansible/hosts \
    && ansible-playbook ansible/setup.yml

USER app

RUN ansible-playbook \
        --become \
        --extra-vars "\
image='$IMAGE' \
image_description='$IMAGE_DESCRIPTION' \
image_version='$IMAGE_VERSION'" \
        ansible/skeleton.yml

RUN sudo sh scripts/clean.sh

WORKDIR /srv/app

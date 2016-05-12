FROM debian:jessie

MAINTAINER Manala <contact@manala.io>

# Image
ARG IMAGE
ARG IMAGE_DESCRIPTION
ARG IMAGE_VERSION

# Arg
ARG APP_ENV
ARG APP_USER
ARG APP_GROUP
ARG APP_DIR

WORKDIR /tmp

COPY scripts scripts

RUN sh scripts/apt.sh \
    && sh scripts/ansible.sh

COPY ansible ansible

RUN echo "localhost ansible_connection=local" >> /etc/ansible/hosts \
    && ansible-playbook ansible/playbook.yml \
    --extra-vars "\
        image='$IMAGE' \
        image_description='$IMAGE_DESCRIPTION' \
        image_version='$IMAGE_VERSION' \
        app_env='$APP_ENV' \
        app_user='$APP_USER' \
        app_group='$APP_GROUP' \
        app_dir='$APP_DIR' \
    "

RUN sh scripts/clean.sh

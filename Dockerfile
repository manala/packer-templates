FROM debian:jessie

MAINTAINER Manala <contact@manala.io>

WORKDIR /tmp

COPY scripts scripts

RUN sh scripts/apt.sh \
    && sh scripts/ansible.sh

COPY ansible ansible

RUN echo "localhost ansible_connection=local" >> /etc/ansible/hosts \
    && ansible-playbook ansible/playbook.yml

RUN sh scripts/clean.sh

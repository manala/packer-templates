#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)

mkdir --parents --mode 0700 /home/manala/.ssh
chown manala:manala /home/manala/.ssh

cat ${DIR}/../keys/vagrant.pub >> /home/manala/.ssh/authorized_keys
chmod 0600 /home/manala/.ssh/authorized_keys
chown manala:manala /home/manala/.ssh/authorized_keys

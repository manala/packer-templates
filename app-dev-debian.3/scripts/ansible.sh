#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get -y --no-install-recommends install ansible alt-galaxy

cat <<EOF > /etc/ansible/hosts
localhost ansible_connection=local ansible_become=true

[app_$ENV]
localhost

[app_$ENV:vars]
env=$ENV

[app_local]
localhost

[app_local:vars]
env=$ENV

[app:children]
app_$ENV
app_local
EOF

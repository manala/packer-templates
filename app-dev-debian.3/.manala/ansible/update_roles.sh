#!/bin/sh

printf "[\033[36mManala\033[0m] \033[32mAnsible - Update roles\033[0m\n"

ROLE_FILE="${1}"

if [ "${2}" != "" ]; then
    ROLES_PATH="${2}"
else
    ROLES_PATH="/etc/ansible/roles"
fi

alt-galaxy install --role-file=${ROLE_FILE} --roles-path=${ROLES_PATH} --force

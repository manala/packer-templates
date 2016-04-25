#!/bin/bash

# Allow null user passwords
sed -i 's/pam_unix.so nullok_secure/pam_unix.so nullok/' /etc/pam.d/common-auth

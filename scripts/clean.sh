#!/bin/bash

# Clean apt
apt-get -y --purge autoremove
apt-get -y clean

# Clean tmp
rm -Rf /tmp/*

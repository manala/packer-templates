#!/bin/bash

# Clean apt
apt-get -y --purge autoremove
apt-get -y clean
rm -rf /var/lib/apt/lists/*

# Clean tmp
rm -rf /tmp/*

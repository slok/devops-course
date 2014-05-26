#!/bin/bash

PATTERN=$1

# Deactivate ubuntu information
ansible $PATTERN --sudo -m file -a "path=/usr/share/landscape/landscape-sysinfo.wrapper mode=0644" -i ./hosts

# Copy the resource
ansible $PATTERN --sudo -m copy -a "src=./files/doge.txt dest=/home/vagrant/doge.txt owner=vagrant group=vagrant mode=0644" -i ./hosts

# Create our new motd
ansible $PATTERN --sudo -m copy -a "src=./files/30-doge dest=/etc/update-motd.d/30-doge owner=root group=root mode=0544" -i ./hosts

# force to update motd
ansible $PATTERN --sudo -m command -a "run-parts /etc/update-motd.d/" -i ./hosts
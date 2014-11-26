#!/bin/bash
# Nakopirovat do /bin
set -e

# SET HOSTNAME
oldname=$(hostname)
hostname "$1"
sed -i -e s/$oldname/"$1"/g /etc/hosts
sed -i -e s/$oldname/"$1"/g /etc/sysconfig/network

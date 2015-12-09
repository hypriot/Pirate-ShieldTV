#!/bin/bash
#
# run this script as root
#

if [ "$(stat -c %d:%i /)" != "$(stat -c %d:%i /proc/1/root/.)" ]; then
  echo "We are chrooted!"
else
  echo "Business as usual"
fi
    
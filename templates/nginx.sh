#!/bin/bash
apt-get update
apt-get upgrade -y -o Dpkg::Options::="--force-confold"

#Ruby dependency

apt-get update
sudo apt-get install -y --no-install-recommends \
    nginx

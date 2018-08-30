#!/bin/bash

mkdir certs

openssl req \
	-newkey rsa:4096 \
	-nodes -sha256 \
	-keyout certs/daemon.key \
	-x509 \
	-days 365 \
	-config daemon.cnf \
	-out certs/daemon.crt

sudo mkdir /etc/ssl/certs/docker/
sudo cp -v certs/daemon.* /etc/ssl/certs/docker/

sudo mkdir -p /etc/docker/certs.d/registry.local:5000
sudo cp -v /etc/ssl/certs/docker/daemon.crt /etc/docker/certs.d/registry.local\:5000/

rm -rf certs
sudo cp daemon.json /etc/docker/

exit 0


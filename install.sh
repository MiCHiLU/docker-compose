#!/bin/sh

type docker-compose && exit 0

# https://docs.docker.com/compose/install/#install-compose
curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
&& chmod +x /usr/local/bin/docker-compose \
&& docker-compose version

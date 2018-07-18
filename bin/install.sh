#!/bin/sh

type docker-compose && exit 0
set -x

# https://docs.docker.com/compose/install/#install-compose
curl -fL https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
&& chmod +x /usr/local/bin/docker-compose \
&& docker-compose version

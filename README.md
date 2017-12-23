    $ ./bin/metayaml *.yaml > ~/docker-compose.yml

.zshrc:

    if type docker-compose > /dev/null 2>&1; then
      export COMPOSE_FILE="docker-compose/docker-compose.yml"
      for i (docker-compose/*.yaml) alias $i:t:r="docker-compose run $i:t:r"
    fi;

conoha:

    conoha-cli network add-security-group --name docker
    conoha-cli network add-rule --group docker --direction ingress --ethertype ipv4 --port 2376 --protocol tcp
    conoha-cli network add-rule --group docker --direction ingress --ethertype ipv6 --port 2376 --protocol tcp

    docker-machine create conoha
    docker-machine provision conoha
    docker-machine env conoha
    docker-machine ls

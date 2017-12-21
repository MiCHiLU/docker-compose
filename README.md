    $ ./bin/metayaml *.yaml > ~/docker-compose.yml

.zshrc:

    if type docker-compose > /dev/null 2>&1; then
      export COMPOSE_FILE="docker-compose/docker-compose.yml"
      for i (docker-compose/*.yaml) alias $i:t:r="docker-compose run $i:t:r"
    fi;

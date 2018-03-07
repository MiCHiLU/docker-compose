conoha:

    conoha-cli network add-security-group --name docker
    conoha-cli network add-rule --group docker --direction ingress --ethertype ipv4 --port 2376 --protocol tcp
    conoha-cli network add-rule --group docker --direction ingress --ethertype ipv6 --port 2376 --protocol tcp

    docker-machine create conoha
    docker-machine provision conoha
    docker-machine env conoha
    docker-machine ls

Got a error of TLS on conoha-cli:

    export PIP_REQUIRE_VIRTUALENV=true
    /Applications/Python\ 3.6/Install\ Certificates.command
    export PIP_REQUIRE_VIRTUALENV=false

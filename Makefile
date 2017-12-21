docker-compose.yml: *.yaml
	./bin/metayaml *.yaml > $@

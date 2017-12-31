docker-compose.yml: *.yaml
	yq merge *.yaml > $@

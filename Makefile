OPTOUT=gradle java
YAML=$(filter-out $(addsuffix .yaml,$(OPTOUT)),$(wildcard *.yaml))

docker-compose.yml: $(YAML)
	yq merge $(YAML) > $@

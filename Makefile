OPTOUT=\
  bazel\
  gradle\
  java\
  protoc\
  protoeasyd\
  swagger\

YAML=$(filter-out $(addsuffix .yaml,$(OPTOUT)),$(wildcard *.yaml))

docker-compose.yml: $(YAML)
	yq merge $(YAML) > $@

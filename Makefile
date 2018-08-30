DOCKER_COMPOSE= docker-compose
DOCKER        = docker
CONTAINER_NAME= registry

all: status

status:
	@$(DOCKER) stats --all --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"
images: 
	@$(DOCKER) images --format "{{.Repository}}:{{.Tag}}"| sort
ls:
	@$(DOCKER) images --format "{{.ID}}: {{.Repository}}"
size:
	@$(DOCKER) images --format "{{.Size}}\t: {{.Repository}}"
tags:
	@$(DOCKER) images --format "{{.Tag}}\t: {{.Repository}}"| sort -t ':' -k2 -n
net:
	@$(DOCKER) network ls

rm-network:
	@$(DOCKER) network ls| awk '$$2 !~ "(bridge|host|none)" {print "docker network rm " $$1}' | sed '1d'

ps:
	$(DOCKER) ps -a

up:
	$(DOCKER_COMPOSE) up -d
stop:
	$(DOCKER) stop $(CONTAINER_NAME)
rm:
	$(DOCKER)  rm -v $(CONTAINER_NAME)
clean: stop rm

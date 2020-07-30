PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
UID := $(shell id -u)
GID := $(shell id -g)
DOCKER_COMPOSE?=docker-compose

help:
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##
##Setups
##---------------------------------------------------------------------------
.PHONY: up down prod dev phpmyadmin logs
up: 										## launch all containers
	$(DOCKER_COMPOSE) up -d
down: 										## destroy all containers (without volumes)
	$(DOCKER_COMPOSE) down --remove-orphans
prod: 										## launch prod
	$(DOCKER_COMPOSE) up -d db webserver prod
dev: 										## launch dev
	$(DOCKER_COMPOSE) up -d db webserver phpmyadmin dev
phpmyadmin: 								## launch phpmyadmin only
	$(DOCKER_COMPOSE) up -d db webserver phpmyadmin
logs:										## show logs
	$(DOCKER_COMPOSE) logs -f
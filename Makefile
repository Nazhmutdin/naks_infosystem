#!make
include .env


#=============================================================================================


gen-cert:
	sh ./scripts/generate_ssl_certificates.sh

gen-localhost-cert:
	sh ./scripts/generate_localhost_ssl_certificates.sh


#=============================================================================================


up-build-prod:
	docker compose -f docker-compose.yml -f production.docker-compose.yml up --build $(container-name)

start-prod:
	docker compose -f docker-compose.yml -f production.docker-compose.yml start $(container-name)

stop-prod:
	docker compose -f docker-compose.yml -f production.docker-compose.yml stop $(container-name)

down-prod:
	docker compose -f docker-compose.yml -f production.docker-compose.yml down $(container-name)


#=============================================================================================


up-build-dev:
	docker compose -f docker-compose.yml -f dev.docker-compose.yml up --build $(container-name)

start-dev:
	docker compose -f docker-compose.yml -f dev.docker-compose.yml start $(container-name)

stop-dev:
	docker compose -f docker-compose.yml -f dev.docker-compose.yml stop $(container-name)

down-dev:
	docker compose -f docker-compose.yml -f dev.docker-compose.yml down $(container-name)


#=============================================================================================


move-file:
	scp -i ~/.ssh/cloudru $(path-from) ${USER}@${IP}:$(path-to)

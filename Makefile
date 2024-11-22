#!make
include .env

gen-cert:
	sh ./scripts/generate_ssl_certificates.sh

gen-localhost-cert:
	sh ./scripts/generate_localhost_ssl_certificates.sh

pull-recurse:
	git pull --recurse-submodules

up-build-prod:
	docker compose -f production.docker-compose.yml up --build $(container-name)

down-prod:
	docker compose -f production.docker-compose.yml down $(container-name)

up-build-dev:
	docker compose -f dev.docker-compose.yml up --watch --build $(container-name)

down-dev:
	docker compose -f dev.docker-compose.yml down $(container-name)

start-dev:
	docker compose -f dev.docker-compose.yml start $(container-name)

start-prod:
	docker compose -f production.docker-compose.yml start $(container-name)

stop:
	docker compose stop $(container-name)

move-file:
	scp -i ~/.ssh/cloudru $(path-from) ${USER}@${IP}:$(path-to)

reload-nginx-container:
	docker exec -it nginx nginx -s reload

restore-data:
	cat ./dumps/users.sql | docker compose exec -T db psql -d ${AUTH_DATABASE_NAME} -U ${USER}
	cat ./dumps/personal-data.sql | docker compose exec -T db psql -d ${BACKEND_DATABASE_NAME} -U ${USER}
	cat ./dumps/personal-naks-certification-data.sql | docker compose exec -T db psql -d ${BACKEND_DATABASE_NAME} -U ${USER}
	cat ./dumps/ndt-data.sql | docker compose exec -T db psql -d ${BACKEND_DATABASE_NAME} -U ${USER}
	cat ./dumps/acst-data.sql | docker compose exec -T db psql -d ${BACKEND_DATABASE_NAME} -U ${USER}

dump-data:
	docker exec -it db pg_dump -d rhi -U ${USER} > $(file-name).sql -a
	docker exec -it auth_db pg_dump -d rhi_auth -U ${USER} > $(file-name)_auth.sql -a

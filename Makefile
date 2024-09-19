#!make
include .env

gen-cert:
	sh ./scripts/generate_ssl_certificates.sh

gen-localhost-cert:
	sh ./scripts/generate_localhost_ssl_certificates.sh

pull-recurse:
	git pull --recurse-submodules

up:
	docker compose up $(container-name)

up-d:
	docker compose up -d $(container-name)

build:
	docker compose build $(container-name)

up-build:
	docker compose up --build $(container-name)

up-build-d:
	docker compose up --build -d $(container-name)

up-build-nginx:
	docker compose up --build nginx

up-build-d-nginx:
	docker compose up --build -d nginx

start:
	docker compose start $(container-name)

stop:
	docker compose stop $(container-name)

move-file:
	scp -i ~/.ssh/cloudru $(path-from) ${USER}@${IP}:$(path-to)

reload-nginx-container:
	docker exec -it nginx nginx -s reload

dump-data:
	docker exec -it db pg_dump -d rhi -U ${USER} > $(file-name).sql -a
	docker exec -it auth_db pg_dump -d rhi_auth -U ${USER} > $(file-name)_auth.sql -a

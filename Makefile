#!make
include .env

build:
	docker compose build

up-build:
	docker compose up --build $(container-name)

up-build-d:
	docker compose up --build -d $(container-name)

start:
	docker compose start $(container-name)

stop:
	docker compose stop $(container-name)

move-file:
	scp -i ~/.ssh/cloudru $(file-name) nazhmutdin@${IP_NGINX}:/home/nazhmutdin/naks_infosystem

reload-nginx-container:
	docker exec -it nginx nginx -s reload

dump-data:
	docker exec -it db pg_dump -d rhi -U ${USER} > $(file-name).sql -a
	docker exec -it auth_db pg_dump -d rhi_auth -U ${USER} > $(file-name)_auth.sql -a

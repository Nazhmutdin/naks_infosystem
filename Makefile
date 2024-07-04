#!make
include .env

build:
	docker compose build

up-build:
	docker compose up --build
	
start:
	docker compose start

stop:
	docker compose stop

move-env:
	scp -i ~/.ssh/cloudru .env nazhmutdin@${IP_NGINX}:/home/nazhmutdin/naks_infosystem

reload-nginx-container:
	docker exec -it nginx nginx -s reload

dump-data:
	docker exec -it db pg_dump -d rhi -U ${USER} > $(file_name).sql -a
	docker exec -it auth_db pg_dump -d rhi_auth -U ${USER} > $(file_name)_auth.sql -a

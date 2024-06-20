#!make
include .env

build:
	docker compose build
	
start:
	docker compose start

stop:
	docker compose stop

move_env:
	scp -i ~/.ssh/cloudru .env nazhmutdin@${IP_NGINX}:/home/nazhmutdin/naks_infosystem

reload_nginx:
	docker exec -it nginx nginx -s reload

dump_data:
	docker exec -it db pg_dump -d rhi -U ${USER} > $(file_name) -a

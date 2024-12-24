if [ $1 ]; then 
    folder_name=$1
else
    folder_name=$(date +%d.%m.%Y)
fi

echo $1

db_container_id=$(sudo docker ps -aqf "name=rencons-infosystem-db")

mkdir ./dumps/${folder_name}

docker compose exec db pg_dump -U ${USER} --inserts -a -d rhi_backend -f backend-data.sql
docker compose exec db pg_dump -U ${USER} --inserts -a -d rhi_auth -f auth-data.sql
docker compose exec db pg_dump -U ${USER} --inserts -a -d rhi_files -f files-data.sql

docker cp ${db_container_id}:/backend-data.sql ./dumps/${folder_name}/
docker cp ${db_container_id}:/auth-data.sql ./dumps/${folder_name}/
docker cp ${db_container_id}:/files-data.sql ./dumps/${folder_name}/

docker compose exec db rm backend-data.sql
docker compose exec db rm auth-data.sql 
docker compose exec db rm files-data.sql
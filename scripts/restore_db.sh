if [ $1 ]; then 
    dump_version=$1

    cat ./dumps/${dump_version}/backend-data.sql | docker compose exec -T db psql -d rhi_backend -U ${USER}
    cat ./dumps/${dump_version}/auth-data.sql | docker compose exec -T db psql -d rhi_auth -U ${USER}
    cat ./dumps/${dump_version}/files-data.sql | docker compose exec -T db psql -d rhi_files -U ${USER}
else
    echo "version name required"
fi

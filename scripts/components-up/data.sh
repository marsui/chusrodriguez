#!/usr/bin/env bash

project_dir=$(pwd)

access_key=${AWS_ACCESS_KEY_ID:-none}
secret_key=${AWS_SECRET_ACCESS_KEY:-none}
region=${AWS_REGION:-eu-west-1}

environment=${ENVIRONMENT:-yarn}

db_host=($(node util/rds-endpoint.js))
db_name=${DB_NAME:-chusrodriguez}
db_user=${DB_USERNAME:-root}
db_password=$DB_ROOT_PASSWORD

docker build -t psql-loader:latest infra/db-data
docker run -ti -e PGSQL_USER=$db_user -e PGSQL_PASS=$db_password -e PGSQL_HOST=$db_host -e PGSQL_DB=$db_name psql-builder:latest

#!/usr/bin/env bash

project_dir=$(pwd)
access_key=${AWS_ACCESS_KEY_ID:-none}
secret_key=${AWS_SECRET_ACCESS_KEY:-none}
region=${AWS_REGION:-eu-west-1}
environment=${ENVIRONMENT:-yarn}
db_name=${DB_NAME:-chusrodriguez}
db_user=${DB_USERNAME:-chusrodriguez}
db_password=$DB_PASSWORD

if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/terraform.sh
fi

./vendor/terraform/terraform destroy -var aws_region=$region -var db_name=$db_name -var db_user=$db_user -var db_password=$db_password -var environment=$environment -var aws_access_key=$access_key -var aws_secret_key=$secret_key -state $environment.tfstate infra/db

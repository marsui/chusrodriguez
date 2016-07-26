#!/usr/bin/env bash

sha=$(git rev-parse --short HEAD)

access_key=${AWS_ACCESS_KEY_ID:-none}
secret_key=${AWS_SECRET_ACCESS_KEY:-none}
region=${AWS_REGION:-eu-central-1}
environment=${ENVIRONMENT:-ovillo}

db_host="${environment}-db.tallerchusrodriguez.com"
db_name=${DB_NAME:-chusrodriguez}
db_user=${DB_USERNAME:-chusrodriguez}
db_password=$DB_ROOT_PASSWORD

access_key_ses=${AWS_ACCESS_KEY_ID_SES:-none}
secret_key_ses=${AWS_SECRET_ACCESS_KEY_SES:-none}
access_key_s3=${AWS_ACCESS_KEY_ID_S3:-none}
secret_key_s3=${AWS_SECRET_ACCESS_KEY_S3:-none}
images_bucket=${IMAGES_BUCKET:-none}

hosted_zone_id=${HOSTED_ZONE_ID:-none}

mkdir -p .ebextensions
touch .ebextensions/.config
echo "option_settings:" > .ebextensions/.config
echo "  - option_name: CHUSRODRIGUEZ_PGSQL_CONNECTION" >> .ebextensions/.config
echo "    value: \"postgres://${db_user}:${db_password}@${db_host}/${db_name}\"" >> .ebextensions/.config
echo "  - option_name: AWS_ACCESS_KEY_ID" >> .ebextensions/.config
echo "    value: \"${access_key_ses}\"" >> .ebextensions/.config
echo "  - option_name: AWS_SECRET_ACCESS_KEY" >> .ebextensions/.config
echo "    value: \"${secret_key_ses}\"" >> .ebextensions/.config
echo "  - option_name: AWS_ACCESS_KEY_ID_S3" >> .ebextensions/.config
echo "    value: \"${access_key_s3}\"" >> .ebextensions/.config
echo "  - option_name: AWS_SECRET_ACCESS_KEY_S3" >> .ebextensions/.config
echo "    value: \"${secret_key_s3}\"" >> .ebextensions/.config
echo "  - option_name: IMAGES_BUCKET" >> .ebextensions/.config
echo "    value: \"${images_bucket}\"" >> .ebextensions/.config


touch .credentials
echo "[default]" >> .credentials
echo "aws_access_key_id=${access_key}" >> .credentials
echo "aws_secret_access_key=${secret_key}" >> .credentials

mkdir -p ~/.aws
mv .credentials ~/.aws/credentials


sudo pip install awsebcli

eb init -r $region -p Docker chusrodriguez-$environment-application
eb create $environment-$sha

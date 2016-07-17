#!/usr/bin/env bash

sha=$(git rev-parse --short HEAD)

access_key=${AWS_ACCESS_KEY_ID:-none}
secret_key=${AWS_SECRET_ACCESS_KEY:-none}
region=${AWS_REGION:-eu-west-1}

pgsql_connection=${CHUSRODRIGUEZ_PGSQL_CONNECTION_STRING:-none}
access_key_ses=${AWS_ACCESS_KEY_ID_SES:-none}
secret_key_ses=${AWS_SECRET_ACCESS_KEY_SES:-none}

environment=${ENVIRONMENT:-thread}

mkdir -p .ebextensions
touch .ebextensions/.config
echo "option_settings:" >> .ebextensions/.config
echo "  - option_name: CHUSRODRIGUEZ_PGSQL_CONNECTION" >> .ebextensions/.config
echo "    value: \"${pgsql_connection}\"" >> .ebextensions/.config
echo "  - option_name: AWS_ACCESS_KEY_ID" >> .ebextensions/.config
echo "    value: \"${access_key_ses}\"" >> .ebextensions/.config
echo "  - option_name: AWS_SECRET_ACCESS_KEY" >> .ebextensions/.config
echo "    value: \"${secret_key_ses}\"" >> .ebextensions/.config

touch .credentials
echo "[default]" >> .credentials
echo "aws_access_key_id=${access_key}" >> .credentials
echo "aws_secret_access_key=${secret_key}" >> .credentials

mkdir -p ~/.aws
mv .credentials ~/.aws/credentials


sudo pip install awsebcli

eb init -r $region -p Docker chusrodriguez-$environment-application
eb create $environment-$sha

bash scripts/components-up/dns.sh
mv $environment.tfstate $environment-dns.tfstate

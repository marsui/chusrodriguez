#!/usr/bin/env bash

access_key=${AWS_ACCESS_KEY_ID:-none}
secret_key=${AWS_SECRET_ACCESS_KEY:-none}
region=${AWS_REGION:-eu-west-1}

pgsql_connection=${CHUSRODRIGUEZ_PGSQL_CONNECTION_STRING:-none}
access_key_ses=${AWS_ACCESS_KEY_ID_SES:-none}
secret_key_ses=${AWS_SECRET_ACCESS_KEY_SES:-none}

environment=${ENVIRONMENT:-thread}

mkdir -p .deploy/.ebextensions
touch .deploy/.ebextensions/.config
echo "option_settings:" >> .deploy/.ebextensions/.config
echo "  - option_name: CHUSRODRIGUEZ_PGSQL_CONNECTION" >> .deploy/.ebextensions/.config
echo "    value: ${pgsql_connection}" >> .deploy/.ebextensions/.config
echo "  - option_name: AWS_ACCESS_KEY_ID" >> .deploy/.ebextensions/.config
echo "    value: ${access_key_ses}" >> .deploy/.ebextensions/.config
echo "  - option_name: AWS_SECRET_ACCESS_KEY" >> .deploy/.ebextensions/.config
echo "      value: ${secret_key_ses}" >> .deploy/.ebextensions/.config

cp Dockerrun.aws.json .deploy/
cd .deploy/

gem install dpl
dpl --provider=elasticbeanstalk --access-key-id="$access_key" --secret-access-key="$secret_key" --app="chusrodriguez-${environment}-application" --env="chusrodriguez-${environment}-environment" --region="${region}" --bucket-name="chusrodriguez-deployments"

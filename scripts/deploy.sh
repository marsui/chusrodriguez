#!/usr/bin/env bash

access_key=${AWS_ACCESS_KEY_ID:-none}
secret_key=${AWS_SECRET_ACCESS_KEY:-none}
region=${AWS_REGION:-eu-west-1}

pgsql_connection=${CHUSRODRIGUEZ_PGSQL_CONNECTION_STRING:-none}
access_key_ses=${AWS_ACCESS_KEY_ID_SES:-none}
secret_key_ses=${AWS_SECRET_ACCESS_KEY_SES:-none}

aws_config=".ebextensions/.config"
sed -i "s/#psql-connection-string#/${pgsql_connection}/g" "$aws_config"
sed -i "s/#aws-access-key#/${access_key_ses}/g" "$aws_config"
sed -i "s/#aws-access-key#/${secret_key_ses}/g" "$aws_config"


gem install dpl
dpl --provider=elasticbeanstalk --access-key-id="$access_key" --secret-access-key="$secret_key" --app="chusrodriguez-${environment}-application" --env="chusrodriguez-${environment}-environment" --region="${region}"

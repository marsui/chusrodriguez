#!/usr/bin/env bash

aws_config=".ebextensions/.config"
sed -i "s/#psql-connection-string#/${CHUSRODRIGUEZ_PGSQL_CONNECTION_STRING}/g" "$aws_config"
sed -i "s/#aws-access-key#/${AWS_ACCESS_KEY_ID_SES}/g" "$aws_config"
sed -i "s/#aws-access-key#/${AWS_SECRET_ACCESS_KEY_SES}/g" "$aws_config"


gem install dpl
dpl --provider=elasticbeanstalk --access-key-id=$access_key --secret-access-key="$secret_key" --app="chusrodriguez-${environment}-application" --env="chusrodriguez-${environment}-environment" --region="${region}"

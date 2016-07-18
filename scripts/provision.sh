#!/usr/bin/env bash

#if [ ! -f vendor/terraform/terraform ]; then
#    bash scripts/common/terraform.sh
#fi

hosted_zone_id=${HOSTED_ZONE_ID:-none}
environment=${ENVIRONMENT:-thread}
region=${AWS_REGION}

# Verify environment existence

db_check=$(node util/rds-check.js)
if [[ $db_check == 'false' ]]
then
  echo 'starting db deployment'
#  bash scripts/components-up/db.sh > .rds-output.txt
  echo 'finished db deployment'

  db_data=$(node util/rds-endpoint.js)

  if [[ $db_data == 'none' ]]
  then
    echo "Database ${environment} is not up"
    exit 1
  fi



  mv $environment.tfstate $environment-db.tfstate
fi

app_check=$(node util/beanstalk-check.js)
if [[ $app_check == 'false' ]]
then
  bash scripts/components-up/app.sh

  mv $environment.tfstate $environment-app.tfstate
fi

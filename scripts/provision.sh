#!/usr/bin/env bash

if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/common/terraform.sh
fi

hosted_zone_id=${HOSTED_ZONE_ID:-none}
environment=${ENVIRONMENT:-thread}
region=${AWS_REGION}



# Verify environment existence

db_check=$(node util/rds-check.js)
if [[ $db_check == 'false' ]]
then
  echo 'starting db deployment'
  bash scripts/components-up/db.sh > .rds-output.txt

  echo 'Waiting for database to be ready'
  cname='none'
  index=0
  while [[ $cname == 'none' ]]
  do
    sleep 5
    echo "Attempt ${index++}"
    cname=$($(node util/rds-endpoint.js))
  done

  echo 'Inserting DDL and sample data'
  bash scripts/components-up/data.sh
  echo 'finished db deployment'

  mv $environment.tfstate $environment-db.tfstate
fi

app_check=$(node util/beanstalk-check.js)
if [[ $app_check == 'false' ]]
then
  bash scripts/components-up/app.sh

  mv $environment.tfstate $environment-app.tfstate
fi

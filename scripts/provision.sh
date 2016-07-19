#!/usr/bin/env bash

if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/common/terraform.sh
fi

hosted_zone_id=${HOSTED_ZONE_ID:-none}
environment=${ENVIRONMENT:-thread}

# Verify environment existence

db_check=$(node util/rds-check.js)
echo $db_check
if [[ $db_check == 'false' ]]
then
  echo 'starting db deployment'
  bash scripts/components-up/db.sh > .rds-output.txt

  cname=$(node util/rds-endpoint.js)
  echo "database deployed at ${cname}"

elif [[ $db_check != 'true' ]]
then
  echo $db_check
  exit 1
fi

echo 'Inserting DDL and sample data'
bash scripts/components-up/data.sh
echo 'finished db deployment'

app_check=$(node util/beanstalk-check.js)
if [[ $app_check == 'false' ]]
then
  bash scripts/components-up/app.sh
elif [[ $app_check != 'true' ]]
then
  echo $db_check
  exit 1
fi

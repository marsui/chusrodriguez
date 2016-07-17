#!/usr/bin/env bash

if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/common/terraform.sh
fi

hosted_zone_id=${HOSTED_ZONE_ID:-none}
environment=${ENVIRONMENT:-thimble}
region=${AWS_REGION}

# Verify environment existence

db_check=$(node util/rds-check.js)
if [[ $db_check == 'false' ]]
then
  bash scripts/components-up/db.sh > .rds-output.txt
fi

app_check=$(node util/beanstalk-check.js)
if [[ $app_check == 'false' ]]
then
  bash scripts/components-up/app.sh
fi

bash scripts/components-up/dns.sh

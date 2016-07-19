#!/usr/bin/env bash

if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/common/terraform.sh
fi

hosted_zone_id=${HOSTED_ZONE_ID:-none}
environment=${ENVIRONMENT:-thread}

# Verify environment existence

check=$(ENVIRONMENT=$environment node util/rds-check.js)
if [[ $check == 'false' ]]
then
  bash scripts/components-up/app.sh > .terraform-output.txt

  echo 'Inserting DDL and sample data'
  bash scripts/components-up/data.sh
  echo 'finished db deployment'
elif [[ $check != 'true' ]]
then
  echo $check
  exit 1
fi

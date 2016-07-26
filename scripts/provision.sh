#!/usr/bin/env bash

if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/common/terraform.sh
fi

hosted_zone_id=${HOSTED_ZONE_ID:-none}
environment=${ENVIRONMENT:-ovillo}

# Verify environment existence

check=$(ENVIRONMENT=$environment node util/rds-check.js)
if [[ $check == 'false' ]]
then
  echo 'Launching infrastructure'
  bash scripts/components-up/app.sh > .terraform-output.txt
  echo 'Infrastructure is up'

  echo 'Inserting DDL and sample data'
  bash scripts/components-up/data.sh
  echo 'finished db deployment'
elif [[ $check == 'true' ]]
then
  echo 'Infrastructure already up'
else
  echo 'There was an error fetching sdk information'
  echo $check
  exit 1
fi

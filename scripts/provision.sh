#!/usr/bin/env bash

if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/common/terraform.sh
fi

# Verify if database is up
database_up=1
if [[ $database_up == 0 ]]
then
  bash scripts/components-up/db.sh
fi

storage_up=1
if [[ $storage_up == 0 ]]
then
  bash scripts/components-up/storage.sh
fi

bash scripts/components-up/app.sh

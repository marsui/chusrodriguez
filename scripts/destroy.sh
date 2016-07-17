#!/usr/bin/env bash

#!/usr/bin/env bash

if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/common/terraform.sh
fi

# Verify if database is up
database_up=0
if [[ $database_up == 0 ]]
then
  bash scripts/components-down/db.sh
fi

storage_up=0
if [[ $storage_up == 0 ]]
then
  bash scripts/components-down/storage.sh
fi

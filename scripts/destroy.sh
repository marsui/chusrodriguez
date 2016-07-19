#!/usr/bin/env bash

#!/usr/bin/env bash

if [ ! -f vendor/terraform/terraform ]; then
    bash scripts/common/terraform.sh
fi


bash scripts/components-down/app.sh

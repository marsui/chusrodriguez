#!/usr/bin/env bash

project_dir=$(pwd)

access_key=${AWS_ACCESS_KEY_ID:-none}
secret_key=${AWS_SECRET_ACCESS_KEY:-none}
region=${AWS_REGION:-eu-central-1}

environment=${ENVIRONMENT:-ovillo}
zone_id=${HOSTED_ZONE_ID:-none}

state_bucket=${STATE_BUCKET}

./vendor/terraform/terraform remote config -backend s3 -backend-config="bucket=$state_bucket" -backend-config="key=states/${environment}.tfstate" -backend-config=region="${region}"
./vendor/terraform/terraform destroy -var aws_region=$region -var zone_id=$zone_id -var environment=$environment -var aws_access_key=$access_key -var aws_secret_key=$secret_key infra/terraform

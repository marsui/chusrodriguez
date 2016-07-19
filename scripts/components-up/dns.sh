#!/usr/bin/env bash

sha=$(git rev-parse --short HEAD)
project_dir=$(pwd)

access_key=${AWS_ACCESS_KEY_ID:-none}
secret_key=${AWS_SECRET_ACCESS_KEY:-none}
region=${AWS_REGION:-eu-west-1}

zone=${HOSTED_ZONE_ID:-none}
cname=$(SHA=$sha node util/beanstalk-cname.js)

environment=${ENVIRONMENT:-thread}
state_bucket=${STATE_BUCKET}

./vendor/terraform/terraform remote config -backend s3 -backend-config="bucket=$state_bucket" -backend-config="key=dns/${environment}.tfstate" -backend-config=region="${region}"
./vendor/terraform/terraform get -update=true infra/dns
./vendor/terraform/terraform apply -var aws_region=$region -var beanstalk_cname=$cname -var zone_id=$zone -var environment=$environment -var aws_access_key=$access_key -var aws_secret_key=$secret_key -state $environment.tfstate infra/dns

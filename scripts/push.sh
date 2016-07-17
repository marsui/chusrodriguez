#!/usr/bin/env bash

docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD
docker push marsui/chusrodriguez:lastest

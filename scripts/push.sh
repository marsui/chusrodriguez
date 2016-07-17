#!/usr/bin/env bash

docker login -e $REGISTRY_EMAIL -u $REGISTRY_USER -p $REGISTRY_PASSWORD
docker push chusrodriguez/chusrodriguez-app:lastest

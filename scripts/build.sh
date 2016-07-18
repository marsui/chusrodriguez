#!/bin/bash

npm run install:bower
npm run build

docker build -t marsui/chusrodriguez:latest .

cd infra/db-data
docker build -t psql-loader:latest .

docker images

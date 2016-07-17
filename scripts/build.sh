#!/bin/bash

npm run install:bower
npm run build

docker build -t chusrodriguez/chusrodriguez-app:lastest .

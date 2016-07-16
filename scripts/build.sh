#!/bin/bash

npm run build

docker build -t marsui/chusrodriguez/chusrodriguez-app:lastest

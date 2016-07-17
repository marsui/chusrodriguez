#!/bin/bash

npm run install:bower
npm run build

docker build -t marsui/chusrodriguez:latest .

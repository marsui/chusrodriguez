#!/usr/bin/env bash

PGPASSWORD=$PGSQL_PASS psql -h ${PGSQL_HOST} -U ${PGSQL_USER} -f ./data.sql -d $PGSQL_DB

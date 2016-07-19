#!/usr/bin/env bash

export PGPASSWORD=$PGSQL_PASS

psql -h ${PGSQL_HOST} -U ${PGSQL_USER} -c "create user chusrodriguez with password '${DB_CHUSRODRIGUEZ_PASSWORD}'" -d $PGSQL_DB
psql -h ${PGSQL_HOST} -U ${PGSQL_USER} -f ./data.sql -d $PGSQL_DB

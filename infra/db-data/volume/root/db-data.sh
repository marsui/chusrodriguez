#!/usr/bin/env bash

export PGPASSWORD=$PGSQL_PASS
psql -h ${PGSQL_HOST} -U ${PGSQL_USER} -c "create user chusrodriguez with password '${DB_CHUSRODRIGUEZ_PASSWORD}'" -d $PGSQL_DB

psql -h ${PGSQL_HOST} -U ${PGSQL_USER} -c "alter user ${PGSQL_USER} with password '${DB_CHUSRODRIGUEZ_PASSWORD}'" -d $PGSQL_DB

export PGPASSWORD=$DB_CHUSRODRIGUEZ_PASSWORD
psql -h ${PGSQL_HOST} -U chusrodriguez -f ./data.sql -d $PGSQL_DB

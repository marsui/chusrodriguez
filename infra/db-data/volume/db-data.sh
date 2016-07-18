#!/usr/bin/env bash

export PGPASSWORD=$PGSQL_PASS
psql -h ${PGSQL_HOST} -U ${PGSQL_USER} -c "create table public.testing(name varchar(255))" -d presupuestor
echo "Database up"

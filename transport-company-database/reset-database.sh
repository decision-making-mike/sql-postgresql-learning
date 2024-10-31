#!/usr/bin/bash

set -eo pipefail

if [[ ! -f tables-ddl.sql ]]
then
    echo "DDL file missing error" 1>&2
    exit 1
fi

psql \
    template1 \
    -U h \
    -c 'drop database "transport-company";' \
    -c 'create database "transport-company";'

if [[ $? != 0 ]]
then
    echo "Database creation error" 1>&2
    exit 1
fi

psql \
    transport-company \
    -U h \
    -f tables-ddl.sql

if [[ $? != 0 ]]
then
    echo "Tables creation error" 1>&2
    exit 1
fi

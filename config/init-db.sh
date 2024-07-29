#! /bin/sh

psql -v --username "${POSTGRES_USER}" -c "CREATE DATABASE ${DB_MAIN};"
psql -v --username "${POSTGRES_USER}" -c "CREATE DATABASE ${DB_TEST};"

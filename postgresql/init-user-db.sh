#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER keycloak WITH PASSWORD 'keycloak';
    CREATE DATABASE keycloak WITH ENCODING 'UTF8';
    GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
EOSQL
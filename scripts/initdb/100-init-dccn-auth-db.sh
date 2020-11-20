#!/bin/bash
set -e

echo "Executing PSQL script..."

psql -v ON_ERROR_STOP=1 -U postgres <<-EOSQL
  CREATE USER $DB_USERNAME WITH PASSWORD '$DB_PASSWORD';
  ALTER ROLE $DB_USERNAME SET client_encoding TO 'utf8';
  ALTER ROLE $DB_USERNAME SET default_transaction_isolation TO 'read committed';
  ALTER ROLE $DB_USERNAME SET timezone TO 'Europe/Moscow';
  CREATE DATABASE $DB_NAME;
  GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USERNAME;
EOSQL

#!/bin/bash
set -e

echo "Executing PSQL script..."

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" <<-EOSQL
  CREATE USER dccn_auth_test_admin WITH PASSWORD '123456';
  ALTER ROLE dccn_auth_test_admin SET client_encoding TO 'utf8';
  ALTER ROLE dccn_auth_test_admin SET default_transaction_isolation TO 'read committed';
  ALTER ROLE dccn_auth_test_admin SET timezone TO 'Europe/Moscow';
  CREATE DATABASE dccn_auth_test;
  GRANT ALL PRIVILEGES ON DATABASE dccn_auth_test TO dccn_auth_test_admin;
EOSQL

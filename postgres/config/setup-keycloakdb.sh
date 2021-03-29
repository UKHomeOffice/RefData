#!/usr/bin/env bash

create_sql=`mktemp`

cat <<EOF >${create_sql}
CREATE ROLE keycloak WITH CREATEROLE LOGIN ENCRYPTED PASSWORD 'keycloakPwd';
CREATE DATABASE keycloak;
GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
EOF


psql -U "${POSTGRES_USER}" postgres -f ${create_sql}

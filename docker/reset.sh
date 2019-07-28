#!/usr/bin/env bash

export POSTGRES_DB=${POSTGRES_DB:-postgres}
export POSTGRES_SERVER=${POSTGRES_SERVER:-postgres_refdata}
export POSTGRES_PORT=${POSTGRES_PORT:-5432}
export POSTGRES_OPTIONS=${POSTGRES_OPTIONS:-}

export ROOT_USER=${FLYWAY_INIT_USER:-postgres}
export ROOT_PASSWORD=${FLYWAY_INIT_PASSWORD:-mysecretpassword}
export ROOT_URL="postgresql://${ROOT_USER}:${ROOT_PASSWORD}@${POSTGRES_SERVER}:${POSTGRES_PORT}/${POSTGRES_DB}${POSTGRES_OPTIONS}"

export REFDB_DBNAME=${FLYWAY_PLACEHOLDERS_REFERENCE_DB_NAME:-reference}

export GOVERNANCE_OWNERNAME=${FLYWAY_PLACEHOLDERS_GOVERNANCE_OWNER_NAME:-ownergovernance}
export GOVERNANCE_OWNERPASSWORD=${FLYWAY_PLACEHOLDERS_GOVERNANCE_OWNER_PASSWORD:-mysecretpassword}
export REFERENCE_OWNERNAME=${FLYWAY_PLACEHOLDERS_REFERENCE_OWNER_NAME:-ownerreference}

export REFERENCE_AUTHENTICATORUSER=${FLYWAY_PLACEHOLDERS_REFERENCE_AUTHENTICATOR_USER:-authenticatorreference}
export REFERENCE_ANONUSER=${FLYWAY_PLACEHOLDERS_REFERENCE_ANON_USER:-webanon}
export REFERENCE_SERVICEUSER=${FLYWAY_PLACEHOLDERS_REFERENCE_SERVICE_USER:-servicereference}
export REFERENCE_READONLYUSER=${FLYWAY_PLACEHOLDERS_REFERENCE_READONLY_USER:-readonlyreference}

export GOVERNANCE_AUTHENTICATORUSER=${FLYWAY_PLACEHOLDERS_GOVERNANCE_AUTHENTICATOR_USER:-authenticatorgovernance}
export GOVERNANCE_ANONUSER=${FLYWAY_PLACEHOLDERS_GOVERNANCE_ANON_USER:-webanongovernance}
export GOVERNANCE_SERVICEUSER=${FLYWAY_PLACEHOLDERS_GOVERNANCE_SERVICE_USER:-servicegovernance}
export GOVERNANCE_READONLYUSER=${FLYWAY_PLACEHOLDERS_GOVERNANCE_READONLY_USER:-readonlygovernance}

export REFDB_URL="postgresql://${GOVERNANCE_OWNERNAME}:${GOVERNANCE_OWNERPASSWORD}@${POSTGRES_SERVER}:${POSTGRES_PORT}/${POSTGRES_DB}${POSTGRES_OPTIONS}"

# Clear reference DB
psql ${REFDB_URL} -c "drop database ${REFDB_DBNAME};"

# Clear roles and schemas
psql ${ROOT_URL} -c "drop table flyway_schema_history flyway_schema_history; drop role if exists ${GOVERNANCE_AUTHENTICATORUSER}; drop role if exists ${REFERENCE_AUTHENTICATORUSER}; drop role if exists ${GOVERNANCE_ANONUSER}; drop role if exists ${GOVERNANCE_SERVICEUSER}; drop role if exists ${GOVERNANCE_READONLYUSER}; drop role if exists ${GOVERNANCE_OWNERNAME}; drop role if exists ${REFERENCE_OWNERNAME}; drop role if exists ${REFERENCE_ANONUSER}; drop role if exists ${REFERENCE_SERVICEUSER}; drop role if exists ${REFERENCE_READONLYUSER};"

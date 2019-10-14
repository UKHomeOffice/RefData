#!/usr/bin/env bash

# Ensure environment values are not exposed in drone output
set +x

echo "Exporting environment variables"

export DB_REF_DEFAULT_DBNAME=${DB_REF_DEFAULT_DBNAME}
export DB_REF_HOSTNAME=${DB_REF_HOSTNAME}
export DB_REF_PORT=${DB_REF_PORT}
export DB_REF_OPTIONS=${DB_REF_OPTIONS}
export DB_REF_JDBC_OPTIONS=${DB_REF_JDBC_OPTIONS}
export URL="postgresql://${DB_REF_HOSTNAME}:${DB_REF_PORT}/${DB_REF_DEFAULT_DBNAME}${DB_REF_OPTIONS}"
export FLYWAY_URL="jdbc:"postgresql://${DB_REF_HOSTNAME}:${DB_REF_PORT}/${DB_REF_DEFAULT_DBNAME}${DB_REF_JDBC_OPTIONS}""
export DB_REF_DEFAULT_USERNAME=${DB_REF_DEFAULT_USERNAME}
export DB_REF_DEFAULT_PASSWORD=${DB_REF_DEFAULT_PASSWORD}
export FLYWAY_PLACEHOLDERS_MASTERUSER=${DB_REF_DEFAULT_USERNAME}
export FLYWAY_PLACEHOLDERS_REFERENCEDBNAME=${DB_REF_REFERENCE_DBNAME}
export FLYWAY_PLACEHOLDERS_REFERENCEOWNERNAME=${DB_REF_REFERENCE_OWNER_USERNAME}
export FLYWAY_PLACEHOLDERS_REFERENCEOWNERPASSWORD=${DB_REF_REFERENCE_OWNER_PASSWORD}
export FLYWAY_PLACEHOLDERS_REFERENCESCHEMA=${DB_REF_REFERENCE_SCHEMA}
export FLYWAY_PLACEHOLDERS_GOVERNANCEOWNERNAME=${DB_REF_GOVERNANCE_OWNER_USERNAME}
export FLYWAY_PLACEHOLDERS_GOVERNANCEOWNERPASSWORD=${DB_REF_GOVERNANCE_OWNER_PASSWORD}
export FLYWAY_PLACEHOLDERS_GOVERNANCESCHEMA=${DB_REF_GOVERNANCE_SCHEMA}
export PGPASSWORD=${DB_REF_DEFAULT_PASSWORD}

export BASEPATH="${PWD}"
echo "Running from base path: ${BASEPATH}"

echo "Checking if postgres is up and ready for connections"
i=0
pg_isready -d ${URL} -U ${DB_REF_DEFAULT_USERNAME} -t 60
PG_EXIT=$?
while [[ "${i}" -lt "5" && ${PG_EXIT} != 0 ]]
do
    echo "waiting for Postgres to start, attempt: ${i}"
    sleep 5s
    if [[ "${i}" > 5 ]]
    then
        echo "Error: failed waiting for Postgres to start"
        exit 1
    fi
    ((i++))
    pg_isready -d ${URL} -U ${DB_REF_DEFAULT_USERNAME} -t 60
    PG_EXIT=$?
done

echo "Creating initial databases"
export FLYWAY_USER=${DB_REF_DEFAULT_USERNAME}
export FLYWAY_PASSWORD=${DB_REF_DEFAULT_PASSWORD}


echo "Checking if database exists"
STATUS=$( psql postgresql://${DB_REF_DEFAULT_USERNAME}@${DB_REF_HOSTNAME}:${DB_REF_PORT}/${DB_REF_DEFAULT_DBNAME}${DB_REF_OPTIONS} -tc "SELECT 1 FROM pg_database WHERE datname='${DB_REF_REFERENCE_DBNAME}'" | sed -e 's/^[ \t]*//')
if [[ "${STATUS}" == "1" ]]
then
    echo "Database already exists"
else
    echo "Database does not exist creating - Bootstrapping databases"
    export FLYWAY_LOCATIONS="filesystem:${BASEPATH}/schemas/init"
    flyway -configFiles=${BASEPATH}/docker/flyway_init_docker.conf migrate
    if [[ "$?" != 0 ]]
    then
        echo "Error: initialising database"
        exit 1
    fi
    cd ${BASEPATH}/docker/
    yasha bootstrap.j2 -o /tmp/bootstrap.sql
    psql postgresql://${DB_REF_DEFAULT_USERNAME}@${DB_REF_HOSTNAME}:${DB_REF_PORT}/${DB_REF_DEFAULT_DBNAME}${DB_REF_OPTIONS} < /tmp/bootstrap.sql
    if [[ "$?" != 0 ]]
    then
        echo "Error: with bootstrapping database"
        exit 1
    fi
fi

echo "Converting CSVs into bulk load"
yasha -v ${BASEPATH}/schemas/reference/bulkload/var.yaml ${BASEPATH}/schemas/reference/bulkload/bulkload.j2 -o ${BASEPATH}/schemas/reference/R__bulkload.sql
if [[ "$?" != 0 ]]
then
    echo "yasha conversion of csv's to bulk load file failed"
    exit 1
fi

echo "Starting migration of reference data"
export FLYWAY_URL="jdbc:postgresql://${DB_REF_HOSTNAME}:${DB_REF_PORT}/${DB_REF_REFERENCE_DBNAME}${DB_REF_JDBC_OPTIONS}"
export FLYWAY_USER=${DB_REF_REFERENCE_OWNER_USERNAME}
export FLYWAY_PASSWORD=${DB_REF_REFERENCE_OWNER_PASSWORD}
export FLYWAY_SCHEMAS=${DB_REF_REFERENCE_SCHEMA}
export FLYWAY_PLACEHOLDERS_SCHEMA=${DB_REF_REFERENCE_SCHEMA}
export FLYWAY_PLACEHOLDERS_AUTHENTICATORUSER=${DB_REF_REFERENCE_AUTHENTICATOR_USERNAME}
export FLYWAY_PLACEHOLDERS_AUTHENTICATORPASSWORD=${DB_REF_REFERENCE_AUTHENTICATOR_PASSWORD}
export FLYWAY_PLACEHOLDERS_ANONUSER=${DB_REF_REFERENCE_ANON_USERNAME}
export FLYWAY_PLACEHOLDERS_SERVICEUSER=${DB_REF_REFERENCE_SERVICE_USERNAME}
export FLYWAY_PLACEHOLDERS_READONLYUSER=${DB_REF_REFERENCE_READONLY_USERNAME}
export FLYWAY_LOCATIONS="filesystem:${BASEPATH}/schemas/reference"

flyway -configFiles=${BASEPATH}/docker/flyway_reference_docker.conf migrate
if [[ "$?" != 0 ]]
then
    echo "Error: migration of reference db failed"
    exit 1
fi

echo "Migrating governance database"
export FLYWAY_URL="jdbc:postgresql://${DB_REF_HOSTNAME}:${DB_REF_PORT}/${DB_REF_REFERENCE_DBNAME}${DB_REF_JDBC_OPTIONS}"
export FLYWAY_USER=${DB_REF_GOVERNANCE_OWNER_USERNAME}
export FLYWAY_PASSWORD=${DB_REF_GOVERNANCE_OWNER_PASSWORD}
export FLYWAY_SCHEMAS=${DB_REF_GOVERNANCE_SCHEMA}
export FLYWAY_PLACEHOLDERS_SCHEMA=${DB_REF_GOVERNANCE_SCHEMA}
export FLYWAY_PLACEHOLDERS_AUTHENTICATORUSER=${DB_REF_GOVERNANCE_AUTHENTICATOR_USERNAME}
export FLYWAY_PLACEHOLDERS_AUTHENTICATORPASSWORD=${DB_REF_GOVERNANCE_AUTHENTICATOR_PASSWORD}
export FLYWAY_PLACEHOLDERS_ANONUSER=${DB_REF_GOVERNANCE_ANON_USERNAME}
export FLYWAY_PLACEHOLDERS_SERVICEUSER=${DB_REF_GOVERNANCE_SERVICE_USERNAME}
export FLYWAY_PLACEHOLDERS_READONLYUSER=${DB_REF_GOVERNANCE_READONLY_USERNAME}
export FLYWAY_LOCATIONS="filesystem:${BASEPATH}/schemas/governance"

flyway -configFiles=${BASEPATH}/docker/flyway_governance_docker.conf migrate
if [[ "$?" != 0 ]]
then
    echo "Error: migration of governance db failed"
    exit 1
fi

exit 0

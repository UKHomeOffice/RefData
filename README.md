# Reference data governance service


## Database schema design

Each Table must contain a comment in JSON format containing the following entities:

* description
* schemalastupdated
* dataversion
* `owner` - a group email like `cop@homeoffice.gov.uk`

and these columns are required:

* validfrom
* validto


Each Column must contain a comment in JSON format containing the following entities:

* label
* description
* summaryview

One column must also contain the comment:

* businesskey: true

Optional entities for column comments:

* aliases (comma separated list)
* minimumlength
* maximumlength
* minimumvalue
* maximumvalue

Please see https://gitlab.digital.homeoffice.gov.uk/cop/manifest


# There should be NO CSVs checked into the repo

## Grants

Each table must have at least two GRANTs, as follows:
* serviceuser - This used by Camunda to allow new records to be added to the Reference data and current records to be updated.
* readonlyuser - This user can read all records.
* anonuser - This user should only be added to public tables where authentication is not needed to see the data.
This should be the default for all datasets unless they are deemed sensitive.


### Example

```sql
CREATE TABLE ministry (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  code VARCHAR(8) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE ministry IS '{"label": "Government ministries", "owner": "xyx@test.com", "description": "A list of departments, agencies and public bodies.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN ministry.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN ministry.name IS '{"label": "Name", "description": "The name of the branch or region.", "summaryview": "true"}';
COMMENT ON COLUMN ministry.code IS '{"label": "Code", "businesskey": true, "description": "The code associated with the branch or region.", "summaryview": "true"}';
COMMENT ON COLUMN ministry.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN ministry.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN ministry.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON ministry TO ${serviceuser};
GRANT SELECT ON ministry TO ${readonlyuser};
GRANT SELECT ON ministry TO ${anonuser};
```



## Environment variables

* DB_HOSTNAME
* DB_PORT
* DB_NAME
* DB_DEFAULT_NAME
* DB_OPTIONS
* DB_JDBC_OPTIONS
* FLYWAY_USER
* FLYWAY_PASSWORD
* DB_OWNERNAME
* DB_OWNERPASSWORD
* DB_SCHEMA
* FLYWAY_PLACEHOLDERS_AUTHENTICATORUSER
* FLYWAY_PLACEHOLDERS_AUTHENTICATORPASSWORD
* FLYWAY_PLACEHOLDERS_ANONUSER
* FLYWAY_PLACEHOLDERS_SERVICEUSER
* FLYWAY_PLACEHOLDERS_READONLYUSER

## Development

### Setting Up

This guide assumes you've already cloned this repo and have Docker available locally.

Go to `mini` folder - there is a `docker-compose.yml` file that performs the following:
1. Creates Postgres server - `localhost:5432`
2. Creates PostgREST API - `localhost:3000`
3. Applies all the flyway scripts on top of the local database.

```bash
❯ docker compose up
...
mini_flyway_1 | Migrating schema "public" to version "115 - is81riskfactors"
mini_flyway_1 | Migrating schema "public" to version "116 - flightlookup"
mini_flyway_1 | Migrating schema "public" to version "117 - validation"
mini_flyway_1 | Successfully applied 117 migrations to schema "public" (execution time 00:04.489s)

```

The server will run as long as your terminal session is open. Closing it completely destroys services and data locally. Restart to get it back again.

> Befause of the way [PostgREST caches schema](https://postgrest.org/en/v7.0.0/admin.html#schema-reloading), you need to run `docker-compose kill -s SIGUSR1 rest` after flyway has finished the job and while docker compose is running. 

### Tip

You can start the server in the background as `docker compose up -d` to free up current console.

To check the current logs type `docker compose logs`.

Then you can force refresh schema with `docker-compose kill -s SIGUSR1 rest`.

To stop the server running in the background type `docker compose down`.

### Making Changes

1. Create a new flyway file in `schemas/reference` - follow [flyway documentation](https://flywaydb.org/documentation/) if you are not familiar with this system. Look at the existing scripts and try to be like a ninja - make your scripts blend in.
2. Change `flyway.target` in `docker/flyway_reference_docker.conf` to your script number.
3. Raise a PR and wait for validation to complete. Check build logs if anything goes wrong - you will get a detailed reason why something is not working.
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

There is a `run.sh` file that performs the following:
1. Creates Postgres server - `localhost:5432`
2. Creates PostgREST API - `localhost:3000`
3. Applies all the flyway scripts on top of the local database.
4. Drops flyway cache.

Essentially it makes refdata service ready to use.

```bash
❯ ./run.sh
...
preliminary cleanup...
No stopped containers
starting services
Creating network "refdata_default" with the default driver
Creating refdata_db_1 ... done
Creating refdata_rest_1   ... done
Creating refdata_flyway_1 ... done
waiting for flyway to finish.......
Rrefreshing PostgREST schema...
Killing refdata_rest_1 ... done

All services are up. Press any key to shutdown when not required anymore
Killing refdata_rest_1 ... done
Killing refdata_db_1   ... done
Going to remove refdata_rest_1, refdata_flyway_1, refdata_db_1
Removing refdata_rest_1   ... done
Removing refdata_flyway_1 ... done
Removing refdata_db_1     ... done

```

The server will run as long as your terminal session is open. Press any key to shut it down.

### Making Changes

1. Create a new flyway file in `schemas/reference` - follow [flyway documentation](https://flywaydb.org/documentation/) if you are not familiar with this system. Look at the existing scripts and try to be like a ninja - make your scripts blend in.
2. Change `flyway.target` in `docker/flyway_reference_docker.conf` to your script number.
3. Raise a PR and wait for validation to complete. Check build logs if anything goes wrong - you will get a detailed reason why something is not working.
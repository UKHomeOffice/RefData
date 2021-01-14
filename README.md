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

Launch PG database server in one line: `docker run -d --name refpg -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres`. This uses standard port, username `postgres` and password `postgres`.


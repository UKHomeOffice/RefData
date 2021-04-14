# Reference Data Governance Service Schema Definitions

> This repository contains table schema definitions only (no CSVs, no code to execute on database server).  It does not run Reference Data Service. To test these changes, you may use [CSV Loader](https://github.com/UKHomeOffice/csv_loader) service which performs schema validation and data ingestion.

## Table Requirements

In addition to your own fields, you *must* include the following system columns, typically in this order at the end of the table:

### Columns

| Column      | Description                                                  | Example                |
| ----------- | ------------------------------------------------------------ | ---------------------- |
| `validfrom` | Start time of when a record will be considered valid.        | 2021-04-08 00:01:00+00 |
| `validto`   | End time of when a record will be considered valid. For new records this value defaults to NULL. | NULL                   |
| `updatedby` | User/entity identifier of who created/updated a record. Optional. | NULL                   |

### Table Comment

A table  *must* have a comment attached in JSON format, containing the following *required* key-values:

| Key                 | Value                                                        | Example                                        |
| ------------------- | ------------------------------------------------------------ | ---------------------------------------------- |
| `description`       | Human-readable table description.                            | Stores postcode to latitude/longitude mapping. |
| `schemalastupdated` | When did you update this schema. This must be a parseable date in `dd/MM/yyyy` format. | 06/03/2019                                     |
| `dataversion`       | Version number. Starts from 1.                               | 1                                              |
| `owner`             | Owner entity's identifier.                                   | team@domain.org                                |

Table comment example:

```sql
COMMENT ON TABLE ministry IS '{"label": "Government ministries", "owner": "xyx@test.com", "description": "A list of departments, agencies and public bodies.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
```

### Column Comment

Every column *must* have a comment attached in JSON format, containing the following *required* key-values:

| Key             | Required | Value                                                        | Example                                        |
| --------------- | -------- | ------------------------------------------------------------ | ---------------------------------------------- |
| `label`         | Y        | Human-readable table description.                            | Stores postcode to latitude/longitude mapping. |
| `description`   | Y        | When did you update this schema. This must be a parseable date in `dd/MM/yyyy` format. | `"06/03/2019"`                                 |
| `summaryview`   | Y        | Version number. Starts from 1.                               | `1`                                            |
| `businesskey`   | 1        | One of the columns, which is considered a logical key, needs to be marked with this key. Business key should not change when a record is updated. There can only be a single valid record with unique business key at a point of time. | `true`                                         |
| `aliases`       | N        | Comma-separated list of column aliases.                      | `"alias1, alias2"`                             |
| `minimumlength` | N        |                                                              |                                                |
| `maximumlength` | N        |                                                              |                                                |
| `minimumvalue`  | N        |                                                              |                                                |
| `maximumvalue`  | N        |                                                              |                                                |

Example:

```sql
COMMENT ON COLUMN is81riskfactors.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN is81riskfactors.name IS '{"label": "Name", "description": "Name of the risk factor", "summaryview": "true"}';
```



## Grants

Each table must have at least two GRANTs, as follows:
* `serviceuser` - This used by Camunda to allow new records to be added to the Reference data and current records to be updated.
* `readonlyuser` - This user can read all records.
* `anonuser` - This user should only be added to public tables where authentication is not needed to see the data.
This should be the default for all datasets unless they are deemed sensitive.


### Example

```sql
-- GRANTs
GRANT SELECT,INSERT,UPDATE ON ministry TO ${serviceuser};
GRANT SELECT ON ministry TO ${readonlyuser};
GRANT SELECT ON ministry TO ${anonuser};
```

## Making Changes

1. Create a new flyway file in `schemas/reference` - follow [flyway documentation](https://flywaydb.org/documentation/) if you are not familiar with this system. Look at the existing scripts and try to be like a ninja - make your scripts blend in.
2. Change `flyway.target` in `docker/flyway_reference_docker.conf` to your script number.
3. Raise a PR and wait for validation to complete. Check build logs if anything goes wrong - you will get a detailed reason why something is not working.

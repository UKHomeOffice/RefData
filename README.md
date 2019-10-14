# Reference data governance service (BETA)

This repo is part of the RefData project workstream, for more details please see the [https://github.com/UKHomeOffice/RefDataBAU/wiki](wiki)

## Database schema design

Each Table must contain a comment in JSON format containing the following entities:

* description
* schemalastupdated
* dataversion

Each Column must contain a comment in JSON format containing the following entities:

* label
* description
* summaryview

Optional entities for column comments:

* aliases (comma separated list)
* minimumlength
* maximumlength
* minimumvalue
* maximumvalue

## Local Deployment Testing

1. Clone this repo
2. Switch into the cloned directory and then create a .env file containing the full path to the cloned repo. e.g:

```bash
PUBLIC_REFDATA_FLYWAY=/Users/XXX/GIT/cop/public_refdata_flyway
```

3. Run the command to start docker

```bash
docker-compose up -d
docker logs public_refdata_flyway -f
```

Upon completion the database will be up and accessible via port tcp/5433. The docker compose file contains the different users and secrets which allow connecting to the different roles. An example to connect as the main root owner (not advised for service accounts which should use the authenticator user and switch role):

```bash
psql postgres://ownerreference:mysecretpassword@localhost:5433/reference
set search_path reference
```

### Note

To clean up the running instance and take it down run:

```bash
docker-compose rm -vs
```

# Drone Secrets

Name|Example value
---|---
db_ref_default_username|xxx
db_ref_governance_anon_username|xxx
db_ref_governance_authenticator_username|xxx
db_ref_governance_owner_username|xxx
db_ref_governance_readonly_username|xxx
db_ref_governance_schema|xxx
db_ref_governance_service_username|xxx
db_ref_jdbc_options|?sslmode=require
db_ref_options|?ssl=true
db_ref_port|5432
db_ref_private_gitkey|xxx
db_ref_private_gitrepo|private-refdata
db_ref_reference_anon_username|xxx
db_ref_reference_authenticator_username|xxx
db_ref_reference_dbname|xxx
db_ref_reference_owner_username|xxx
db_ref_reference_readonly_username|xxx
db_ref_reference_schema|xxx
db_ref_reference_service_username|xxx
dev_drone_aws_access_key_id|https://console.aws.amazon.com/iam/home?region=eu-west-2#/users/bf-it-devtest-drone?section=security_credentials
dev_drone_aws_secret_access_key|https://console.aws.amazon.com/iam/home?region=eu-west-2#/users/bf-it-devtest-drone?section=security_credentials
drone_public_token|Drone token (Global for all github repositories and environments)
env_db_ref_default_dbname|xxx
env_db_ref_default_password|xxx
env_db_ref_governance_authenticator_password|xxx
env_db_ref_governance_owner_password|xxx
env_db_ref_hostname|copreferencedev.notprod.acp.homeoffice.gov.uk, coprefdatastaging.crckizhiyjmt.eu-west-2.rds.amazonaws.com, coprefdataprod.crckizhiyjmt.eu-west-2.rds.amazonaws.com
env_db_ref_reference_authenticator_password|xxx
env_db_ref_reference_owner_password|xxx
git_repo_private_giturl|ssh://git@gitlab.digital.homeoffice.gov.uk:2222/cop/
git_repo_private_port|2222
git_repo_private_url|gitlab.digital.homeoffice.gov.uk
production_drone_aws_access_key_id|https://console.aws.amazon.com/iam/home?region=eu-west-2#/users/bf-it-prod-drone?section=security_credentials
production_drone_aws_secret_access_key|https://console.aws.amazon.com/iam/home?region=eu-west-2#/users/bf-it-prod-drone?section=security_credentials
protocol_https|https://
slack_webhook|https://hooks.slack.com/services/xxx/yyy/zzz (Global for all repositories and environments)
staging_drone_aws_access_key_id|https://console.aws.amazon.com/iam/home?region=eu-west-2#/users/bf-it-prod-drone?section=security_credentials
staging_drone_aws_secret_access_key|https://console.aws.amazon.com/iam/home?region=eu-west-2#/users/bf-it-prod-drone?section=security_credentials

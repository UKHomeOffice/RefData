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

Please see https://gitlab.digital.homeoffice.gov.uk/cop/manifest

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

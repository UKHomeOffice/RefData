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


# There should be NO CSVs checked into the repo


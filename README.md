# Reference data governance service


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

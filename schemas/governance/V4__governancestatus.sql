CREATE TABLE governancestatus (
  id INTEGER NOT NULL PRIMARY KEY,
  status CHARACTER VARYING(20) NOT NULL
);

GRANT SELECT ON governancestatus TO ${serviceuser};

COPY governancestatus FROM stdin CSV HEADER;
id,status
1,"waiting for approval"
2,"approved"
3,"rejected"
\.
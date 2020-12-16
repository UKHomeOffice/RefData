CREATE ROLE ${referenceownername} WITH CREATEROLE LOGIN ENCRYPTED PASSWORD '${referenceownerpassword}';
CREATE ROLE ${governanceownername} WITH CREATEROLE LOGIN ENCRYPTED PASSWORD '${governanceownerpassword}';
GRANT ${referenceownername} TO ${masteruser};
GRANT ${governanceownername} TO ${masteruser};
CREATE DATABASE ${referencedbname} OWNER ${governanceownername};
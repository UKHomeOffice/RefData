CREATE ROLE ${referenceownername} WITH CREATEROLE LOGIN ENCRYPTED PASSWORD '${referenceownerpassword}';
GRANT ${referenceownername} TO ${masteruser};
CREATE DATABASE ${referencedbname} OWNER ${referenceownername};

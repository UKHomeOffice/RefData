-- Setup DB
CREATE ROLE ${authenticatoruser} WITH NOINHERIT LOGIN ENCRYPTED PASSWORD '${authenticatorpassword}';
GRANT USAGE ON SCHEMA ${schema} TO ${authenticatoruser};
CREATE ROLE ${anonuser} NOLOGIN;
GRANT USAGE ON SCHEMA ${schema} TO ${anonuser};
GRANT ${anonuser} to ${authenticatoruser};
CREATE ROLE ${serviceuser} NOLOGIN;
GRANT USAGE ON SCHEMA ${schema} TO ${serviceuser};
GRANT ${serviceuser} to ${authenticatoruser};
CREATE ROLE ${readonlyuser} NOLOGIN;
GRANT USAGE ON SCHEMA ${schema} TO ${readonlyuser};
GRANT ${readonlyuser} to ${authenticatoruser};
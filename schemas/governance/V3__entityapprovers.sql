CREATE TABLE entityapprovers (
  id INTEGER NOT NULL PRIMARY KEY,
  entityid INTEGER NOT NULL REFERENCES entity(id),
  email character varying(60) NOT NULL
);

GRANT SELECT,UPDATE,INSERT ON entityapprovers TO ${serviceuser};
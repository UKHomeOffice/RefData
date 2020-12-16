CREATE TABLE changelog (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
  tablename CHARACTER VARYING(40) NOT NULL REFERENCES entity(tablename),
  datetime  TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  changerequested TEXT NOT NULL,
  governancestatusid INTEGER NULL REFERENCES governancestatus(id),
  governancedate DATE NULL,
  governancecomment TEXT NULL,
  governanceapprover character varying(60) NULL,
  requestor character varying(60) NOT NULL
);

GRANT SELECT,UPDATE,INSERT ON changelog TO ${serviceuser};

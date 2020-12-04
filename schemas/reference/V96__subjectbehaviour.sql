CREATE TABLE subjectbehaviour (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  validpst bool NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

 -- Table comment
COMMENT ON TABLE subjectbehaviour IS '{"label": "Subject Behaviour", "description": "Behaviours indicated by subjects", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN subjectbehaviour.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN subjectbehaviour.name IS '{"label": "Name", "description": "Name of behaviour", "summaryview": "true"}';
COMMENT ON COLUMN subjectbehaviour.validpst IS '{"label": "PST", "description": "Is the period valid for PST?", "summaryview": "true"}';
COMMENT ON COLUMN subjectbehaviour.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN subjectbehaviour.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN subjectbehaviour.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

 -- GRANTs
GRANT SELECT ON subjectbehaviour TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON subjectbehaviour TO ${serviceuser};
GRANT SELECT ON subjectbehaviour TO ${readonlyuser};

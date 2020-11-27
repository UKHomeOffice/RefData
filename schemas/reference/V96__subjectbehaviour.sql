CREATE TABLE subjectbehaviour (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  validpst bool NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

 -- Table comment
COMMENT ON TABLE subjectbehaviour IS '{"label": "Subject Behaviour", "description": "Behaviours indicated by subjects", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN subjectbehaviour.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN subjectbehaviour.name IS '{"label": "Name", "description": "Name of behaviour", "summaryview": "true"}';
COMMENT ON COLUMN subjectbehaviour.validpst IS '{"label": "PST", "description": "Is the period valid for PST?", "summaryview": "true"}';
COMMENT ON COLUMN subjectbehaviour.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN subjectbehaviour.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

 -- GRANTs
GRANT SELECT ON subjectbehaviour TO ${anonuser};
GRANT SELECT ON subjectbehaviour TO ${serviceuser};
GRANT SELECT ON subjectbehaviour TO ${readonlyuser};

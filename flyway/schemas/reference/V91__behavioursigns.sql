CREATE TABLE behavioursigns (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  warning bool NOT NULL,
  danger bool NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

 -- Table comment
COMMENT ON TABLE behavioursigns IS '{"label": "Behaviour Signs", "description": "Behaviours Warning and Danger Signs", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN behavioursigns.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN behavioursigns.name IS '{"label": "Name", "description": "Name of behaviour", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN behavioursigns.warning IS '{"label": "Warning", "description": "Warning Sign?", "summaryview": "true"}';
COMMENT ON COLUMN behavioursigns.danger IS '{"label": "Danger", "description": "Danger Sign?", "summaryview": "true"}';
COMMENT ON COLUMN behavioursigns.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN behavioursigns.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN behavioursigns.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

 -- GRANTs
GRANT SELECT ON behavioursigns TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON behavioursigns TO ${serviceuser};
GRANT SELECT ON behavioursigns TO ${readonlyuser};

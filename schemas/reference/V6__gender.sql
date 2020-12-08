CREATE TABLE gender (
  id INTEGER NOT NULL PRIMARY KEY,
  gender VARCHAR(20) NOT NULL UNIQUE,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE gender IS '{"label": "Gender", "description": "A list of current groups on the gender spectrum.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN gender.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN gender.gender IS '{"label": "Gender", "businesskey": true, "description": "The name of the gender.", "summaryview": "true"}';
COMMENT ON COLUMN gender.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN gender.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN gender.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON gender TO ${anonuser};
GRANT SELECT ON gender TO ${serviceuser};
GRANT SELECT ON gender TO ${readonlyuser};

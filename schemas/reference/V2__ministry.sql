CREATE TABLE ministry (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  code VARCHAR(8) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE ministry IS '{"label": "Government ministries", "owner": "xyx@test.com", "description": "A list of departments, agencies and public bodies.", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN ministry.id IS '{"label": "Identifier", "description": "Database unique identity record.", "businesskey": "true", "summaryview": "false"}';
COMMENT ON COLUMN ministry.name IS '{"label": "Name", "description": "The name of the branch or region.", "summaryview": "true"}';
COMMENT ON COLUMN ministry.code IS '{"label": "Code", "businesskey": true, "description": "The code associated with the branch or region.", "summaryview": "true"}';
COMMENT ON COLUMN ministry.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN ministry.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN ministry.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE,DELETE ON ministry TO ${serviceuser};
GRANT SELECT ON ministry TO ${readonlyuser};
GRANT SELECT ON ministry TO ${anonuser};

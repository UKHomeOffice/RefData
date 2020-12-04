CREATE TABLE employmenttypes (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE employmenttypes IS '{"label": "Employment type", "description": "A list of types of employment status.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN employmenttypes.id IS '{"label": "Identifier", "description": "Unique identifying column.", "businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN employmenttypes.name IS '{"label": "Name", "businesskey": true, "description": "A list of employment/job names.", "summaryview": "true"}';
COMMENT ON COLUMN employmenttypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN employmenttypes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN employmenttypes.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON employmenttypes TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON employmenttypes TO ${serviceuser};
GRANT SELECT ON employmenttypes TO ${readonlyuser};

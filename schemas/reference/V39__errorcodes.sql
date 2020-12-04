CREATE TABLE errorcodes (
  id VARCHAR(10) NOT NULL PRIMARY KEY,
  message VARCHAR(60) NOT NULL,
  description VARCHAR(300) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE errorcodes IS '{"label": "Error codes", "description": "A list of error messages and descriptions.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN errorcodes.id IS '{"label": "Identifier", "businesskey": true, "description": "Unique error code.", "summaryview": "false"}';
COMMENT ON COLUMN errorcodes.message IS '{"label": "Message", "description": "System error message.", "summaryview": "true"}';
COMMENT ON COLUMN errorcodes.description IS '{"label": "Description", "description": "A detailed description of the cause of the error.", "summaryview": "true"}';
COMMENT ON COLUMN errorcodes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN errorcodes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN errorcodes.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON errorcodes TO ${serviceuser};
GRANT SELECT ON errorcodes TO ${readonlyuser};

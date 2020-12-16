CREATE TABLE errorcodes (
  id VARCHAR(10) NOT NULL PRIMARY KEY,
  message VARCHAR(60) NOT NULL,
  description VARCHAR(300) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE errorcodes IS '{"label": "Error codes", "description": "A list of error messages and descriptions.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN errorcodes.id IS '{"label": "Identifier", "description": "Unique error code.", "summaryview": "false"}';
COMMENT ON COLUMN errorcodes.message IS '{"label": "Message", "description": "System error message.", "summaryview": "true"}';
COMMENT ON COLUMN errorcodes.description IS '{"label": "Description", "description": "A detailed description of the cause of the error.", "summaryview": "true"}';
COMMENT ON COLUMN errorcodes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN errorcodes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON errorcodes TO ${serviceuser};
GRANT SELECT ON errorcodes TO ${readonlyuser};

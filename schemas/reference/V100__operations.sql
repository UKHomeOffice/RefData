CREATE TABLE operations (
  id UUID NOT NULL PRIMARY KEY,
  name VARCHAR(50),
  description VARCHAR(200),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE operations IS '{"label": "List of operations names", "description": "List of current operations Border Force is involved with", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN operations.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN operations.name IS '{"label": "Operation name", "description": "The codename of the operation.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN operations.description IS '{"label": "Description", "description": "A description of the operation.", "summaryview": "false"}';
COMMENT ON COLUMN operations.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN operations.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN operations.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON operations TO ${serviceuser};
GRANT SELECT ON operations TO ${readonlyuser};

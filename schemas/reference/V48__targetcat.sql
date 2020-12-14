CREATE TABLE targetcat (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(40),
  oar BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE targetcat IS '{"label": "Targeting types", "description": "A list of targeting types.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN targetcat.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN targetcat.type IS '{"label": "Target type", "businesskey": "true", "description": "The type of target.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN targetcat.oar IS '{"label": "OAR", "description": "Valid for operational activities reporting.", "summaryview": "true"}';
COMMENT ON COLUMN targetcat.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN targetcat.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN targetcat.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON targetcat TO ${serviceuser};
GRANT SELECT ON targetcat TO ${readonlyuser};

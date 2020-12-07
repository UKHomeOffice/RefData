CREATE TABLE abusetypes (
  id INTEGER NOT NULL PRIMARY KEY,
  label VARCHAR(60) NOT NULL,
  person BOOLEAN NOT NULL,
  item BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE abusetypes IS '{"label": "Abuse type", "description": "A list of types of abuse", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN abusetypes.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN abusetypes.label IS '{"label": "Displayed label", "description": "label / description shown in data", "businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN abusetypes.person IS '{"label": "Applies to a person", "description": "Does this apply to a person", "summaryview": "true"}';
COMMENT ON COLUMN abusetypes.item IS '{"label": "Applies to an item", "description": "Does this apply to an item", "summaryview": "true"}';
COMMENT ON COLUMN abusetypes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN abusetypes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN abusetypes.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON abusetypes TO ${serviceuser};
GRANT SELECT ON abusetypes TO ${readonlyuser};

CREATE TABLE sex (
  id VARCHAR(1) NOT NULL PRIMARY KEY,
  name VARCHAR(20) NOT NULL UNIQUE,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE sex IS '{"label": "Sex", "description": "Sex reference list.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN sex.id IS '{"label": "Identifier", "description": "Character unique identity reference.","summaryview": "true", "aliases": "sexcharacter"}';
COMMENT ON COLUMN sex.name IS '{"label": "Name", "description": "The name of the sex.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN sex.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN sex.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN sex.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON sex TO ${anonuser};
GRANT SELECT, INSERT, UPDATE ON sex TO ${serviceuser};
GRANT SELECT ON sex TO ${readonlyuser};


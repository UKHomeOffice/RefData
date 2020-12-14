CREATE TABLE unit (
  id INTEGER NOT NULL PRIMARY KEY,
  unit VARCHAR(40) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE unit IS '{"label": "Units of Measure", "description": "A list of units of measure - level 1", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN unit.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN unit.unit IS '{"label": "Unit", "businesskey": "true", "description": "Type of unit", "businesskey": "true", "summaryview": "false"}';
COMMENT ON COLUMN unit.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN unit.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN unit.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON unit TO ${serviceuser};
GRANT SELECT ON unit TO ${readonlyuser};
GRANT SELECT ON unit TO ${anonuser};

CREATE TABLE unit (
  id INTEGER NOT NULL PRIMARY KEY, 
  unit VARCHAR(40) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE unit IS '{"label": "Units of Measure", "description": "A list of units of measure - level 1", "schemalastupdated": "15/07/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN unit.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN unit.unit IS '{"label": "Unit", "description": "Type of unit", "summaryview": "false"}';
COMMENT ON COLUMN unit.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN unit.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON unit TO ${serviceuser};
GRANT SELECT ON unit TO ${readonlyuser};
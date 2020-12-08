CREATE TABLE handlingconditions (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  description VARCHAR(300) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE handlingconditions IS '{"label": "Handling Conditions", "description": "How intelligence is handled", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN handlingconditions.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN handlingconditions.name IS '{"label": "Name", "description": "The name of the handling condition.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN handlingconditions.description IS '{"label": "Description", "description": "A short description of how the intelligence is handled for the condition.", "summaryview": "true"}';
COMMENT ON COLUMN handlingconditions.validfrom IS '{"label": "Valid from date", "description": "Handling condition valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN handlingconditions.validto IS '{"label": "Valid to date", "description": "Handling condition valid to date.", "summaryview": "false"}';
COMMENT ON COLUMN handlingconditions.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON handlingconditions TO ${serviceuser};
GRANT SELECT ON handlingconditions TO ${readonlyuser};

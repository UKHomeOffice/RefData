CREATE TABLE medicalassistance (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(35) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE medicalassistance IS '{"label": "Medical assistance", "description": "Difference types of medical assistance", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN medicalassistance.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN medicalassistance.name IS '{"label": "Type", "description": "Description of medical assistance options.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN medicalassistance.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN medicalassistance.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN medicalassistance.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON medicalassistance TO ${serviceuser};
GRANT SELECT ON medicalassistance TO ${readonlyuser};
GRANT SELECT ON medicalassistance TO ${anonuser};

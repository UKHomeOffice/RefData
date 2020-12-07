CREATE TABLE injurycause (
  id INTEGER NOT NULL PRIMARY KEY,
  injurycause VARCHAR(55) NOT NULL,
  description VARCHAR(100),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE injurycause IS '{"label": "Injury Type", "description": "Different types of Injury.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comment
COMMENT ON COLUMN injurycause.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN injurycause.injurycause IS '{"label": "Cause of injury", "description": "Common causes of workplace injuries and accidents.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN injurycause.description IS '{"label": "Description", "description": "Description of the cause of injury.", "summaryview": "true"}';
COMMENT ON COLUMN injurycause.validfrom IS '{"label": "Valid from date", "description": "Data valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN injurycause.validto IS '{"label": "Valid to date", "description": "Data valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN injurycause.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON injurycause TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON injurycause TO ${serviceuser};
GRANT SELECT ON injurycause TO ${readonlyuser};

CREATE TABLE servicelevelagreement (
  id INTEGER NOT NULL PRIMARY KEY,
  description VARCHAR(100),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE servicelevelagreement IS '{"label": "Service Level Agreement", "description": "Descriptions of activities related to SLAs.": "07/08/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN servicelevelagreement.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN servicelevelagreement.description IS '{"label": "Description", "description": "Description of the activity", "summaryview": "true"}';
COMMENT ON COLUMN servicelevelagreement.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN servicelevelagreement.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON servicelevelagreement TO ${serviceuser};
GRANT SELECT ON servicelevelagreement TO ${readonlyuser};

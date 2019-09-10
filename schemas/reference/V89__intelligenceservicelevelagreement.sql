CREATE TABLE intelligenceservicelevelagreement (
  id INTEGER NOT NULL PRIMARY KEY,
  description VARCHAR(200),
  limitinhours INTEGER,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE intelligenceservicelevelagreement IS '{"label": "Service Level Agreement", "description": "Descriptions of activities related to SLAs.", "schemalastupdated": "28/08/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN intelligenceservicelevelagreement.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN intelligenceservicelevelagreement.description IS '{"label": "Description", "description": "Description of the activity", "summaryview": "true"}';
COMMENT ON COLUMN intelligenceservicelevelagreement.limitinhours IS '{"label": Time Limit", "description": "The maximum time this activity must be completed in.", "summaryview": "true"}';
COMMENT ON COLUMN intelligenceservicelevelagreement.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN intelligenceservicelevelagreement.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON intelligenceservicelevelagreement TO ${serviceuser};
GRANT SELECT ON intelligenceservicelevelagreement TO ${readonlyuser};

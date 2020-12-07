CREATE TABLE intelligenceservicelevelagreement (
  id INTEGER NOT NULL PRIMARY KEY,
  description VARCHAR(200),
  limitinhours INTEGER,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE intelligenceservicelevelagreement IS '{"label": "Service Level Agreement", "description": "Descriptions of activities related to SLAs.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN intelligenceservicelevelagreement.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN intelligenceservicelevelagreement.description IS '{"label": "Description", "description": "Description of the activity", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN intelligenceservicelevelagreement.limitinhours IS '{"label": "Time Limit", "description": "The maximum time this activity must be completed in.", "summaryview": "true"}';
COMMENT ON COLUMN intelligenceservicelevelagreement.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN intelligenceservicelevelagreement.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN intelligenceservicelevelagreement.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON intelligenceservicelevelagreement TO ${serviceuser};
GRANT SELECT ON intelligenceservicelevelagreement TO ${readonlyuser};

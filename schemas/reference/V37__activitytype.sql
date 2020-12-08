CREATE TABLE activitytype (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(20),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE activitytype IS '{"label": "Activity", "description": "Clarification of the activity type.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN activitytype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN activitytype.type IS '{"label": "Activity type", "businesskey": true, "description": "Description of the activity type.", "summaryview": "true"}';
COMMENT ON COLUMN activitytype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN activitytype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN activitytype.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON activitytype TO ${serviceuser};
GRANT SELECT ON activitytype TO ${readonlyuser};

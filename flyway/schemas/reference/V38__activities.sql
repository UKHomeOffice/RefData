CREATE TABLE activities (
  id INT4 NOT NULL PRIMARY KEY,
  activity VARCHAR(40) NOT NULL,
  activitytypeid INT4 NOT NULL REFERENCES activities(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE activities IS '{"label": "Work related activities", "description": "A list of work related activities.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN activities.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN activities.activity IS '{"label": "Activity", "description": "A description of the activity.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN activities.activitytypeid IS '{"label": "Activity type ID", "businesskey": "true", "description": "Link to activity type entity.", "summaryview" : "false"}';
COMMENT ON COLUMN activities.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN activities.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN activities.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON activities TO ${serviceuser};
GRANT SELECT ON activities TO ${readonlyuser};

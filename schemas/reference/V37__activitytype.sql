CREATE TABLE activitytype (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(20),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE activitytype IS '{"label": "Activity", "description": "Clarification of the activity type.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN activitytype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN activitytype.type IS '{"label": "Activity type", "description": "Description of the activity type.", "summaryview": "true"}';
COMMENT ON COLUMN activitytype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN activitytype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON activitytype TO ${serviceuser};
GRANT SELECT ON activitytype TO ${readonlyuser};

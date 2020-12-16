CREATE TABLE activities (
  id INT4 NOT NULL PRIMARY KEY,
  activity VARCHAR(40) NOT NULL,
  activitytypeid INT4 NOT NULL REFERENCES activities(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE activities IS '{"label": "Work related activities", "description": "A list of work related activities.", "schemalastupdated": "14/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN activities.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN activities.activity IS '{"label": "Activity", "description": "A description of the activity.", "summaryview": "true"}';
COMMENT ON COLUMN activities.activitytypeid IS '{"label": "Activity type ID", "description": "Link to activity type entity.", "summaryview" : "false"}';
COMMENT ON COLUMN activities.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN activities.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON activities TO ${serviceuser};
GRANT SELECT ON activities TO ${readonlyuser};

CREATE TABLE teamlocations (
  id UUID NOT NULL PRIMARY KEY,
  teamid UUID NOT NULL REFERENCES team(id),
  locationid INT4 NOT NULL REFERENCES location(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE teamlocations IS '{"label": "Team locations", "description": "A list of team to location mappings.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN teamlocations.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN teamlocations.teamid IS '{"label": "Team ID", "description": "Link to team entity.", "summaryview" : "true"}';
COMMENT ON COLUMN teamlocations.locationid IS '{"label": "Location ID", "description": "Link to location entity.", "summaryview" : "true"}';
COMMENT ON COLUMN teamlocations.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN teamlocations.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON teamlocations TO ${serviceuser};
GRANT SELECT ON teamlocations TO ${readonlyuser};

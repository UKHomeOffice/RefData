CREATE TABLE technicalprojects (
  id UUID NOT NULL PRIMARY KEY,
  teamid UUID NOT NULL REFERENCES team(id),
  name VARCHAR(100) NOT NULL,
  code VARCHAR(10) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE technicalprojects IS '{"label": "Technical Projects", "description": "A list of technical projects and their associated teams.", "schemalastupdated": "02/05/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN technicalprojects.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN technicalprojects.name IS '{"label": "Name", "description": "The name of the project.", "summaryview": "true"}';
COMMENT ON COLUMN technicalprojects.teamid IS '{"label": "Team", "description": "The team the project belongs to.", "summaryview": "true"}';
COMMENT ON COLUMN technicalprojects.code IS '{"label": "Project code", "description": "The short code for the project.", "summaryview": "true"}';
COMMENT ON COLUMN technicalprojects.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN technicalprojects.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

GRANT SELECT ON technicalprojects TO ${serviceuser};
GRANT SELECT ON technicalprojects TO ${readonlyuser};

CREATE TABLE technicalprojects (
  id UUID NOT NULL PRIMARY KEY,
  teamid UUID NOT NULL REFERENCES team(id),
  name VARCHAR(100) NOT NULL,
  code VARCHAR(10) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE technicalprojects IS '{"label": "Technical Projects", "description": "A list of technical projects and their associated teams.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN technicalprojects.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN technicalprojects.name IS '{"label": "Name", "description": "The name of the project.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN technicalprojects.teamid IS '{"label": "Team", "description": "The team the project belongs to.", "summaryview": "true"}';
COMMENT ON COLUMN technicalprojects.code IS '{"label": "Project code", "businesskey": true, "description": "The short code for the project.", "summaryview": "true"}';
COMMENT ON COLUMN technicalprojects.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN technicalprojects.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN technicalprojects.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

GRANT SELECT,INSERT,UPDATE ON technicalprojects TO ${serviceuser};
GRANT SELECT ON technicalprojects TO ${readonlyuser};

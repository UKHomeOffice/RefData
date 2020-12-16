CREATE TABLE branch (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  directorateid INTEGER NOT NULL REFERENCES directorate(id),
  code VARCHAR(8) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE branch IS '{"label": "Branch/Region names", "description": "A list of different branches and regions, associated by directorate.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN branch.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN branch.name IS '{"label": "Name", "description": "The name of the branch or region.", "summaryview": "true", "aliases": "region"}';
COMMENT ON COLUMN branch.code IS '{"label": "Code", "description": "The code associated with the branch or region.", "summaryview": "true"}';
COMMENT ON COLUMN branch.directorateid IS '{"label": "Directorate ID", "description": "Link to directorate entity.", "summaryview" : "false"}';
COMMENT ON COLUMN branch.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN branch.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON branch TO ${serviceuser};
GRANT SELECT ON branch TO ${readonlyuser};

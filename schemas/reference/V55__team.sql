CREATE TABLE team (
  id UUID NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  code VARCHAR(100) NOT NULL,
  description TEXT,
  costcentrecode VARCHAR(50),
  parentteamid UUID REFERENCES team(id),
  regionalteam BOOLEAN NOT NULL,
  bffunctiontypeid UUID NOT NULL REFERENCES bffunctiontypes(id),
  ministryid INT4 NOT NULL REFERENCES ministry(id),
  departmentid INT4 NOT NULL REFERENCES department(id),
  directorateid INT4 REFERENCES directorate(id),
  branchid INT4 REFERENCES branch(id),
  divisionid INT4 REFERENCES division(id),
  commandid INT4 REFERENCES command(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE team IS '{"label": "Teams", "description": "A list of border force teams.", "schemalastupdated": "18/06/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN team.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN team.name IS '{"label": "Name", "description": "The name of the team.", "summaryview": "true"}';
COMMENT ON COLUMN team.code IS '{"label": "Code", "description": "The team code.", "summaryview": "true"}';
COMMENT ON COLUMN team.description IS '{"label": "Description", "description": "A description of the team.", "summaryview": "true"}';
COMMENT ON COLUMN team.costcentrecode IS '{"label": "Cost centre", "description": "The teams cost centre code.", "summaryview": "true"}';
COMMENT ON COLUMN team.parentteamid IS '{"label": "Parent Team ID", "description": "The unique ID of the parten team.", "summaryview": "false"}';
COMMENT ON COLUMN team.regionalteam IS '{"label": "Regional Team", "description": "Regional team?", "summaryview": "true"}';
COMMENT ON COLUMN team.bffunctiontypeid IS '{"label": "Function type ID", "description": "Link to border force functions entity.", "summaryview" : "false"}';
COMMENT ON COLUMN team.ministryid IS '{"label": "Ministry ID", "description": "Link to ministry entity.", "summaryview" : "false"}';
COMMENT ON COLUMN team.departmentid IS '{"label": "Department ID", "description": "Link to department entity.", "summaryview" : "false"}';
COMMENT ON COLUMN team.directorateid IS '{"label": "Directorate ID", "description": "Link to directorate entity.", "summaryview" : "false"}';
COMMENT ON COLUMN team.branchid IS '{"label": "Branch ID", "description": "Link to branch entity.", "summaryview" : "false"}';
COMMENT ON COLUMN team.divisionid IS '{"label": "Division ID", "description": "Link to division entity.", "summaryview" : "false"}';
COMMENT ON COLUMN team.commandid IS '{"label": "Command ID", "description": "Link to command entity.", "summaryview" : "false"}';
COMMENT ON COLUMN team.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN team.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON team TO ${serviceuser};
GRANT SELECT ON team TO ${readonlyuser};

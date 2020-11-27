CREATE TABLE command (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(100)  NOT NULL,
  divisionid INT4 NOT NULL REFERENCES division(id),
  code VARCHAR(8) NOT NULL,
  operationalcommand BOOLEAN NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE command IS '{"label": "Command list", "description": "A list of commands and their associated codes.", "schemalastupdated": "17/12/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN command.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN command.name IS '{"label": "Name", "description": "The name of the command.", "summaryview": "true"}';
COMMENT ON COLUMN command.code IS '{"label": "Code", "businesskey": true, "description": "The code of the command.", "summaryview": "true"}';
COMMENT ON COLUMN command.divisionid IS '{"label": "Division ID", "description": "Link to the division entity.", "summaryview" : "false"}';
COMMENT ON COLUMN command.operationalcommand IS '{"label": "Operational Command", "description": "Does this Command cover a geographic area containing ports?", "summaryview" : "false"}';
COMMENT ON COLUMN command.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN command.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON command TO ${serviceuser};
GRANT SELECT ON command TO ${readonlyuser};

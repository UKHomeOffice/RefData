CREATE TABLE command (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(100)  NOT NULL,
  divisionid INT4 NOT NULL REFERENCES division(id),
  code VARCHAR(8) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE command IS '{"description": "Command list", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN command.id IS '{"label": "Identifier", "description": "Unique identifying column", "summaryview": "false"}';
COMMENT ON COLUMN command.name IS '{"label": "Name", "description": "Name of command", "summaryview": "true"}';
COMMENT ON COLUMN command.code IS '{"label": "Code", "description": "Code of command", "summaryview": "true"}';
COMMENT ON COLUMN command.validfrom IS '{"label": "Valid from date", "description": "Item valid from date", "summaryview" : "false"}';
COMMENT ON COLUMN command.validto IS '{"label": "Valid to date", "description": "Item valid to date", "summaryview" : "false"}';
COMMENT ON COLUMN command.divisionid IS '{"label": "Division ID", "description": "Link to division entity", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON command TO ${serviceuser};
GRANT SELECT ON command TO ${readonlyuser};

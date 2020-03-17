CREATE TABLE terminal (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE terminal IS '{"label": "Terminals", "description": "A list of terminal options.", "schemalastupdated": "17/03/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN terminal.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN terminal.name IS '{"label": "Name", "description": "Name of the terminal.", "summaryview": "false"}';
COMMENT ON COLUMN terminal.validfrom IS '{"label": "Valid from date", "description": "Sub Location valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN terminal.validto IS '{"label": "Valid to date", "description": "Sub Location valid to date.", "summaryview" : "false"}';

-- Grants
GRANT SELECT ON sublocation TO ${anonuser};
GRANT SELECT ON sublocation TO ${serviceuser};
GRANT SELECT ON sublocation TO ${readonlyuser};
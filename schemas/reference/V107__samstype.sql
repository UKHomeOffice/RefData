CREATE TABLE samstype (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  description VARCHAR(100), 
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE samstype IS '{"label": "Types of Modern Slavery", "description": "A list of the types of modern slavery found in the UK.", "schemalastupdated": "09/04/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN samstype.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN samstype.name IS '{"label": "Name", "description": "Name of slavery type.", "summaryview": "true"}';
COMMENT ON COLUMN samstype.description IS '{"label": "Description", "description": "Description of the type of slavery.", "summaryview": "true"}';
COMMENT ON COLUMN terminal.validfrom IS '{"label": "Valid from date", "description": "Terminal valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN terminal.validto IS '{"label": "Valid to date", "description": "Terminal valid to date.", "summaryview" : "false"}';

-- Grants
GRANT SELECT ON terminal TO ${anonuser};
GRANT SELECT ON terminal TO ${serviceuser};
GRANT SELECT ON terminal TO ${readonlyuser};

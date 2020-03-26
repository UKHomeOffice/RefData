CREATE TABLE table_name (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(40),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE table_name IS '{"label":"xxxx", "description":"xxxx", "schemalastupdated": "xx/xx/xxxx", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN table_name.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN table_name.name IS '{"label": "xxxx Name", "description": "The name given to the table_name.", "summaryview": "true"}';
COMMENT ON COLUMN table_name.validfrom IS '{"label": "Valid from date", "description": "table_name valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN table_name.validto IS '{"label": "Valid to date", "description": "table_name valid to date.", "summaryview" : "false"}';

-- Grants
GRANT SELECT ON table_name TO ${anonuser};
GRANT SELECT ON table_name TO ${serviceuser};
GRANT SELECT ON table_name TO ${readonlyuser};

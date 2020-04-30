CREATE TABLE department (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  ministryid INTEGER NOT NULL REFERENCES ministry(id),
  code VARCHAR(8) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE department IS '{"label": "Department", "description": "A list of departments that make up the Home Office.", "schemalastupdated": "06/03/2019", "dataversion": 2}';
-- Column comments
COMMENT ON COLUMN department.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN department.name IS '{"label": "Department name", "description": "The name of the department.", "summaryview": "true"}';
COMMENT ON COLUMN department.code IS '{"label": "Department code", "description": "The code associated with the department.", "summaryview": "true"}';
COMMENT ON COLUMN department.ministryid IS '{"label": "Ministry ID", "description": "Link to ministry entity.", "summaryview" : "false"}';
COMMENT ON COLUMN department.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN department.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON department TO ${serviceuser};
GRANT SELECT ON department TO ${readonlyuser};

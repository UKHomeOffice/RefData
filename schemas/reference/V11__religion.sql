-- CHANGE name=init-religion-table
CREATE TABLE religion (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE religion IS '{"label": "Religion", "description": "A list of religious affiliations.", "schemalastupdated": "10/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN religion.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN religion.name IS '{"label": "Name", "description": "The name of the religion.", "summaryview": "true"}';
COMMENT ON COLUMN religion.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN religion.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON religion TO ${anonuser};
GRANT SELECT ON religion TO ${serviceuser};
GRANT SELECT ON religion TO ${readonlyuser};

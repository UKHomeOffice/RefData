CREATE TABLE relation (
  id INT4 NOT NULL PRIMARY KEY,
  relation VARCHAR(25) NOT NULL,
  description VARCHAR(100),
  family BOOL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE relation IS '{"label": "Relation", "description": "A list of relations to a specific party.", "schemalastupdated": "14/04/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN relation.id IS '{"label": "Identifier", "businesskey": true, "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN relation.relation IS '{"label": "Relation", "description": "Name of relation type", "summaryview": "true"}';
COMMENT ON COLUMN relation.description IS '{"label": "Description", "description": "Description of the relation", "summaryview": "true"}';
COMMENT ON COLUMN relation.family IS '{"label": "Family", "description": "Is the relation a family member?", "summaryview": "false"}';
COMMENT ON COLUMN relation.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN relation.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- Grants
GRANT SELECT ON relation TO ${anonuser};
GRANT SELECT ON relation TO ${serviceuser};
GRANT SELECT ON relation TO ${readonlyuser};

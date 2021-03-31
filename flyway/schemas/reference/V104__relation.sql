CREATE TABLE relation (
  id INT4 NOT NULL PRIMARY KEY,
  relation VARCHAR(25) NOT NULL,
  description VARCHAR(100),
  family BOOL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE relation IS '{"label": "Relation", "description": "A list of relations to a specific party.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN relation.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN relation.relation IS '{"label": "Relation", "description": "Name of relation type", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN relation.description IS '{"label": "Description", "description": "Description of the relation", "summaryview": "true"}';
COMMENT ON COLUMN relation.family IS '{"label": "Family", "description": "Is the relation a family member?", "summaryview": "false"}';
COMMENT ON COLUMN relation.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN relation.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN relation.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- Grants
GRANT SELECT ON relation TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON relation TO ${serviceuser};
GRANT SELECT ON relation TO ${readonlyuser};

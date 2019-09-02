CREATE TABLE outcomes (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  description VARCHAR(100),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE outcomes IS '{"label": "outcomes", "description": "The outcome of an event.", "schemalastupdated": "06/08/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN outcomes.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN outcomes.name IS '{"label": "Rating", "description": "A description of the outcome.", "summaryview": "true"}';
COMMENT ON COLUMN outcomes.description IS '{"label": "Description", "description": "A definition of the outcome.", "summaryview": "true"}';
COMMENT ON COLUMN outcomes.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN outcomes.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON outcomes TO ${serviceuser};
GRANT SELECT ON outcomes TO ${readonlyuser};

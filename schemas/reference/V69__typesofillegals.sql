CREATE TABLE typesofillegals (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  description TEXT,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE typesofillegals IS '{"label": "Types of illegals", "description": "A list of different types of illegal people.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN typesofillegals.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN typesofillegals.name IS '{"label": "Name", "description": "The type of illegal person.", "summaryview": "true"}';
COMMENT ON COLUMN typesofillegals.description IS '{"label": "Description", "description": "A description of the personal related crime.", "summaryview": "true"}';
COMMENT ON COLUMN typesofillegals.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN typesofillegals.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON typesofillegals TO ${anonuser};
GRANT SELECT ON typesofillegals TO ${serviceuser};
GRANT SELECT ON typesofillegals TO ${readonlyuser};

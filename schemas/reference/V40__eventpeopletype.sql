CREATE TABLE eventpeopletype (
  id INT4 NOT NULL PRIMARY KEY,
  type VARCHAR(20) NOT NULL,
  description VARCHAR(100) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE eventpeopletype IS '{"label": "Types of people", "description": "Types of people in an event.", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN eventpeopletype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN eventpeopletype.type IS '{"label": "People type", "description": "The category of people in the event.", "summaryview": "true"}';
COMMENT ON COLUMN eventpeopletype.description IS '{"label": "Description", "description": "A description of the people in the event.", "summaryview": "true"}';
COMMENT ON COLUMN eventpeopletype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN eventpeopletype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON eventpeopletype TO ${serviceuser};
GRANT SELECT ON eventpeopletype TO ${readonlyuser};

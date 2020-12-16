CREATE TABLE portsize (
  id INTEGER NOT NULL PRIMARY KEY,
  rating INTEGER NOT NULL,
  description VARCHAR(200) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE portsize IS '{"label": "Port Size", "description": "A scale categorizing the size of a port", "schemalastupdated": "01/08/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN portsize.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN portsize.rating IS '{"label": "Rating", "description": "Port Size Rating", "summaryview": "true"}';
COMMENT ON COLUMN portsize.description IS '{"label": "Description", "description": "A definition of the rating.", "summaryview": "false"}';
COMMENT ON COLUMN portsize.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN portsize.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON portsize TO ${serviceuser};
GRANT SELECT ON portsize TO ${readonlyuser};
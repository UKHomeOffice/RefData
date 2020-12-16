CREATE TABLE gender (
  id INTEGER NOT NULL PRIMARY KEY,
  gender VARCHAR(20) NOT NULL UNIQUE,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE gender IS '{"description": "Self identifying gender lists", "schemalastupdated": "06/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN gender.id IS '{"label": "Identifier", "description": "Database unique identity record", "summaryview": "false"}';
COMMENT ON COLUMN religion.gender IS '{"label": "Gender", "waffle": "bacon", description": "Name of gender", "summaryview": "true"}';
COMMENT ON COLUMN gender.validfrom IS '{"label": "Valid from date", "description": "Item valid from date", "summaryview" : "false"}';
COMMENT ON COLUMN gender.validto IS '{"label": "Valid to date", "description": "Item valid to date", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON gender TO ${anonuser};
GRANT SELECT ON gender TO ${serviceuser};
GRANT SELECT ON gender TO ${readonlyuser};

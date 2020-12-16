-- CHANGE name=init-ethnicity-table
CREATE TABLE ethnicity (
  id integer NOT NULL PRIMARY KEY,
  ethnicity VARCHAR(50) NOT NULL,
  subethnicity VARCHAR(50) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE ethnicity IS '{"label": "Ethnicity", "description": "A list of ethnicities and subethnicities.", "schemalastupdated": "10/03/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN ethnicity.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN ethnicity.ethnicity IS '{"label": "Ethnicity", "description": "The ethnicities high level descriptor.", "summaryview": "true"}';
COMMENT ON COLUMN ethnicity.subethnicity IS '{"label": "Sub Ethnicity", "description": "The ethnicities low level descriptor.", "summaryview": "true"}';
COMMENT ON COLUMN ethnicity.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN ethnicity.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON ethnicity TO ${anonuser};
GRANT SELECT ON ethnicity TO ${serviceuser};
GRANT SELECT ON ethnicity TO ${readonlyuser};

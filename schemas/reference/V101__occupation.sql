CREATE TABLE occupation (
  id INTEGER NOT NULL PRIMARY KEY,
  occupation VARCHAR(70) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE occupation IS '{"label": "occupation", "description": "A list of occupations as categorized by the Office for National Statistics", "schemalastupdated": "29/11/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN occupation.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN occupation.occupation IS '{"label": "occupation", "description": "The name of the occupation.", "summaryview": "true"}';
COMMENT ON COLUMN occupation.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN occupation.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON occupation TO ${anonuser};
GRANT SELECT ON occupation TO ${serviceuser};
GRANT SELECT ON occupation TO ${readonlyuser};

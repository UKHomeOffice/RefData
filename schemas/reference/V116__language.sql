CREATE TABLE language (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(80) NOT NULL,
  twolettercode VARCHAR(2),
  threelettercode VARCHAR(3),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE language IS '{"label": "Language", "description": "Standardised list of world languages.", "schemalastupdated": "21/07/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN language.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN language.name IS '{"label": "Name", "description": "The ISO language name.", "summaryview": "true"}';
COMMENT ON COLUMN language.twolettercode IS '{"label": "Two letter code", "description": "Two letter codes for the representation of names of languages.", "summaryview": "true"}';
COMMENT ON COLUMN language.threelettercode IS '{"label": "Three letter code", "description": "Three letter codes for the representation of names of languages.", "summaryview": "true"}';
COMMENT ON COLUMN language.validfrom IS '{"label": "Valid from date", "description": "Language valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN language.validto IS '{"label": "Valid to date", "description": "Language valid to date.", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON language TO ${anonuser};
GRANT SELECT ON language TO ${serviceuser};
GRANT SELECT ON language TO ${readonlyuser};

CREATE TABLE language (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(80) NOT NULL,
  twolettercode VARCHAR(2),
  threelettercode VARCHAR(3),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE language IS '{"label": "Language", "description": "Standardised list of world languages.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN language.id IS '{"label": "Identifier", "businesskey": true, "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN language.name IS '{"label": "Name", "description": "The ISO language name.", "summaryview": "true"}';
COMMENT ON COLUMN language.twolettercode IS '{"label": "Two letter code", "description": "Two letter codes for the representation of names of languages.", "summaryview": "true"}';
COMMENT ON COLUMN language.threelettercode IS '{"label": "Three letter code", "description": "Three letter codes for the representation of names of languages.", "summaryview": "true"}';
COMMENT ON COLUMN language.validfrom IS '{"label": "Valid from date", "description": "Language valid from date.", "summaryview": "false"}';
COMMENT ON COLUMN language.validto IS '{"label": "Valid to date", "description": "Language valid to date.", "summaryview": "false"}';
COMMENT ON COLUMN language.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON language TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON language TO ${serviceuser};
GRANT SELECT ON language TO ${readonlyuser};

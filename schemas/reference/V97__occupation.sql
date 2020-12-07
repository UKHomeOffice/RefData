CREATE TABLE occupation (
  id INTEGER NOT NULL PRIMARY KEY,
  occupation VARCHAR(70) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE occupation IS '{"label": "Occupation", "description": "A list of occupations as categorized by the Office for National Statistics", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN occupation.id IS '{"label": "Identifier", "description": "Database unique identity record.", "summaryview": "false"}';
COMMENT ON COLUMN occupation.occupation IS '{"label": "Occupation", "description": "The name of the occupation.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN occupation.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN occupation.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN occupation.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON occupation TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON occupation TO ${serviceuser};
GRANT SELECT ON occupation TO ${readonlyuser};

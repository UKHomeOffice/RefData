-- CHANGE name=init-ethnicity-table
CREATE TABLE ethnicity (
  id integer NOT NULL PRIMARY KEY,
  ethnicity VARCHAR(50) NOT NULL,
  subethnicity VARCHAR(50) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE ethnicity IS '{"label": "Ethnicity", "description": "A list of ethnicities and subethnicities.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN ethnicity.id IS '{"label": "Identifier", "description": "Database unique identity record.", "businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN ethnicity.ethnicity IS '{"label": "Ethnicity", "businesskey": true, "description": "The ethnicities high level descriptor.", "summaryview": "true"}';
COMMENT ON COLUMN ethnicity.subethnicity IS '{"label": "Sub Ethnicity", "description": "The ethnicities low level descriptor.", "summaryview": "true"}';
COMMENT ON COLUMN ethnicity.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN ethnicity.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN ethnicity.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT, INSERT, UPDATE ON ethnicity TO ${anonuser};
GRANT SELECT ON ethnicity TO ${serviceuser};
GRANT SELECT ON ethnicity TO ${readonlyuser};

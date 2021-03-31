CREATE TABLE lockup (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT NOT NULL,
  lockuptypeid INT4 NOT NULL REFERENCES lockuptype(id),
  locationid INT4 NOT NULL REFERENCES location(id),
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE lockup IS '{"label": "Seizure lockup types", "description": "A list of seizure lockup types and their descriptions.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN lockup.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN lockup.name IS '{"label": "Name", "description": "The name of the lockup.", "businesskey": "true", "summaryview": "true"}';
COMMENT ON COLUMN lockup.description IS '{"label": "Description", "description": "A description of the lockup.", "summaryview": "true"}';
COMMENT ON COLUMN lockup.lockuptypeid IS '{"label": "Lockup type ID", "description": "Link to lockup type entity.", "summaryview" : "false"}';
COMMENT ON COLUMN lockup.locationid IS '{"label": "Location ID", "description": "Link to location entity.", "summaryview" : "false"}';
COMMENT ON COLUMN lockup.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN lockup.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN lockup.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT,INSERT,UPDATE ON lockup TO ${serviceuser};
GRANT SELECT ON lockup TO ${readonlyuser};

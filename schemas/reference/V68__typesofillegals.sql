CREATE TABLE typesofillegals (
  id INT4 NOT NULL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE typesofillegals IS '{"label": "Types of illegals", "description": "A list of different types of illegal people.", "owner": "cop@homeoffice.gov.uk", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN typesofillegals.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN typesofillegals.name IS '{"label": "Name", "description": "The type of illegal person.", "businesskey": true, "summaryview": "true"}';
COMMENT ON COLUMN typesofillegals.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN typesofillegals.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN typesofillegals.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON typesofillegals TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON typesofillegals TO ${serviceuser};
GRANT SELECT ON typesofillegals TO ${readonlyuser};

CREATE TABLE clearancetype (
  id UUID NOT NULL PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  description TEXT,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE,
  updatedby VARCHAR(60) NULL
);

-- Table comment
COMMENT ON TABLE clearancetype IS '{"label": "Clearance types", "description": "A list of security clearance types.", "owner": "xyx@test.com", "schemalastupdated": "03/12/2020", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN clearancetype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "businesskey": true, "summaryview": "false"}';
COMMENT ON COLUMN clearancetype.name IS '{"label": "Name", "businesskey": true, "description": "The name/Level of security clearance.", "summaryview": "true"}';
COMMENT ON COLUMN clearancetype.description IS '{"label": "Description", "description": "A description of the security clearance.", "summaryview": "true"}';
COMMENT ON COLUMN clearancetype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN clearancetype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';
COMMENT ON COLUMN clearancetype.updatedby IS '{"label": "Updated By", "description": "Record updated by", "summaryview": "false"}';

-- GRANTs
GRANT SELECT ON clearancetype TO ${anonuser};
GRANT SELECT,INSERT,UPDATE ON clearancetype TO ${serviceuser};
GRANT SELECT ON clearancetype TO ${readonlyuser};

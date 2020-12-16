CREATE TABLE clearancetype (
  id UUID NOT NULL PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  description TEXT,
  validfrom TIMESTAMP WITH TIME ZONE,
  validto TIMESTAMP WITH TIME ZONE
);

-- Table comment
COMMENT ON TABLE clearancetype IS '{"label": "Clearance types", "description": "A list of security clearance types.", "schemalastupdated": "02/05/2019", "dataversion": 1}';
-- Column comments
COMMENT ON COLUMN clearancetype.id IS '{"label": "Identifier", "description": "Unique identifying column.", "summaryview": "false"}';
COMMENT ON COLUMN clearancetype.name IS '{"label": "Name", "description": "The name/Level of security clearance.", "summaryview": "true"}';
COMMENT ON COLUMN clearancetype.description IS '{"label": "Description", "description": "A description of the security clearance.", "summaryview": "true"}';
COMMENT ON COLUMN clearancetype.validfrom IS '{"label": "Valid from date", "description": "Item valid from date.", "summaryview" : "false"}';
COMMENT ON COLUMN clearancetype.validto IS '{"label": "Valid to date", "description": "Item valid to date.", "summaryview" : "false"}';

-- GRANTs
GRANT SELECT ON clearancetype TO ${anonuser};
GRANT SELECT ON clearancetype TO ${serviceuser};
GRANT SELECT ON clearancetype TO ${readonlyuser};
